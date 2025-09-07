import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/feature/note/viewmodel/note_view_model.dart';
import 'package:note_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_notifier.dart';
part 'splash_view_model.g.dart';

@riverpod
class _SplashViewModel extends _$SplashViewModel {
  @override
  void build() {}

  Future<void> setup() async {
    await Future.delayed(const Duration(seconds: 2));

    // Pre-load notes to ensure they're available when home screen opens
    try {
      ref.invalidate(NoteNotifier.note);
    } catch (e) {
      // Ignore errors during pre-loading
    }

    appRouter.replaceAll([const HomeRoute()]);
  }
}
