import 'package:flutter/material.dart';

class ColorTokens extends ThemeExtension<ColorTokens> {
  final TextToken? text;
  final BackgroundToken? background;
  final SurfaceToken? surface;
  final InputsToken? inputs;
  final ButtonToken? button;
  final IconToken? icon;
  final StatusToken? status;
  final TabToken? tabs;

  ColorTokens({
    this.text,
    this.background,
    this.surface,
    this.inputs,
    this.button,
    this.icon,
    this.status,
    this.tabs,
  });

  @override
  ThemeExtension<ColorTokens> copyWith({
    TextToken? text,
    BackgroundToken? background,
    SurfaceToken? surface,
    InputsToken? inputs,
    ButtonToken? button,
    IconToken? icon,
    StatusToken? status,
    TabToken? tabs,
  }) {
    return ColorTokens(
      text: text ?? this.text,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      button: button ?? this.button,
      icon: icon ?? this.icon,
      status: status ?? this.status,
      tabs: tabs ?? this.tabs,
    );
  }

  @override
  ThemeExtension<ColorTokens> lerp(covariant ThemeExtension<ColorTokens>? other, double t) {
    if (other is! ColorTokens) {
      return this;
    }
    return other;
  }
}

class TextToken {
  final Color? primary;
  final Color? white;
  final Color? whiteInvert;
  final Color? secondary;
  final Color? nearVisible;
  final Color? common;
  final Color? destructive;
  final Color? textBrandColor;

  TextToken({
    this.primary,
    this.white,
    this.whiteInvert,
    this.secondary,
    this.nearVisible,
    this.common,
    this.destructive,
    this.textBrandColor,
  });
}

class BackgroundToken {
  final Color? primary;
  final Color? bgIcon;
  final Color? basMenuBg;

  BackgroundToken({
    this.primary,
    this.bgIcon,
    this.basMenuBg,
  });
}

class SurfaceToken {
  final Color? primary;
  final Color? secondary;
  final Color? stroke;
  final Color? white;

  SurfaceToken({
    this.primary,
    this.secondary,
    this.stroke,
    this.white,
  });
}

class NavigationToken {
  final Color? color;
  final Color? navigationBg;

  NavigationToken({
    this.color,
    this.navigationBg,
  });
}

class InputsToken {
  final InputStrokeToken? stroke;
  final InputBackgroundToken? background;
  final InputTextToken? text;
  final InputIconToken? icons;

  InputsToken({
    this.stroke,
    this.background,
    this.text,
    this.icons,
  });
}

class InputStrokeToken {
  final Color? active;
  final Color? destructive;

  InputStrokeToken({
    this.active,
    this.destructive,
  });
}

class InputBackgroundToken {
  final Color? stable;
  final Color? active;
  final Color? disabled;

  InputBackgroundToken({
    this.active,
    this.stable,
    this.disabled,
  });
}

class InputTextToken {
  final Color? stable;
  final Color? filled;
  final Color? disabled;
  final Color? hintColor;
  final Color? destructive;

  InputTextToken({
    this.filled,
    this.stable,
    this.disabled,
    this.hintColor,
    this.destructive,
  });
}

class InputIconToken {
  final Color? stable;
  final Color? danger;
  final Color? disabled;
  final Color? success;
  final Color? loginStable;
  final Color? loginActive;
  final Color? loginDanger;

  InputIconToken({
    this.success,
    this.stable,
    this.disabled,
    this.danger,
    this.loginActive,
    this.loginDanger,
    this.loginStable,
  });
}

class ButtonToken {
  final ButtonSubToken? primary;
  final ButtonSubToken? secondary;
  final ButtonSubToken? natural;
  final ButtonSubToken? danger;
  final ButtonSubToken? success;

  ButtonToken({this.primary, this.secondary, this.natural, this.danger, this.success});
}

class ButtonSubToken {
  final ButtonBackgroundToken? background;
  final ButtonTextToken? text;
  final ButtonIconToken? icon;
  final ButtonStrokeToken? stroke;

  ButtonSubToken({
    this.background,
    this.text,
    this.icon,
    this.stroke,
  });
}

class ButtonBackgroundToken {
  final Color? stable;
  final Color? onPress;
  final Color? disabled;

  ButtonBackgroundToken({
    this.stable,
    this.onPress,
    this.disabled,
  });
}

class ButtonTextToken {
  final Color? stable;
  final Color? white;
  final Color? disabled;

  ButtonTextToken({
    this.stable,
    this.white,
    this.disabled,
  });
}

class ButtonIconToken {
  final Color? stable;
  final Color? white;
  final Color? disabled;

  ButtonIconToken({
    this.stable,
    this.white,
    this.disabled,
  });
}

class ButtonStrokeToken {
  final Color? stable;
  final Color? onPress;
  final Color? disabled;

  ButtonStrokeToken({
    this.stable,
    this.onPress,
    this.disabled,
  });
}

class IconToken {
  final Color? dark;
  final Color? darkInvert;
  final Color? white;
  final Color? whiteInvert;
  final Color? gray;
  final Color? darkGray;

  IconToken({
    this.dark,
    this.darkInvert,
    this.darkGray,
    this.white,
    this.whiteInvert,
    this.gray,
  });
}

class TabToken {
  final Color? selected;
  final Color? stable;
  final Color? stableStroke;

  TabToken({
    this.selected,
    this.stable,
    this.stableStroke,
  });
}

class StatusToken {
  final StatusBackgroundToken? background;
  final StatusTextToken? text;
  final StatusIconToken? icon;

  StatusToken({
    this.background,
    this.text,
    this.icon,
  });
}

class StatusBackgroundToken {
  final Color? completed;
  final Color? pending;
  final Color? late;
  final Color? danger;
  final Color? blue;

  StatusBackgroundToken({
    this.completed,
    this.pending,
    this.late,
    this.danger,
    this.blue,
  });
}

class StatusTextToken {
  final Color? completed;
  final Color? pending;
  final Color? late;
  final Color? danger;
  final Color? blue;

  StatusTextToken({
    this.completed,
    this.pending,
    this.late,
    this.danger,
    this.blue,
  });
}

class StatusIconToken {
  final Color? completed;
  final Color? pending;
  final Color? late;
  final Color? danger;

  StatusIconToken({
    this.completed,
    this.pending,
    this.late,
    this.danger,
  });
}
