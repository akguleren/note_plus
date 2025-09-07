import 'package:flutter/material.dart';

class CustomFonts extends ThemeExtension<CustomFonts> {
  final TextStyle headline1;
  final TextStyle headline2;
  final TextStyle headline3;
  final TextStyle headline4;
  final TextStyle headline5;
  final TextStyle headline6;
  final TextStyle headline7;

  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle body4;
  final TextStyle body5;

  final TextStyle? subText;

  const CustomFonts({
    required this.headline1,
    required this.headline2,
    required this.headline3,
    required this.headline4,
    required this.headline5,
    required this.headline6,
    required this.headline7,
    required this.body1,
    required this.body2,
    required this.body3,
    required this.body4,
    required this.body5,
    required this.subText,
  });

  @override
  ThemeExtension<CustomFonts> copyWith({
    TextStyle? headline1,
    TextStyle? headline2,
    TextStyle? headline3,
    TextStyle? headline4,
    TextStyle? headline5,
    TextStyle? headline6,
    TextStyle? headline7,
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? body4,
    TextStyle? body5,
    TextStyle? subText,
  }) {
    return CustomFonts(
      headline1: headline1 ?? this.headline1,
      headline2: headline2 ?? this.headline2,
      headline3: headline3 ?? this.headline3,
      headline4: headline4 ?? this.headline4,
      headline5: headline5 ?? this.headline5,
      headline6: headline6 ?? this.headline6,
      headline7: headline7 ?? this.headline7,
      body1: body1 ?? this.body1,
      body2: body2 ?? this.body2,
      body3: body3 ?? this.body3,
      body4: body4 ?? this.body4,
      body5: body5 ?? this.body5,
      subText: subText ?? this.subText,
    );
  }

  @override
  ThemeExtension<CustomFonts> lerp(covariant ThemeExtension<CustomFonts>? other, double t) {
    return CustomFonts(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        headline4: headline4,
        headline5: headline5,
        headline6: headline6,
        headline7: headline7,
        body1: body1,
        body2: body2,
        body3: body3,
        body4: body4,
        body5: body5,
        subText: subText);
  }
}
