import 'dart:developer' as dev;
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/app/constant/hive_key.dart';
import 'package:note_plus/app/init/network/dio_client.dart';
import 'package:note_plus/feature/note/model/note_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'note_repository.g.dart';

@riverpod
NoteRepository noteRepository(Ref ref) => NoteRepositoryImpl(ref.watch(dioClientProvider));

abstract class NoteRepository {
  Future<void> createNote(NoteModel note);
  Future<void> updateNote(NoteModel payload);
  Future<void> deleteNote(NoteModel note); // updated signature
  Future<List<NoteModel>> fetchNotes();
  Future<void> syncWithApi();
}

class NoteRepositoryImpl implements NoteRepository {
  final DioClient _dio;

  NoteRepositoryImpl(this._dio);

  Future<bool> _isConnected() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  bool _hasCurrentUser() {
    return HiveKey.token.get != null ? FirebaseAuth.instance.currentUser != null : false;
  }

  @override
  Future<void> createNote(NoteModel note) async {
    // Always save locally first
    final current = HiveKey.notes.get?['local'] ?? <NoteModel>[];

    // Find existing note by ID (if ID is not null) or by content similarity
    int existingIndex = -1;
    if (note.id != null) {
      existingIndex = current.indexWhere((e) => e.id == note.id);
    } else {
      // For notes without ID, check if a similar note exists to avoid duplicates
      existingIndex = current.indexWhere((e) => e.id == null && e.title == note.title && e.content == note.content);
    }

    if (existingIndex != -1) {
      current[existingIndex] = note.touch();
    } else {
      current.add(note);
    }

    await HiveKey.notes.save({'local': current});
  }

  @override
  Future<void> updateNote(NoteModel payload) async {
    // Update locally
    final current = HiveKey.notes.get?['local'] ?? <NoteModel>[];
    final updatedList = current.map((e) {
      // Match by ID if both have IDs, otherwise skip updating
      if (payload.id != null && e.id == payload.id) {
        return payload.touch();
      }
      return e;
    }).toList();

    await HiveKey.notes.save({'local': updatedList});

    // Sync with API if connected and user is authenticated (only if note has an ID)
    if (await _isConnected() && _hasCurrentUser() && payload.id != null) {
      try {
        await _dio.put('/notes/${payload.id}', payload: payload.toJson());
      } catch (e) {
        dev.log('Failed to update note in API: $e');
      }
    }
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    // Delete locally (handle notes with or without id)
    final current = HiveKey.notes.get?['local'] ?? <NoteModel>[];
    final updatedList = current.where((e) {
      if (note.id != null) {
        return e.id != note.id; // remove by id
      }
      // For local-only notes (id == null) match by fields unlikely to collide
      return !(e.id == null && e.title == note.title && e.content == note.content && e.createdAt == note.createdAt);
    }).toList();
    await HiveKey.notes.save({'local': updatedList});

    // Delete from API if connected and user is authenticated and note has id
    if (note.id != null && await _isConnected() && _hasCurrentUser()) {
      try {
        await _dio.delete('/notes/${note.id}');
      } catch (e) {
        dev.log('Failed to delete note from API: $e');
      }
    }
  }

  @override
  Future<List<NoteModel>> fetchNotes() async {
    if (!await _isConnected() || !_hasCurrentUser()) return HiveKey.notes.get?['local'] ?? <NoteModel>[];
    final response = await _dio.get('/notes');
    return (response.data as List).map((e) => NoteModel.fromJson(e)).toList();
  }

  @override
  Future<void> syncWithApi() async {
    // 1. Preconditions: must be online & authenticated
    if (!await _isConnected() || !_hasCurrentUser()) return;

    // 2. Read current local notes (may contain notes without an id)
    final localNotes = HiveKey.notes.get?['local'] ?? <NoteModel>[];

    // 3. Find notes that exist only locally (id == null) and push them to API
    final unsyncedNotes = localNotes.where((e) => e.id == null).toList();
    for (final note in unsyncedNotes) {
      try {
        await _dio.post('/notes', payload: note.toJson());
      } catch (e) {
        dev.log('syncWithApi: failed to create local-only note -> $e');
      }
    }

    // 4. Fetch authoritative list from server
    try {
      final response = await _dio.get('/notes');
      final data = response.data; // Expecting a List<dynamic> of note json
      if (data is List) {
        final remoteNotes = <NoteModel>[];
        for (final item in data) {
          if (item is Map<String, dynamic>) {
            try {
              remoteNotes.add(NoteModel.fromJson(item));
            } catch (e) {
              dev.log('syncWithApi: failed to parse note item -> $e');
            }
          }
        }

        // 5. Replace local storage entirely with remote list (authoritative)
        await HiveKey.notes.save({'local': remoteNotes});
      } else {
        dev.log('syncWithApi: unexpected data type from /notes (${data.runtimeType})');
      }
    } catch (e) {
      dev.log('syncWithApi: failed to fetch remote notes -> $e');
    }
  }
}
