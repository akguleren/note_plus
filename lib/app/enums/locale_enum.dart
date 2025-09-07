import 'package:flutter/material.dart';

enum LocaleEnum {
  tr(Locale('tr')),
  en(Locale('en'));

  final Locale code;
  const LocaleEnum(this.code);
}
