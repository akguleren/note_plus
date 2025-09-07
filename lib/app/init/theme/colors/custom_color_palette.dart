import 'package:flutter/material.dart';

class CustomColorPalette extends ThemeExtension<CustomColorPalette> {
  final Color? primary1;
  final Color? primary2;
  final Color? primary3;
  final Color? primary4;
  final Color? primary5;
  final Color? primary6;
  final Color? primary7;
  final Color? primary8;
  final Color? primary9;
  final Color? primary10;
  final Color? primary11;
  final Color? primary12;

  final Color? secondary1;
  final Color? secondary2;
  final Color? secondary3;
  final Color? secondary4;
  final Color? secondary5;
  final Color? secondary6;
  final Color? secondary7;
  final Color? secondary8;
  final Color? secondary9;
  final Color? secondary10;
  final Color? secondary11;
  final Color? secondary12;

  final Color? neutral1;
  final Color? neutral2;
  final Color? neutral3;
  final Color? neutral4;
  final Color? neutral5;
  final Color? neutral6;
  final Color? neutral7;
  final Color? neutral8;
  final Color? neutral9;
  final Color? neutral10;
  final Color? neutral11;
  final Color? neutral12;

  final Color? danger1;
  final Color? danger2;
  final Color? danger3;
  final Color? danger4;
  final Color? danger5;
  final Color? danger6;
  final Color? danger7;
  final Color? danger8;
  final Color? danger9;
  final Color? danger10;
  final Color? danger11;
  final Color? danger12;

  final Color? success1;
  final Color? success2;
  final Color? success3;
  final Color? success4;
  final Color? success5;
  final Color? success6;
  final Color? success7;
  final Color? success8;
  final Color? success9;
  final Color? success10;
  final Color? success11;
  final Color? success12;

  final Color? warning1;
  final Color? warning2;
  final Color? warning3;
  final Color? warning4;
  final Color? warning5;
  final Color? warning6;
  final Color? warning7;
  final Color? warning8;
  final Color? warning9;
  final Color? warning10;
  final Color? warning11;
  final Color? warning12;

  final Color? info1;
  final Color? info2;
  final Color? info3;
  final Color? info4;
  final Color? info5;
  final Color? info6;
  final Color? info7;
  final Color? info8;
  final Color? info9;
  final Color? info10;
  final Color? info11;
  final Color? info12;

  CustomColorPalette({
    this.primary1,
    this.primary2,
    this.primary3,
    this.primary4,
    this.primary5,
    this.primary6,
    this.primary7,
    this.primary8,
    this.primary9,
    this.primary10,
    this.primary11,
    this.primary12,
    this.secondary1,
    this.secondary2,
    this.secondary3,
    this.secondary4,
    this.secondary5,
    this.secondary6,
    this.secondary7,
    this.secondary8,
    this.secondary9,
    this.secondary10,
    this.secondary11,
    this.secondary12,
    this.neutral1,
    this.neutral2,
    this.neutral3,
    this.neutral4,
    this.neutral5,
    this.neutral6,
    this.neutral7,
    this.neutral8,
    this.neutral9,
    this.neutral10,
    this.neutral11,
    this.neutral12,
    this.danger1,
    this.danger2,
    this.danger3,
    this.danger4,
    this.danger5,
    this.danger6,
    this.danger7,
    this.danger8,
    this.danger9,
    this.danger10,
    this.danger11,
    this.danger12,
    this.success1,
    this.success2,
    this.success3,
    this.success4,
    this.success5,
    this.success6,
    this.success7,
    this.success8,
    this.success9,
    this.success10,
    this.success11,
    this.success12,
    this.warning1,
    this.warning2,
    this.warning3,
    this.warning4,
    this.warning5,
    this.warning6,
    this.warning7,
    this.warning8,
    this.warning9,
    this.warning10,
    this.warning11,
    this.warning12,
    this.info1,
    this.info2,
    this.info3,
    this.info4,
    this.info5,
    this.info6,
    this.info7,
    this.info8,
    this.info9,
    this.info10,
    this.info11,
    this.info12,
  });

