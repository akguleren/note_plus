import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:note_plus/app/extension/ref_extension.dart';
import 'package:note_plus/app/init/navigation/navigation_route.dart';
import 'package:note_plus/feature/auth/login/viewmodel/login_view_model.dart';
import 'package:note_plus/feature/auth/service/repository/auth_repository.dart';
import 'package:note_plus/feature/settings/viewmodel/settings_view_model.dart';
import 'package:note_plus/main.dart';

@RoutePage()
class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsViewState();
}

class _SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(LoginNotifier.currentUser);
    final vm = ref.watch(SettingsNotifier.vm.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('Settings.Title'),
          style: ref.textTheme.headline6.copyWith(color: ref.colorTokens.text?.primary),
        ),
      ),
      backgroundColor: ref.colorTokens.background?.primary,
      body: userState.maybeWhen(
        data: (user) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: ref.colorTokens.background?.bgIcon,
                child: user?.photoURL != null
                    ? Image.network(user!.photoURL!)
                    : Icon(TablerIcons.user, color: ref.colorTokens.text?.primary),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              user != null ? user.email ?? '-' : 'Guest',
              style: ref.textTheme.headline7.copyWith(color: ref.colorTokens.text?.primary),
            ),

            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: ref.padding16,
              padding: ref.padding16,
              decoration: BoxDecoration(color: ref.colorTokens.surface?.primary, borderRadius: ref.borderRadius12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Visibility(
                    visible: user != null,
                    child: buildMenuItem(
                      icon: TablerIcons.lock,
                      title: tr('Settings.ChangePassword'),
                      onTap: vm.navigateToForgotPassword,
                    ),
                  ),
                  Visibility(visible: user != null, child: const Divider(height: 32)),
                  buildMenuItem(icon: TablerIcons.palette, title: tr('Settings.ChangeTheme'), onTap: vm.changeTheme),
                  const Divider(height: 32),
                  buildMenuItem(
                    icon: TablerIcons.language,
                    title: tr('Settings.ChangeLanguage'),
                    onTap: vm.changeLanguage,
                  ),
                  const Divider(height: 32),
                  user == null ? loginButton() : logoutButton(),
                ],
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        orElse: () => const SizedBox(),
      ),
    );
  }

  InkWell loginButton() {
    return InkWell(
      onTap: () => appRouter.push(const LoginRoute()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(TablerIcons.login, color: ref.commonColors.brand?.main),
          const SizedBox(width: 8),
          Text(tr('Login.Login'), style: ref.textTheme.body3.copyWith(color: ref.commonColors.brand?.main)),
        ],
      ),
    );
  }

  GestureDetector logoutButton() {
    return GestureDetector(
      onTap: () => ref.read(authRepositoryProvider).logout(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(TablerIcons.logout, color: ref.colorTokens.status?.icon?.danger),
          const SizedBox(width: 8),
          Text(tr('Settings.Logout'), style: ref.textTheme.body3.copyWith(color: ref.colorTokens.status?.text?.danger)),
        ],
      ),
    );
  }

  Widget buildMenuItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: ref.colorTokens.text?.primary),
            const SizedBox(width: 8),
            Text(title, style: ref.textTheme.body3.copyWith(color: ref.colorTokens.text?.primary)),
          ],
        ),
      ),
    );
  }
}
