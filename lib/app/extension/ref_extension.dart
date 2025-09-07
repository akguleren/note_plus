import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../init/theme/colors/color_tokens_def.dart';

import '/app/init/theme/colors/common_palette.dart';
import '/app/init/theme/colors/custom_color_palette.dart';
import '/app/init/theme/fonts/custom_fonts.dart';

extension RefExtension on WidgetRef {
  MediaQueryData get mediaQuery => MediaQuery.of(context);
  ThemeData get theme => Theme.of(context);
  ColorScheme get colorScheme => theme.colorScheme;
  CustomColorPalette get colors => theme.extension<CustomColorPalette>()!;
  CommonPalette get commonColors => theme.extension<CommonPalette>()!;
  ColorTokens get colorTokens => theme.extension<ColorTokens>()!;
  CustomFonts get textTheme => theme.extension<CustomFonts>()!;
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
}

extension BorderRadiusExtension on WidgetRef {
  BorderRadiusGeometry get borderRadius4 => BorderRadius.circular(4);
  BorderRadiusGeometry get borderRadius8 => BorderRadius.circular(8);
  BorderRadiusGeometry get borderRadius12 => BorderRadius.circular(12);
  BorderRadiusGeometry get borderRadius16 => BorderRadius.circular(16);
  BorderRadiusGeometry get borderRadius20 => BorderRadius.circular(20);
  BorderRadiusGeometry get borderRadius25 => BorderRadius.circular(25);
}

extension PaddingExtensionAll on WidgetRef {
  EdgeInsets get zeroPadding => const EdgeInsets.all(0);
  EdgeInsets get padding4 => const EdgeInsets.all(4);
  EdgeInsets get padding8 => const EdgeInsets.all(8);
  EdgeInsets get padding12 => const EdgeInsets.all(12);
  EdgeInsets get padding16 => const EdgeInsets.all(16);
  EdgeInsets get padding20 => const EdgeInsets.all(20);
  EdgeInsets get padding25 => const EdgeInsets.all(25);
  EdgeInsets get keyboardPadding => EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom);
}

extension PaddingExtensionSymetric on WidgetRef {
  EdgeInsets get paddingVertical4 => const EdgeInsets.symmetric(vertical: 4);
  EdgeInsets get paddingVertical8 => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get paddingVertical12 => const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get paddingVertical16 => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get paddingVertical20 => const EdgeInsets.symmetric(vertical: 20);
  EdgeInsets get paddingVertical25 => const EdgeInsets.symmetric(vertical: 25);

  EdgeInsets get paddingHorizontal4 => const EdgeInsets.symmetric(horizontal: 4);
  EdgeInsets get paddingHorizontal8 => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get paddingHorizontal12 => const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get paddingHorizontal16 => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get paddingHorizontal20 => const EdgeInsets.symmetric(horizontal: 20);
  EdgeInsets get paddingHorizontal25 => const EdgeInsets.symmetric(horizontal: 25);
}

extension PaddingExtensionOnly on WidgetRef {
  EdgeInsets get leftPadding4 => const EdgeInsets.only(left: 4);
  EdgeInsets get leftPadding8 => const EdgeInsets.only(left: 8);
  EdgeInsets get leftPadding12 => const EdgeInsets.only(left: 12);
  EdgeInsets get leftPadding16 => const EdgeInsets.only(left: 16);
  EdgeInsets get leftPadding20 => const EdgeInsets.only(left: 20);
  EdgeInsets get leftPadding25 => const EdgeInsets.only(left: 25);

  EdgeInsets get rightPadding4 => const EdgeInsets.only(right: 4);
  EdgeInsets get rightPadding8 => const EdgeInsets.only(right: 8);
  EdgeInsets get rightPadding12 => const EdgeInsets.only(right: 12);
  EdgeInsets get rightPadding16 => const EdgeInsets.only(right: 16);
  EdgeInsets get rightPadding20 => const EdgeInsets.only(right: 20);
  EdgeInsets get rightPadding25 => const EdgeInsets.only(right: 25);

  EdgeInsets get bottomPadding4 => const EdgeInsets.only(bottom: 4);
  EdgeInsets get bottomPadding8 => const EdgeInsets.only(bottom: 8);
  EdgeInsets get bottomPadding12 => const EdgeInsets.only(bottom: 12);
  EdgeInsets get bottomPadding16 => const EdgeInsets.only(bottom: 16);
  EdgeInsets get bottomPadding20 => const EdgeInsets.only(bottom: 20);
  EdgeInsets get bottomPadding25 => const EdgeInsets.only(bottom: 25);

  EdgeInsets get topPadding4 => const EdgeInsets.only(top: 4);
  EdgeInsets get topPadding8 => const EdgeInsets.only(top: 8);
  EdgeInsets get topPadding12 => const EdgeInsets.only(top: 12);
  EdgeInsets get topPadding16 => const EdgeInsets.only(top: 16);
  EdgeInsets get topPadding20 => const EdgeInsets.only(top: 20);
  EdgeInsets get topPadding25 => const EdgeInsets.only(top: 25);
}

extension PageExtension on WidgetRef {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on WidgetRef {
  Duration get duration100 => const Duration(milliseconds: 100);
  Duration get duration200 => const Duration(milliseconds: 200);
  Duration get duration300 => const Duration(milliseconds: 300);
  Duration get duration400 => const Duration(milliseconds: 400);
  Duration get duration500 => const Duration(milliseconds: 500);
  Duration get duration1000 => const Duration(milliseconds: 1000);
  Duration get duration2000 => const Duration(milliseconds: 2000);
  Duration get duration3000 => const Duration(milliseconds: 3000);
}

extension CacheForExtension on Ref {
  /// Keeps the provider alive for [duration].
  void cacheFor(Duration duration) {
    // Immediately prevent the state from getting destroyed.
    final link = keepAlive();
    // After duration has elapsed, we re-enable automatic disposal.
    final timer = Timer(duration, link.close);

    // Optional: when the provider is recomputed (such as with ref.watch),
    // we cancel the pending timer.
    onDispose(timer.cancel);
  }
}
