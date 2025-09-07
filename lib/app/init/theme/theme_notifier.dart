// Theme notifier provider
import '/app/constant/hive_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_notifier.g.dart';

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeMode build() {
    if (HiveKey.themeMode.get != null) {
      return HiveKey.themeMode.get == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }

    return ThemeMode.system;
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      HiveKey.themeMode.save('dark');
    } else {
      state = ThemeMode.light;
      HiveKey.themeMode.save('light');
    }
  }
}
