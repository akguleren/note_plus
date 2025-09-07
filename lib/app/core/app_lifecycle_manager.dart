import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_plus/feature/note/service/sync_service.dart';

/// Manages app-wide lifecycle events and services
class AppLifecycleManager extends ConsumerStatefulWidget {
  final Widget child;

  const AppLifecycleManager({super.key, required this.child});

  @override
  ConsumerState<AppLifecycleManager> createState() => _AppLifecycleManagerState();
}

class _AppLifecycleManagerState extends ConsumerState<AppLifecycleManager> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Initialize sync service when app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeSyncService();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    // Stop sync service when app is disposed
    _disposeSyncService();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        // App became active - force sync to get latest data
        _onAppResumed();
        break;
      case AppLifecycleState.paused:
        // App went to background - opportunity to sync before sleeping
        _onAppPaused();
        break;
      case AppLifecycleState.detached:
        // App is being terminated
        _disposeSyncService();
        break;
      default:
        break;
    }
  }

  void _initializeSyncService() {
    try {
      final syncService = ref.read(syncServiceProvider);
      syncService.startPeriodicSync();

      if (kDebugMode) {
        print('🔄 Sync service initialized and started');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to initialize sync service: $e');
      }
    }
  }

  void _disposeSyncService() {
    try {
      // Note: We don't call ref.read() here during dispose as the provider
      // might already be disposed. The SyncService will be garbage collected
      // and its dispose() method should handle cleanup if needed.

      if (kDebugMode) {
        print('🛑 Sync service disposal initiated');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Error during sync service disposal: $e');
      }
    }
  }

  void _onAppResumed() {
    try {
      final syncService = ref.read(syncServiceProvider);
      syncService.forcSync();

      if (kDebugMode) {
        print('📱 App resumed - forced sync initiated');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to sync on app resume: $e');
      }
    }
  }

  void _onAppPaused() {
    try {
      final syncService = ref.read(syncServiceProvider);
      syncService.forcSync();

      if (kDebugMode) {
        print('⏸️ App paused - forced sync initiated');
      }
    } catch (e) {
      if (kDebugMode) {
        print('❌ Failed to sync on app pause: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
