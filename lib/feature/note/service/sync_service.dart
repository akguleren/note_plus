import 'dart:async';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/feature/note/service/repository/note_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_service.g.dart';

@riverpod
SyncService syncService(Ref ref) => SyncService(ref.watch(noteRepositoryProvider));

class SyncService {
  final NoteRepository _noteRepository;
  Timer? _syncTimer;
  Timer? _connectivityCheckTimer;
  bool _isDisposed = false;
  bool _wasConnected = true;

  SyncService(this._noteRepository);

  /// Check internet connectivity by attempting a simple HTTP request
  Future<bool> _hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void startPeriodicSync() {
    if (_isDisposed) return;

    // Sync every 30 seconds when connected
    _syncTimer = Timer.periodic(const Duration(seconds: 30), (timer) async {
      if (_isDisposed) {
        timer.cancel();
        return;
      }

      if (await _hasInternetConnection()) {
        _noteRepository.syncWithApi();
      }
    });

    // Check connectivity every 1 minute to detect connection changes
    _connectivityCheckTimer = Timer.periodic(const Duration(minutes: 1), (timer) async {
      if (_isDisposed) {
        timer.cancel();
        return;
      }

      final isConnected = await _hasInternetConnection();

      // If we just got connected, trigger sync
      if (isConnected && !_wasConnected) {
        _noteRepository.syncWithApi();
      }

      _wasConnected = isConnected;
    });

    // Initial sync check
    _checkInitialConnection();
  }

  void _checkInitialConnection() async {
    if (_isDisposed) return;

    final isConnected = await _hasInternetConnection();
    if (isConnected) {
      _noteRepository.syncWithApi();
    }
    _wasConnected = isConnected;
  }

  void stopPeriodicSync() {
    _isDisposed = true;
    _syncTimer?.cancel();
    _connectivityCheckTimer?.cancel();
  }

  Future<void> forcSync() async {
    if (_isDisposed) return;
    await _noteRepository.syncWithApi();
  }

  void dispose() {
    stopPeriodicSync();
  }
}
