# Note Repository with API Sync

This repository provides offline-first note storage with automatic synchronization to an external API when connected to the internet.

## API Endpoints

The repository expects your API to provide these endpoints:

- `GET /notes` → list user's notes
- `POST /notes` → create a note  
- `PUT /notes/{id}` → update a note
- `DELETE /notes/{id}` → delete a note

## Configuration

Update the `_baseUrl` constant in `note_repository.dart` with your actual API URL:

```dart
static const String _baseUrl = 'https://your-api-url.com/api';
```

## Usage Example

```dart
// In your widget or controller
class NotesController extends StateNotifier<AsyncValue<List<NoteModel>>> {
  final NoteRepository _noteRepository;
  final SyncService _syncService;

  NotesController(this._noteRepository, this._syncService) 
    : super(const AsyncValue.loading()) {
    // Start periodic sync when controller is created
    _syncService.startPeriodicSync();
    loadNotes();
  }

  Future<void> loadNotes() async {
    state = const AsyncValue.loading();
    try {
      final notes = await _noteRepository.fetchNotes();
      state = AsyncValue.data(notes);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> createNote(NoteModel note) async {
    await _noteRepository.createNote(note);
    await loadNotes(); // Refresh the list
  }

  Future<void> updateNote(NoteModel note) async {
    await _noteRepository.updateNote(note);
    await loadNotes(); // Refresh the list
  }

  Future<void> deleteNote(String noteId) async {
    await _noteRepository.deleteNote(noteId);
    await loadNotes(); // Refresh the list
  }

  Future<void> forceSync() async {
    await _syncService.forcSync();
    await loadNotes(); // Refresh the list
  }

  @override
  void dispose() {
    _syncService.stopPeriodicSync();
    super.dispose();
  }
}

// Provider
final notesControllerProvider = StateNotifierProvider<NotesController, AsyncValue<List<NoteModel>>>((ref) {
  return NotesController(
    ref.watch(noteRepositoryProvider),
    ref.watch(syncServiceProvider),
  );
});
```

## Features

- **Offline-first**: Always saves to local storage (Hive) first
- **Automatic sync**: Syncs with API when internet is available
- **Conflict resolution**: Uses timestamp comparison to resolve conflicts
- **Periodic sync**: Automatically syncs every 5 minutes
- **Connectivity-aware**: Triggers sync when connection is restored
- **Error handling**: Graceful handling of network failures

## Sync Strategy

The sync process handles three scenarios:

1. **Notes exist in both local and API**: Uses the one with the latest `updatedAt` timestamp
2. **Notes only exist locally**: Uploads to API
3. **Notes only exist in API**: Downloads to local storage

This ensures data consistency while preserving user changes made offline.
