import 'dart:developer';

import 'package:note_plus/app/constant/hive_key.dart';
import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/feature/note/model/note_model.dart';
import 'package:note_plus/feature/note/service/sync_service.dart';
import 'package:note_plus/feature/note/viewmodel/note_view_model.dart';
import 'package:note_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';
part 'home_notifier.dart';

@riverpod
class _HomeViewModel extends _$HomeViewModel {
  @override
  void build() {}

  void navigateToSettings() {
    HiveKey.notes.delete;
    appRouter.push(const SettingsRoute());
  }

  void navigateNewNote() {
    appRouter.push(NoteRoute());
  }

  void navigateEditNote(NoteModel note) {
    appRouter.push(NoteRoute(note: note));
  }

  Future<void> forceSync() async {
    try {
      final syncService = ref.read(syncServiceProvider);
      await syncService.forcSync();

      // Refresh notes after sync
      ref.invalidate(NoteNotifier.note);
    } catch (e) {
      log('Failed to sync: $e');
    }
  }
}
