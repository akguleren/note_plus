part of 'note_view_model.dart';

class NoteNotifier {
  static final vm = _noteViewModelProvider;
  static final note = _noteProvider;
}

@riverpod
class _Note extends _$Note {
  @override
  Future<List<NoteModel>> build() async {
    final notes = await getNotes();
    return notes;
  }

  // Delete a note (local + remote when possible)
  Future<void> deleteNoteByModel(NoteModel note) async {
    await ref.read(noteRepositoryProvider).deleteNote(note);
    ref.invalidateSelf();
  }

  Future<List<NoteModel>> getNotes() async {
    try {
      // Always get notes from local storage for immediate loading
      final response = await ref.read(noteRepositoryProvider).fetchNotes();
      return response;
    } catch (e) {
      return [];
    }
  }

  Future<void> forceSync() async {
    try {
      final syncService = ref.read(syncServiceProvider);
      await syncService.forcSync();
      // Refresh notes after sync
      ref.invalidateSelf();
    } catch (e) {
      // Handle sync error gracefully
      if (kDebugMode) {
        print('Sync failed: $e');
      }
    }
  }

  void saveNote(NoteModel note) {
    if (note.title.isNotEmpty || note.content.isNotEmpty) {
      if (note.id == null) {
        ref.read(noteRepositoryProvider).createNote(note);
      } else {
        ref.read(noteRepositoryProvider).updateNote(note);
      }
    }
    ref.invalidateSelf();
  }
}
