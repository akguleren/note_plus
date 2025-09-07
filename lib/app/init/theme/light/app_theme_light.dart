import 'package:flutter/material.dart';

import '/app/init/theme/colors/common_palette.dart';
import '/app/init/theme/colors/custom_color_palette.dart';
import '/app/init/theme/fonts/custom_fonts.dart';
import '../colors/color_tokens_def.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance => _instance ??= AppThemeLight._init();

  AppThemeLight._init();

  /* Color Palette For The App. */
  ThemeData get theme =>
      ThemeData(
        datePickerTheme: const DatePickerThemeData(
          backgroundColor: Colors.white,
          dividerColor: Color(0xff1F48DA),
          headerBackgroundColor: Color(0xff1F48DA),
          headerForegroundColor: Colors.white,
        ),
        useMaterial3: false,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
        textButtonTheme: _textButtonTheme,
        inputDecorationTheme: _inputDecorationTheme,
        appBarTheme: _appBarTheme,
        // bottomSheetTheme: _bottomSheetTheme,
        cardTheme: _cardTheme,
        actionIconTheme: _actionIconThemeData,
        scaffoldBackgroundColor: _colorTokens.background!.primary!,
        chipTheme: _chipTheme,
        listTileTheme: _listTileTheme,
        checkboxTheme: _checkboxThemeData,
        dividerColor: _colorTokens.surface?.stroke,
        dialogTheme: _dialogThemeData,
      ).copyWith(
        extensions: <ThemeExtension<dynamic>>[_customLightPalette, _commonPalette, _colorTokens, _customTextTheme],
      );

  DialogThemeData get _dialogThemeData => DialogThemeData(
    backgroundColor: _colorTokens.surface?.primary,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    titleTextStyle: _customTextTheme.body1.copyWith(color: _colorTokens.text?.secondary),
  );

  CheckboxThemeData get _checkboxThemeData => CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    visualDensity: VisualDensity.compact,
  );

  ListTileThemeData get _listTileTheme => const ListTileThemeData(horizontalTitleGap: 5, minLeadingWidth: 0);

  ChipThemeData get _chipTheme => ChipThemeData(backgroundColor: _colorTokens.surface?.secondary);

  ElevatedButtonThemeData get _elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: _colorTokens.button!.primary!.background!.stable!,
      disabledBackgroundColor: _colorTokens.button!.primary!.background!.disabled!,
      disabledForegroundColor: _colorTokens.button!.primary!.text!.white!,
      foregroundColor: _colorTokens.button!.primary!.text!.white!,
      surfaceTintColor: _colorTokens.button!.primary!.stroke!.stable!,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  TextButtonThemeData get _textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: _colorTokens.button!.primary!.text!.stable!,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: _colorTokens.button!.primary!.text!.stable!,
      disabledForegroundColor: _colorTokens.button!.primary!.text!.disabled!,
      side: BorderSide(color: _colorTokens.button!.primary!.background!.stable!, width: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: _colorTokens.inputs!.background!.stable,
    contentPadding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1.5, color: _colorTokens.inputs!.stroke!.active!),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 1.5, color: _colorTokens.inputs!.stroke!.destructive!),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2.5, color: _colorTokens.inputs!.stroke!.destructive!, strokeAlign: 1),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    labelStyle: _customTextTheme.body2.copyWith(color: _colorTokens.inputs!.text!.filled!),
    hintStyle: _customTextTheme.body5.copyWith(color: _colorTokens.inputs!.text!.hintColor!),
    errorStyle: _customTextTheme.body5.copyWith(color: _colorTokens.inputs!.stroke!.destructive!),
  );

  AppBarTheme get _appBarTheme =>
      AppBarTheme(backgroundColor: _colorTokens.background!.primary, elevation: 0, centerTitle: false);

  CardThemeData get _cardTheme => CardThemeData(
    color: _colorTokens.surface!.primary,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
    backButtonIconBuilder: (context) => Icon(Icons.chevron_left, color: _colorTokens.text!.primary!),
    drawerButtonIconBuilder: (context) => Icon(Icons.menu, color: _colorTokens.text!.primary!),
  );
  /* Color Palette For The App. */
  CustomColorPalette get _customLightPalette => CustomColorPalette(
    primary1: const Color(0xFFfdfdfe),
    primary2: const Color(0xFFf8faff),
    primary3: const Color(0xFFf0f4ff),
    primary4: const Color(0xFFe6edfe),
    primary5: const Color(0xFFd9e2fc),
    primary6: const Color(0xFFc6d4f9),
    primary7: const Color(0xFFaec0f5),
    primary8: const Color(0xFF8da4ef),
    primary9: const Color(0xFF3e63dd),
    primary10: const Color(0xFF3a5ccc),
    primary11: const Color(0xFF3451b2),
    primary12: const Color(0xFF101d46),
    secondary1: const Color(0xFFfdfcfe),
    secondary2: const Color(0xFFfbfaff),
    secondary3: const Color(0xFFf5f2ff),
    secondary4: const Color(0xFFede9fe),
    secondary5: const Color(0xFFe4defc),
    secondary6: const Color(0xFFd7cff9),
    secondary7: const Color(0xFFc4b8f3),
    secondary8: const Color(0xFFaa99ec),
    secondary9: const Color(0xFF6e56cf),
    secondary10: const Color(0xFF644fc1),
    secondary11: const Color(0xFF5746af),
    secondary12: const Color(0xFF20134b),
    neutral1: const Color(0xFFfbfcfd),
    neutral2: const Color(0xFFf8f9fa),
    neutral3: const Color(0xFFf1f3f5),
    neutral4: const Color(0xFFeceef0),
    neutral5: const Color(0xFFe6e8eb),
    neutral6: const Color(0xFFdfe3e6),
    neutral7: const Color(0xFFd7dbdf),
    neutral8: const Color(0xFFc1c8cd),
    neutral9: const Color(0xFF889096),
    neutral10: const Color(0xFF7e868c),
    neutral11: const Color(0xFF687076),
    neutral12: const Color(0xFF11181c),
    danger1: const Color(0xFFfffcfc),
    danger2: const Color(0xFFfff8f7),
    danger3: const Color(0xFFfff0ee),
    danger4: const Color(0xFFffe6e2),
    danger5: const Color(0xFFfdd8d3),
    danger6: const Color(0xFFfac7be),
    danger7: const Color(0xFFf3b0a2),
    danger8: const Color(0xFFea9280),
    danger9: const Color(0xFFe54d2e),
    danger10: const Color(0xFFdb4324),
    danger11: const Color(0xFFca3214),
    danger12: const Color(0xFF341711),
    success1: const Color(0xFFfbfefb),
    success2: const Color(0xFFf3fcf3),
    success3: const Color(0xFFebf9eb),
    success4: const Color(0xFFdff3df),
    success5: const Color(0xFFceebcf),
    success6: const Color(0xFFb7dfba),
    success7: const Color(0xFF97cf9c),
    success8: const Color(0xFF65ba75),
    success9: const Color(0xFF46a758),
    success10: const Color(0xFF3d9a50),
    success11: const Color(0xFF297c3b),
    success12: const Color(0xFF1b311e),
    warning1: const Color(0xFFfefdfb),
    warning2: const Color(0xFFfff9ed),
    warning3: const Color(0xFFfff4d5),
    warning4: const Color(0xFFffecbc),
    warning5: const Color(0xFFffe3a2),
    warning6: const Color(0xFFffd386),
    warning7: const Color(0xFFf3ba63),
    warning8: const Color(0xFFee9d2b),
    warning9: const Color(0xFFffb224),
    warning10: const Color(0xFFffa01c),
    warning11: const Color(0xFad5700F),
    warning12: const Color(0xFF4e2009),
    info1: const Color(0xFFfafdfe),
    info2: const Color(0xFFf2fcfd),
    info3: const Color(0xFFe7f9fb),
    info4: const Color(0xFFd8f3f6),
    info5: const Color(0xFFc4eaef),
    info6: const Color(0xFFaadee6),
    info7: const Color(0xFF84cdda),
    info8: const Color(0xFF3db9cf),
    info9: const Color(0xFF05a2c2),
    info10: const Color(0xFF0894b3),
    info11: const Color(0xFF0c7792),
    info12: const Color(0xFF04313c),
  );

  ColorTokens get _colorTokens => ColorTokens(
    status: StatusToken(
      icon: StatusIconToken(
        danger: _customLightPalette.danger11,
        late: _customLightPalette.neutral11,
        pending: _customLightPalette.warning11,
        completed: _customLightPalette.success11,
      ),
      text: StatusTextToken(
        danger: _customLightPalette.danger11,
        late: _customLightPalette.neutral11,
        pending: _customLightPalette.warning11,
        completed: _customLightPalette.success11,
        blue: _customLightPalette.primary11,
      ),
      background: StatusBackgroundToken(
        completed: _customLightPalette.success5,
        pending: _customLightPalette.warning5,
        late: _customLightPalette.neutral5,
        danger: _customLightPalette.danger5,
        blue: _customLightPalette.primary5,
      ),
    ),
    tabs: TabToken(
      selected: _commonPalette.brand!.main,
      stable: _customLightPalette.neutral4,
      stableStroke: _customLightPalette.neutral7,
    ),
    icon: IconToken(
      dark: _customLightPalette.neutral12,
      darkInvert: _customLightPalette.neutral12,
      white: _customLightPalette.neutral1,
      whiteInvert: _customLightPalette.neutral1,
      gray: _customLightPalette.neutral10,
      darkGray: _customLightPalette.neutral11,
    ),
    button: ButtonToken(
      danger: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _customLightPalette.danger9,
          disabled: _customLightPalette.danger6,
          onPress: _customLightPalette.danger11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customLightPalette.danger5,
          disabled: _customLightPalette.danger6,
          onPress: _customLightPalette.danger11,
        ),
        text: ButtonTextToken(
          stable: _customLightPalette.neutral11,
          disabled: _customLightPalette.neutral6,
          white: _customLightPalette.neutral1,
        ),
        icon: ButtonIconToken(
          stable: _customLightPalette.neutral11,
          disabled: _customLightPalette.neutral6,
          white: _customLightPalette.neutral1,
        ),
      ),
      success: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _customLightPalette.success9,
          disabled: _customLightPalette.success6,
          onPress: _customLightPalette.success11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customLightPalette.success5,
          disabled: _customLightPalette.success6,
          onPress: _customLightPalette.success11,
        ),
        text: ButtonTextToken(
          stable: _customLightPalette.neutral11,
          disabled: _customLightPalette.neutral6,
          white: _customLightPalette.neutral1,
        ),
        icon: ButtonIconToken(
          stable: _customLightPalette.neutral11,
          disabled: _customLightPalette.neutral6,
          white: _customLightPalette.neutral1,
        ),
      ),
      natural: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _customLightPalette.neutral12,
          disabled: _customLightPalette.neutral6,
          onPress: _customLightPalette.neutral11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customLightPalette.neutral12,
          disabled: _customLightPalette.neutral6,
          onPress: _customLightPalette.neutral8,
        ),
        text: ButtonTextToken(
          stable: _customLightPalette.neutral12,
          disabled: _customLightPalette.neutral6,
          white: _customLightPalette.neutral1,
        ),
        icon: ButtonIconToken(
          stable: _customLightPalette.neutral12,
          disabled: _customLightPalette.neutral6,
          white: _customLightPalette.neutral1,
        ),
      ),
      secondary: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _commonPalette.brand?.accent,
          disabled: _customLightPalette.warning6,
          onPress: _customLightPalette.warning11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customLightPalette.warning7,
          disabled: _customLightPalette.warning6,
          onPress: _customLightPalette.warning8,
        ),
        text: ButtonTextToken(
          stable: _commonPalette.brand?.accent,
          disabled: _customLightPalette.warning6,
          white: Colors.white,
        ),
        icon: ButtonIconToken(
          stable: _commonPalette.brand?.accent,
          disabled: _customLightPalette.warning6,
          white: Colors.white,
        ),
      ),
      primary: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _commonPalette.brand?.main,
          disabled: _customLightPalette.primary6,
          onPress: _customLightPalette.primary11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customLightPalette.primary7,
          disabled: _customLightPalette.primary6,
          onPress: _customLightPalette.primary8,
        ),
        text: ButtonTextToken(
          stable: _commonPalette.brand?.main,
          disabled: _customLightPalette.primary6,
          white: Colors.white,
        ),
        icon: ButtonIconToken(
          stable: _commonPalette.brand?.main,
          disabled: _customLightPalette.primary6,
          white: Colors.white,
        ),
      ),
    ),
    inputs: InputsToken(
      icons: InputIconToken(
        stable: _customLightPalette.neutral9,
        disabled: _customLightPalette.neutral8,
        danger: _customLightPalette.danger8,
        success: _customLightPalette.success10,
        loginStable: _customLightPalette.neutral10,
        loginActive: _customLightPalette.primary9,
        loginDanger: _customLightPalette.danger9,
      ),
      text: InputTextToken(
        stable: _customLightPalette.neutral9,
        filled: _customLightPalette.neutral12,
        disabled: _customLightPalette.neutral8,
        hintColor: _customLightPalette.neutral10,
        destructive: _customLightPalette.danger10,
      ),
      background: InputBackgroundToken(
        active: _customLightPalette.neutral1,
        stable: _customLightPalette.neutral3,
        disabled: _customLightPalette.neutral2,
      ),
      stroke: InputStrokeToken(active: _customLightPalette.primary9, destructive: _customLightPalette.danger8),
    ),
    surface: SurfaceToken(
      primary: _customLightPalette.neutral3,
      secondary: _customLightPalette.neutral5,
      stroke: _customLightPalette.neutral7,
      white: _customLightPalette.neutral1,
    ),
    background: BackgroundToken(
      primary: _customLightPalette.neutral1,
      bgIcon: _customLightPalette.neutral4,
      basMenuBg: _customLightPalette.neutral1,
    ),
    text: TextToken(
      primary: _customLightPalette.neutral12,
      white: _customLightPalette.neutral1,
      whiteInvert: _customLightPalette.neutral1,
      secondary: _customLightPalette.neutral11,
      nearVisible: _customLightPalette.neutral8,
      common: _customLightPalette.neutral11,
      destructive: _customLightPalette.danger11,
      textBrandColor: _commonPalette.brand?.main,
    ),
  );

  CommonPalette get _commonPalette => CommonPalette(
    brand: Brand(main: const Color(0xFF1F48DA), accent: const Color(0xFFF38622)),
  );

  CustomFonts get _customTextTheme => CustomFonts(
    headline1: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: _colorTokens.text?.common),
    headline2: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: _colorTokens.text?.common),
    headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: _colorTokens.text?.common),
    headline4: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: _colorTokens.text?.common),
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _colorTokens.text?.common),
    headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: _colorTokens.text?.common),
    headline7: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: _colorTokens.text?.common),
    body1: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: _colorTokens.text?.common),
    body2: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: _colorTokens.text?.common),
    body3: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _colorTokens.text?.common),
    body4: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _colorTokens.text?.common),
    body5: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _colorTokens.text?.common),
    subText: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: _colorTokens.text?.common),
  );
}
