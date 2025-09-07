import 'package:flutter/material.dart';

import '../colors/color_tokens_def.dart';
import '/app/init/theme/colors/common_palette.dart';
import '/app/init/theme/colors/custom_color_palette.dart';
import '../fonts/custom_fonts.dart';

class AppThemeDark {
  static AppThemeDark? _instance;
  static AppThemeDark get instance => _instance ??= AppThemeDark._init();

  AppThemeDark._init();

  ThemeData get theme => ThemeData(
    useMaterial3: false,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlinedButtonTheme,
    inputDecorationTheme: _inputDecorationTheme,
    appBarTheme: _appBarTheme,
    bottomSheetTheme: _bottomSheetTheme,
    cardTheme: _cardTheme,
    actionIconTheme: _actionIconThemeData,
    scaffoldBackgroundColor: _colorTokens.background!.primary!,
    listTileTheme: _listTileTheme,
    dividerColor: _colorTokens.surface?.stroke,
    checkboxTheme: _checkboxThemeData,
    textTheme: TextTheme(titleMedium: _customTextTheme.body3, bodyMedium: _customTextTheme.body3),
    canvasColor: _colorTokens.surface?.primary,
    dialogTheme: _dialogThemeData,
    unselectedWidgetColor: _colorTokens.icon?.gray,
    datePickerTheme: DatePickerThemeData(backgroundColor: _customDarkPalette.primary12),
  ).copyWith(extensions: <ThemeExtension<dynamic>>[_customDarkPalette, _commonPalette, _customTextTheme, _colorTokens]);

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

  OutlinedButtonThemeData get _outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      iconColor: _colorTokens.button!.primary!.icon!.stable!,
      foregroundColor: _colorTokens.button!.primary!.text!.stable!,
      disabledForegroundColor: _colorTokens.button!.primary!.text!.disabled!,
      side: BorderSide(color: _colorTokens.button!.primary!.stroke!.stable!, width: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
    suffixIconColor: _colorTokens.inputs!.icons!.stable,
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

  BottomSheetThemeData get _bottomSheetTheme => BottomSheetThemeData(
    backgroundColor: _colorTokens.surface?.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
    ),
  );

