import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_quill/flutter_quill.dart';
import '/app/constant/global_key_constant.dart';
import '/app/enums/locale_enum.dart';
import '/app/init/app_initialize.dart';
import '/app/init/navigation/navigation_route.dart';
import '/app/init/theme/dark/app_theme_dark.dart';
import '/app/init/theme/light/app_theme_light.dart';
import '/app/init/theme/theme_notifier.dart';
import '/app/utility/http_overrides.dart';
import '/app/core/app_lifecycle_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appRouter = AppRouter(navigatorKey: GlobalKeyConstant.navigatorKey);

void main() {
  HttpOverrides.global = MyHttpOverrides();

  AppInitialize().initRunApp(
    EasyLocalization(
      path: 'assets/locales',
      fallbackLocale: LocaleEnum.tr.code,
      useOnlyLangCode: true,
      supportedLocales: LocaleEnum.values.map((e) => e.code).toList(),
      child: const MyApp(),
    ),
    () async => {await dotenv.load(fileName: kDebugMode ? 'env/.env' : 'env/.env.prod')},
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);
    return AppLifecycleManager(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(navigatorObservers: () => [AutoRouteObserver()]),
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: [...context.localizationDelegates, FlutterQuillLocalizations.delegate],
        themeMode: theme,
        darkTheme: AppThemeDark.instance.theme,
        theme: AppThemeLight.instance.theme,
        builder: (context, widget) {
          return ScaffoldMessenger(key: GlobalKeyConstant.scaffoldMessengerKey, child: widget!);
        },
      ),
    );
  }
}