  @override
  ThemeExtension<CustomColorPalette> copyWith({
    Color? primary1,
    Color? primary2,
    Color? primary3,
    Color? primary4,
    Color? primary5,
    Color? primary6,
    Color? primary7,
    Color? primary8,
    Color? primary9,
    Color? primary10,
    Color? primary11,
    Color? primary12,
    Color? secondary1,
    Color? secondary2,
    Color? secondary3,
    Color? secondary4,
    Color? secondary5,
    Color? secondary6,
    Color? secondary7,
    Color? secondary8,
    Color? secondary9,
    Color? secondary10,
    Color? secondary11,
    Color? secondary12,
    Color? neutral1,
    Color? neutral2,
    Color? neutral3,
    Color? neutral4,
    Color? neutral5,
    Color? neutral6,
    Color? neutral7,
    Color? neutral8,
    Color? neutral9,
    Color? neutral10,
    Color? neutral11,
    Color? neutral12,
    Color? danger1,
    Color? danger2,
    Color? danger3,
    Color? danger4,
    Color? danger5,
    Color? danger6,
    Color? danger7,
    Color? danger8,
    Color? danger9,
    Color? danger10,
    Color? danger11,
    Color? danger12,
    Color? success1,
    Color? success2,
    Color? success3,
    Color? success4,
    Color? success5,
    Color? success6,
    Color? success7,
    Color? success8,
    Color? success9,
    Color? success10,
    Color? success11,
    Color? success12,
    Color? warning1,
    Color? warning2,
    Color? warning3,
    Color? warning4,
    Color? warning5,
    Color? warning6,
    Color? warning7,
    Color? warning8,
    Color? warning9,
    Color? warning10,
    Color? warning11,
    Color? warning12,
    Color? info1,
    Color? info2,
    Color? info3,
    Color? info4,
    Color? info5,
    Color? info6,
    Color? info7,
    Color? info8,
    Color? info9,
    Color? info10,
    Color? info11,
    Color? info12,
  }) {
    return CustomColorPalette(
      primary1: primary1 ?? this.primary1,
      primary2: primary2 ?? this.primary2,
      primary3: primary3 ?? this.primary3,
      primary4: primary4 ?? this.primary4,
      primary5: primary5 ?? this.primary5,
      primary6: primary6 ?? this.primary6,
      primary7: primary7 ?? this.primary7,
      primary8: primary8 ?? this.primary8,
      primary9: primary9 ?? this.primary9,
      primary10: primary10 ?? this.primary10,
      primary11: primary11 ?? this.primary11,
      primary12: primary12 ?? this.primary12,
      secondary1: secondary1 ?? this.secondary1,
      secondary2: secondary2 ?? this.secondary2,
      secondary3: secondary3 ?? this.secondary3,
      secondary4: secondary4 ?? this.secondary4,
      secondary5: secondary5 ?? this.secondary5,
      secondary6: secondary6 ?? this.secondary6,
      secondary7: secondary7 ?? this.secondary7,
      secondary8: secondary8 ?? this.secondary8,
      secondary9: secondary9 ?? this.secondary9,
      secondary10: secondary10 ?? this.secondary10,
      secondary11: secondary11 ?? this.secondary11,
      secondary12: secondary12 ?? this.secondary12,
      neutral1: neutral1 ?? this.neutral1,
      neutral2: neutral2 ?? this.neutral2,
      neutral3: neutral3 ?? this.neutral3,
      neutral4: neutral4 ?? this.neutral4,
      neutral5: neutral5 ?? this.neutral5,
      neutral6: neutral6 ?? this.neutral6,
      neutral7: neutral7 ?? this.neutral7,
      neutral8: neutral8 ?? this.neutral8,
      neutral9: neutral9 ?? this.neutral9,
      neutral10: neutral10 ?? this.neutral10,
      neutral11: neutral11 ?? this.neutral11,
      neutral12: neutral12 ?? this.neutral12,
      danger1: danger1 ?? this.danger1,
      danger2: danger2 ?? this.danger2,
      danger3: danger3 ?? this.danger3,
      danger4: danger4 ?? this.danger4,
      danger5: danger5 ?? this.danger5,
      danger6: danger6 ?? this.danger6,
      danger7: danger7 ?? this.danger7,
      danger8: danger8 ?? this.danger8,
      danger9: danger9 ?? this.danger9,
      danger10: danger10 ?? this.danger10,
      danger11: danger11 ?? this.danger11,
      danger12: danger12 ?? this.danger12,
      success1: success1 ?? this.success1,
      success2: success2 ?? this.success2,
      success3: success3 ?? this.success3,
      success4: success4 ?? this.success4,
      success5: success5 ?? this.success5,
      success6: success6 ?? this.success6,
      success7: success7 ?? this.success7,
      success8: success8 ?? this.success8,
      success9: success9 ?? this.success9,
      success10: success10 ?? this.success10,
      success11: success11 ?? this.success11,
      success12: success12 ?? this.success12,
      warning1: warning1 ?? this.warning1,
      warning2: warning2 ?? this.warning2,
      warning3: warning3 ?? this.warning3,
      warning4: warning4 ?? this.warning4,
      warning5: warning5 ?? this.warning5,
      warning6: warning6 ?? this.warning6,
      warning7: warning7 ?? this.warning7,
      warning8: warning8 ?? this.warning8,
      warning9: warning9 ?? this.warning9,
      warning10: warning10 ?? this.warning10,
      warning11: warning11 ?? this.warning11,
      warning12: warning12 ?? this.warning12,
      info1: info1 ?? this.info1,
      info2: info2 ?? this.info2,
      info3: info3 ?? this.info3,
      info4: info4 ?? this.info4,
      info5: info5 ?? this.info5,
      info6: info6 ?? this.info6,
      info7: info7 ?? this.info7,
      info8: info8 ?? this.info8,
      info9: info9 ?? this.info9,
      info10: info10 ?? this.info10,
      info11: info11 ?? this.info11,
      info12: info12 ?? this.info12,
    );
  }

