import 'package:auto_route/auto_route.dart';
import 'package:note_plus/app/init/navigation/custom_bottom_sheet_route.dart';
import 'package:note_plus/feature/splash/view/splash_view.dart';
import 'package:note_plus/feature/home/view/home_view.dart';
import 'package:note_plus/feature/auth/login/view/login_view.dart';
import 'package:note_plus/feature/auth/sign_up/view/sign_up_view.dart';
import 'package:note_plus/feature/auth/change_password/view/change_password_view.dart';
import 'package:note_plus/feature/settings/view/settings_view.dart';
import 'package:note_plus/feature/note/view/note_view.dart';
import 'package:note_plus/widgets/language/language_bottom_sheet.dart';
import 'package:note_plus/feature/note/model/note_model.dart';
import 'package:flutter/material.dart';

part 'navigation_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: SignUpRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: NoteRoute.page),
    CustomRouteBottomSheet(page: LanguageBottomSheetRoute.page),
  ];
}