  CardThemeData get _cardTheme => CardThemeData(
    color: _colorTokens.surface!.primary,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  ActionIconThemeData get _actionIconThemeData => ActionIconThemeData(
    backButtonIconBuilder: (context) => Icon(Icons.chevron_left, color: _colorTokens.text!.primary!),
    drawerButtonIconBuilder: (context) => Icon(Icons.menu, color: _colorTokens.text!.primary!),
    closeButtonIconBuilder: (context) => Icon(Icons.close, color: _colorTokens.text!.primary!),
  );

  /* Color Palette For The App. */
  CustomColorPalette get _customDarkPalette => CustomColorPalette(
    primary1: const Color(0xFF131620),
    primary2: const Color(0xFF15192d),
    primary3: const Color(0xFF192140),
    primary4: const Color(0xFF1c274f),
    primary5: const Color(0xFF1f2c5c),
    primary6: const Color(0xFF22346e),
    primary7: const Color(0xFF273e89),
    primary8: const Color(0xFF2f4eb2),
    primary9: const Color(0xFF3e63dd),
    primary10: const Color(0xFF5373e7),
    primary11: const Color(0xFF849dff),
    primary12: const Color(0xFFeef1fd),
    secondary1: const Color(0xFF17151f),
    secondary2: const Color(0xFF1c172b),
    secondary3: const Color(0xFF251e40),
    secondary4: const Color(0xFF2c2250),
    secondary5: const Color(0xFF32275f),
    secondary6: const Color(0xFF392c72),
    secondary7: const Color(0xFF443592),
    secondary8: const Color(0xFF5842c3),
    secondary9: const Color(0xFF6e56cf),
    secondary10: const Color(0xFF7c66dc),
    secondary11: const Color(0xFF9e8cfc),
    secondary12: const Color(0xFFf1eefe),
    neutral1: const Color(0xFF151718),
    neutral2: const Color(0xFF1a1d1e),
    neutral3: const Color(0xFF202425),
    neutral4: const Color(0xFF26292b),
    neutral5: const Color(0xFF2b2f31),
    neutral6: const Color(0xFF313538),
    neutral7: const Color(0xFF3a3f42),
    neutral8: const Color(0xFF4c5155),
    neutral9: const Color(0xFF697177),
    neutral10: const Color(0xFF697177),
    neutral11: const Color(0xFF9ba1a6),
    neutral12: const Color(0xFFecedee),
    danger1: const Color(0xFF1d1412),
    danger2: const Color(0xFF2a1410),
    danger3: const Color(0xFF3b1813),
    danger4: const Color(0xFF481a14),
    danger5: const Color(0xFF541c15),
    danger6: const Color(0xFF652016),
    danger7: const Color(0xFF7f2315),
    danger8: const Color(0xFFa42a12),
    danger9: const Color(0xFFe54d2e),
    danger10: const Color(0xFFec5e41),
    danger11: const Color(0xFFf16a50),
    danger12: const Color(0xFFfeefec),
    success1: const Color(0xFF0d1912),
    success2: const Color(0xFF0f1e13),
    success3: const Color(0xFF132819),
    success4: const Color(0xFF16301d),
    success5: const Color(0xFF193921),
    success6: const Color(0xFF1d4427),
    success7: const Color(0xFF245530),
    success8: const Color(0xFF2f6e3b),
    success9: const Color(0xFF46a758),
    success10: const Color(0xFF55b467),
    success11: const Color(0xFF63c174),
    success12: const Color(0xFFe5fbeb),
    warning1: const Color(0xFF1f1300),
    warning2: const Color(0xFF271700),
    warning3: const Color(0xFF341c00),
    warning4: const Color(0xFF3f2200),
    warning5: const Color(0xFF4a2900),
    warning6: const Color(0xFF573300),
    warning7: const Color(0xFF693f05),
    warning8: const Color(0xFF824e00),
    warning9: const Color(0xFFffb224),
    warning10: const Color(0xFFffcb47),
    warning11: const Color(0xFFf1a10d),
    warning12: const Color(0xFFfef3dd),
    info1: const Color(0xFF07191d),
    info2: const Color(0xFF061e24),
    info3: const Color(0xFF072830),
    info4: const Color(0xFF07303b),
    info5: const Color(0xFF073844),
    info6: const Color(0xFF064150),
    info7: const Color(0xFF045063),
    info8: const Color(0xFF00647d),
    info9: const Color(0xFF05a2c2),
    info10: const Color(0xFF00b1cc),
    info11: const Color(0xFF00c2d7),
    info12: const Color(0xFFe1f8fa),
  );

  CommonPalette get _commonPalette => CommonPalette(
    brand: Brand(main: const Color(0xFF1F48DA), accent: const Color(0xFFF38622)),
  );

  ColorTokens get _colorTokens => ColorTokens(
    status: StatusToken(
      icon: StatusIconToken(
        danger: _customDarkPalette.danger11,
        late: _customDarkPalette.neutral11,
        pending: _customDarkPalette.warning11,
        completed: _customDarkPalette.success11,
      ),
      text: StatusTextToken(
        danger: _customDarkPalette.danger11,
        late: _customDarkPalette.neutral11,
        pending: _customDarkPalette.warning11,
        completed: _customDarkPalette.success11,
        blue: _customDarkPalette.primary11,
      ),
      background: StatusBackgroundToken(
        completed: _customDarkPalette.success5,
        pending: _customDarkPalette.warning5,
        late: _customDarkPalette.neutral5,
        danger: _customDarkPalette.danger5,
        blue: _customDarkPalette.primary5,
      ),
    ),
    tabs: TabToken(
      selected: _commonPalette.brand!.main,
      stable: _customDarkPalette.neutral8,
      stableStroke: _customDarkPalette.neutral7,
    ),
    icon: IconToken(
      dark: _customDarkPalette.neutral12,
      darkInvert: _customDarkPalette.neutral1,
      white: _customDarkPalette.neutral1,
      whiteInvert: _customDarkPalette.neutral12,
      gray: _customDarkPalette.neutral10,
      darkGray: _customDarkPalette.neutral11,
    ),
    button: ButtonToken(
      danger: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _customDarkPalette.danger9,
          disabled: _customDarkPalette.danger6,
          onPress: _customDarkPalette.danger11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customDarkPalette.danger5,
          disabled: _customDarkPalette.danger6,
          onPress: _customDarkPalette.danger11,
        ),
        text: ButtonTextToken(
          stable: _customDarkPalette.neutral11,
          disabled: _customDarkPalette.neutral6,
          white: _customDarkPalette.neutral1,
        ),
        icon: ButtonIconToken(
          stable: _customDarkPalette.neutral11,
          disabled: _customDarkPalette.neutral6,
          white: _customDarkPalette.neutral1,
        ),
      ),
      success: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _customDarkPalette.success9,
          disabled: _customDarkPalette.success6,
          onPress: _customDarkPalette.success11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customDarkPalette.success5,
          disabled: _customDarkPalette.success6,
          onPress: _customDarkPalette.success11,
        ),
        text: ButtonTextToken(
          stable: _customDarkPalette.neutral11,
          disabled: _customDarkPalette.neutral6,
          white: _customDarkPalette.neutral1,
        ),
        icon: ButtonIconToken(
          stable: _customDarkPalette.neutral11,
          disabled: _customDarkPalette.neutral6,
          white: _customDarkPalette.neutral1,
        ),
      ),
      natural: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _customDarkPalette.neutral12,
          disabled: _customDarkPalette.neutral6,
          onPress: _customDarkPalette.neutral8,
        ),
        stroke: ButtonStrokeToken(
          stable: _customDarkPalette.neutral12,
          disabled: _customDarkPalette.neutral6,
          onPress: _customDarkPalette.neutral8,
        ),
        text: ButtonTextToken(
          stable: _customDarkPalette.neutral12,
          disabled: _customDarkPalette.neutral6,
          white: _customDarkPalette.neutral1,
        ),
        icon: ButtonIconToken(
          stable: _customDarkPalette.neutral12,
          disabled: _customDarkPalette.neutral6,
          white: _customDarkPalette.neutral1,
        ),
      ),
      secondary: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _commonPalette.brand?.accent,
          disabled: _customDarkPalette.warning6,
          onPress: _customDarkPalette.warning11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customDarkPalette.warning7,
          disabled: _customDarkPalette.warning6,
          onPress: _customDarkPalette.warning8,
        ),
        text: ButtonTextToken(
          stable: _commonPalette.brand?.accent,
          disabled: _customDarkPalette.warning6,
          white: Colors.white,
        ),
        icon: ButtonIconToken(
          stable: _commonPalette.brand?.accent,
          disabled: _customDarkPalette.warning6,
          white: Colors.white,
        ),
      ),
      primary: ButtonSubToken(
        background: ButtonBackgroundToken(
          stable: _commonPalette.brand?.main,
          disabled: _customDarkPalette.primary6,
          onPress: _customDarkPalette.primary11,
        ),
        stroke: ButtonStrokeToken(
          stable: _customDarkPalette.primary7,
          disabled: _customDarkPalette.primary6,
          onPress: _customDarkPalette.primary8,
        ),
        text: ButtonTextToken(
          stable: _commonPalette.brand?.main,
          disabled: _customDarkPalette.primary6,
          white: Colors.white,
        ),
        icon: ButtonIconToken(
          stable: _commonPalette.brand?.main,
          disabled: _customDarkPalette.primary6,
          white: Colors.white,
        ),
      ),
    ),
    inputs: InputsToken(
      icons: InputIconToken(
        stable: _customDarkPalette.neutral9,
        disabled: _customDarkPalette.neutral8,
        danger: _customDarkPalette.danger8,
        success: _customDarkPalette.success10,
        loginStable: _customDarkPalette.neutral10,
        loginActive: _customDarkPalette.primary9,
        loginDanger: _customDarkPalette.danger9,
      ),
      text: InputTextToken(
        stable: _customDarkPalette.neutral9,
        filled: _customDarkPalette.neutral12,
        disabled: _customDarkPalette.neutral8,
        hintColor: _customDarkPalette.neutral10,
        destructive: _customDarkPalette.danger10,
      ),
      background: InputBackgroundToken(
        active: _customDarkPalette.neutral1,
        stable: _customDarkPalette.neutral2,
        disabled: _customDarkPalette.neutral2,
      ),
      stroke: InputStrokeToken(active: _customDarkPalette.primary9, destructive: _customDarkPalette.danger8),
    ),
    surface: SurfaceToken(
      primary: _customDarkPalette.neutral3,
      secondary: _customDarkPalette.neutral5,
      stroke: _customDarkPalette.neutral7,
      white: _customDarkPalette.neutral1,
    ),
    background: BackgroundToken(
      primary: _customDarkPalette.neutral1,
      bgIcon: _customDarkPalette.neutral4,
      basMenuBg: _customDarkPalette.neutral3,
    ),
    text: TextToken(
      primary: _customDarkPalette.neutral12,
      white: _customDarkPalette.neutral1,
      whiteInvert: _customDarkPalette.neutral12,
      secondary: _customDarkPalette.neutral11,
      nearVisible: _customDarkPalette.neutral8,
      common: _customDarkPalette.primary11,
      destructive: _customDarkPalette.danger11,
      textBrandColor: _commonPalette.brand?.main,
    ),
  );

  CustomFonts get _customTextTheme => CustomFonts(
    headline1: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: _colorTokens.text?.primary),
    headline2: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: _colorTokens.text?.primary),
    headline3: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: _colorTokens.text?.primary),
    headline4: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: _colorTokens.text?.primary),
    headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _colorTokens.text?.primary),
    headline6: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: _colorTokens.text?.primary),
    headline7: TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: _colorTokens.text?.primary),
    body1: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: _colorTokens.text?.primary),
    body2: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: _colorTokens.text?.primary),
    body3: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _colorTokens.text?.primary),
    body4: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _colorTokens.text?.primary),
    body5: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: _colorTokens.text?.primary),
    subText: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: _colorTokens.text?.primary),
  );
}