  @override
  ThemeExtension<CustomColorPalette> lerp(covariant ThemeExtension<CustomColorPalette>? other, double t) {
    if (other is! CustomColorPalette) {
      return this;
    }
    return CustomColorPalette(
      primary1: Color.lerp(primary1, other.primary1, t),
      primary2: Color.lerp(primary2, other.primary2, t),
      primary3: Color.lerp(primary3, other.primary3, t),
      primary4: Color.lerp(primary4, other.primary4, t),
      primary5: Color.lerp(primary5, other.primary5, t),
      primary6: Color.lerp(primary6, other.primary6, t),
      primary7: Color.lerp(primary7, other.primary7, t),
      primary8: Color.lerp(primary8, other.primary8, t),
      primary9: Color.lerp(primary9, other.primary9, t),
      primary10: Color.lerp(primary10, other.primary10, t),
      primary11: Color.lerp(primary11, other.primary11, t),
      primary12: Color.lerp(primary12, other.primary12, t),
      secondary1: Color.lerp(secondary1, other.secondary1, t),
      secondary2: Color.lerp(secondary2, other.secondary2, t),
      secondary3: Color.lerp(secondary3, other.secondary3, t),
      secondary4: Color.lerp(secondary4, other.secondary4, t),
      secondary5: Color.lerp(secondary5, other.secondary5, t),
      secondary6: Color.lerp(secondary6, other.secondary6, t),
      secondary7: Color.lerp(secondary7, other.secondary7, t),
      secondary8: Color.lerp(secondary8, other.secondary8, t),
      secondary9: Color.lerp(secondary9, other.secondary9, t),
      secondary10: Color.lerp(secondary10, other.secondary10, t),
      secondary11: Color.lerp(secondary11, other.secondary11, t),
      secondary12: Color.lerp(secondary12, other.secondary12, t),
      neutral1: Color.lerp(neutral1, other.neutral1, t),
      neutral2: Color.lerp(neutral2, other.neutral2, t),
      neutral3: Color.lerp(neutral3, other.neutral3, t),
      neutral4: Color.lerp(neutral4, other.neutral4, t),
      neutral5: Color.lerp(neutral5, other.neutral5, t),
      neutral6: Color.lerp(neutral6, other.neutral6, t),
      neutral7: Color.lerp(neutral7, other.neutral7, t),
      neutral8: Color.lerp(neutral8, other.neutral8, t),
      neutral9: Color.lerp(neutral9, other.neutral9, t),
      neutral10: Color.lerp(neutral10, other.neutral10, t),
      neutral11: Color.lerp(neutral11, other.neutral11, t),
      neutral12: Color.lerp(neutral12, other.neutral12, t),
      danger1: Color.lerp(danger1, other.danger1, t),
      danger2: Color.lerp(danger2, other.danger2, t),
      danger3: Color.lerp(danger3, other.danger3, t),
      danger4: Color.lerp(danger4, other.danger4, t),
      danger5: Color.lerp(danger5, other.danger5, t),
      danger6: Color.lerp(danger6, other.danger6, t),
      danger7: Color.lerp(danger7, other.danger7, t),
      danger8: Color.lerp(danger8, other.danger8, t),
      danger9: Color.lerp(danger9, other.danger9, t),
      danger10: Color.lerp(danger10, other.danger10, t),
      danger11: Color.lerp(danger11, other.danger11, t),
      danger12: Color.lerp(danger12, other.danger12, t),
      success1: Color.lerp(success1, other.success1, t),
      success2: Color.lerp(success2, other.success2, t),
      success3: Color.lerp(success3, other.success3, t),
      success4: Color.lerp(success4, other.success4, t),
      success5: Color.lerp(success5, other.success5, t),
      success6: Color.lerp(success6, other.success6, t),
      success7: Color.lerp(success7, other.success7, t),
      success8: Color.lerp(success8, other.success8, t),
      success9: Color.lerp(success9, other.success9, t),
      success10: Color.lerp(success10, other.success10, t),
      success11: Color.lerp(success11, other.success11, t),
      success12: Color.lerp(success12, other.success12, t),
      warning1: Color.lerp(warning1, other.warning1, t),
      warning2: Color.lerp(warning2, other.warning2, t),
      warning3: Color.lerp(warning3, other.warning3, t),
      warning4: Color.lerp(warning4, other.warning4, t),
      warning5: Color.lerp(warning5, other.warning5, t),
      warning6: Color.lerp(warning6, other.warning6, t),
      warning7: Color.lerp(warning7, other.warning7, t),
      warning8: Color.lerp(warning8, other.warning8, t),
      warning9: Color.lerp(warning9, other.warning9, t),
      warning10: Color.lerp(warning10, other.warning10, t),
      warning11: Color.lerp(warning11, other.warning11, t),
      warning12: Color.lerp(warning12, other.warning12, t),
      info1: Color.lerp(info1, other.info1, t),
      info2: Color.lerp(info2, other.info2, t),
      info3: Color.lerp(info3, other.info3, t),
      info4: Color.lerp(info4, other.info4, t),
      info5: Color.lerp(info5, other.info5, t),
      info6: Color.lerp(info6, other.info6, t),
      info7: Color.lerp(info7, other.info7, t),
      info8: Color.lerp(info8, other.info8, t),
      info9: Color.lerp(info9, other.info9, t),
      info10: Color.lerp(info10, other.info10, t),
      info11: Color.lerp(info11, other.info11, t),
      info12: Color.lerp(info12, other.info12, t),
    );
  }
}
