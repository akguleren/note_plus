import 'package:flutter/material.dart';

class CommonPalette extends ThemeExtension<CommonPalette> {
  final Brand? brand;
  CommonPalette({this.brand});

  @override
  ThemeExtension<CommonPalette> copyWith({Brand? brand}) {
    return CommonPalette(
      brand: brand ?? this.brand,
    );
  }

  @override
  ThemeExtension<CommonPalette> lerp(covariant ThemeExtension<CommonPalette>? other, double t) {
    if (other is! CommonPalette) {
      return this;
    }
    return other;
  }
}

class Brand {
  final Color? main;
  final Color? accent;

  Brand({this.main, this.accent});
}
