import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/app/core/hive/hive_primitive_manager.dart';
import '/app/utility/print_log.dart';
import '/app/utility/riverpod_observer.dart';
import '/firebase_options.dart';

/// This class is used to initialize the application process
final class AppInitialize {
  factory AppInitialize() => _instance;

  AppInitialize._internal();
  static final AppInitialize _instance = AppInitialize._internal();
  AppInitialize get instance => _instance;

  void initRunApp(Widget app, Function? initialized) {
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      printLog.f('FlutterError Func error ', error: details.exception, stackTrace: details.stack);
    };

    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        await HivePrimitiveManager().init();
        // Initialize Firebase
        await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

        await EasyLocalization.ensureInitialized();

        if (initialized is Function) await initialized();
        runApp(ProviderScope(observers: [if (kDebugMode) RiverpodObserver()], child: app));
      },
      (error, stack) {
        printLog.f('runZonedGuarded error ', error: error, stackTrace: stack);
      },
    );
  }
}
