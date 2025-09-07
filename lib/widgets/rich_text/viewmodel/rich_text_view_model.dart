import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rich_text_view_model.g.dart';

@riverpod
class RichTextViewModel extends _$RichTextViewModel {
  @override
  RichTextState build() => const RichTextState();

  void changeLeftButtonVisibility() {
    state = state.copyWith(showToolbar: !state.showLeftButton);
  }

  void changeRightButtonVisibility() {
    state = state.copyWith(showToolbar: !state.showRightButton);
  }

  void changeToolbarVisibility() {
    state = state.copyWith(showToolbar: !state.showToolbar);
  }
}

class RichTextState {
  final bool showRightButton;
  final bool showLeftButton;
  final bool showToolbar;
  const RichTextState({this.showLeftButton = false, this.showRightButton = false, this.showToolbar = false});

  RichTextState copyWith({bool? showRightButton, bool? showLeftButton, bool? showToolbar}) {
    return RichTextState(
      showRightButton: showRightButton ?? this.showRightButton,
      showLeftButton: showLeftButton ?? this.showLeftButton,
      showToolbar: showToolbar ?? this.showToolbar,
    );
  }
}
