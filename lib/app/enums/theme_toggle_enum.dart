import 'package:flutter/material.dart';
import '/app/init/init.dart';

extension ToggleTheme on ThemeMode? {
  ThemeMode? get toggle {
    switch (this) {
      case ThemeMode.dark:
        return ThemeMode.light;
      case ThemeMode.light:
        return ThemeMode.dark;
      case ThemeMode.system:
        return ThemeMode.light;
      default:
        return ThemeMode.light;
    }
  }
}

extension ToggleThemeData on ThemeData? {
  ThemeData? get toggle {
    if (this == AppThemeLight.instance.theme) {
      return AppThemeDark.instance.theme;
    } else {
      return AppThemeLight.instance.theme;
    }
  }
}
