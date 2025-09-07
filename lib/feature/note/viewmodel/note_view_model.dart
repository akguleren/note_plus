import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:note_plus/app/constant/hive_key.dart';
import 'package:note_plus/feature/note/model/note_model.dart';
import 'package:note_plus/feature/note/service/repository/note_repository.dart';
import 'package:note_plus/feature/note/service/sync_service.dart';
import 'package:note_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'note_notifier.dart';
part 'note_view_model.g.dart';

@riverpod
class _NoteViewModel extends _$NoteViewModel {
  @override
  _NoteState build() => _NoteState();

  void saveAndExit(GlobalKey<FormBuilderState> formKey, NoteModel? note) {
    formKey.currentState?.save();
    final raw = formKey.currentState!.value;
    if (note == null && (raw['title']?.isEmpty == true && raw['content']?.isEmpty == true)) {
      appRouter.pop();
      return;
    }
    if (note != null) {
      // Update existing note
      final updatedNote = note
          .copyWith(
            title: (raw['title'] as String?)?.trim() ?? note.title,
            content: (raw['content'] as String?)?.trim() ?? note.content,
          )
          .touch();
      ref.read(NoteNotifier.note.notifier).saveNote(updatedNote);
    } else {
      // Create new note
      final newNote = NoteModel(
        title: (raw['title'] as String?)?.trim() ?? '',
        content: (raw['content'] as String?)?.trim() ?? '',
      );
      ref.read(NoteNotifier.note.notifier).saveNote(newNote);
    }
    if (note == null && (raw['title']?.isNotEmpty == true && raw['content']?.isNotEmpty == true)) {}
    appRouter.pop();
  }
}

class _NoteState {
  _NoteState();

  _NoteState copyWith() {
    return _NoteState();
  }
}
