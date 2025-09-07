import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_plus/feature/note/model/note_model.dart';

class HiveService {
  static const String _noteBoxName = 'notes';

  /// Get the notes box (should already be initialized by HivePrimitiveManager)
  static Box<NoteModel> get noteBox {
    try {
      return Hive.box<NoteModel>(_noteBoxName);
    } catch (e) {
      throw Exception('Notes box is not initialized. Make sure HivePrimitiveManager.init() is called first.');
    }
  }

  /// Save a note to local storage
  static Future<void> saveNote(NoteModel note) async {
    final box = noteBox;
    if (note.id != null) {
      await box.put(note.id, note);
    } else {
      // Generate a unique key if id is null
      final key = DateTime.now().millisecondsSinceEpoch.toString();
      await box.put(key, note);
    }
  }

  /// Get a note by id
  static NoteModel? getNote(String id) {
    final box = noteBox;
    return box.get(id);
  }

  /// Get all notes
  static List<NoteModel> getAllNotes() {
    final box = noteBox;
    return box.values.toList();
  }

  /// Delete a note by id
  static Future<void> deleteNote(String id) async {
    final box = noteBox;
    await box.delete(id);
  }

  /// Update a note
  static Future<void> updateNote(String id, NoteModel note) async {
    final box = noteBox;
    await box.put(id, note);
  }

  /// Clear all notes
  static Future<void> clearAllNotes() async {
    final box = noteBox;
    await box.clear();
  }

  /// Check if a note exists
  static bool noteExists(String id) {
    final box = noteBox;
    return box.containsKey(id);
  }

  /// Get notes count
  static int getNotesCount() {
    final box = noteBox;
    return box.length;
  }

  /// Close the Hive boxes (should be called when app is closing)
  static Future<void> close() async {
    final box = Hive.box<NoteModel>(_noteBoxName);
    if (box.isOpen) {
      await box.close();
    }
  }
}
