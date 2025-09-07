import 'package:equatable/equatable.dart';
import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/app/init/theme/theme_notifier.dart';
import 'package:note_plus/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ettings_notifier.dart';
part 'settings_view_model.g.dart';

@riverpod
class _SettingsViewModel extends _$SettingsViewModel {
  @override
  SettingsState build() => const SettingsState();

  void navigateToForgotPassword() {
    appRouter.push(const ChangePasswordRoute());
  }

  void changeTheme() {
    ref.read(themeNotifierProvider.notifier).toggleTheme();
  }

  void changeLanguage() {
    appRouter.push(const LanguageBottomSheetRoute());
  }
}

class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [];

  SettingsState copyWith() {
    return const SettingsState();
  }
}
