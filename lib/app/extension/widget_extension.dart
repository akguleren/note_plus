import 'package:flutter/material.dart';
import 'package:note_plus/app/init/theme/colors/color_tokens_def.dart';
import 'package:note_plus/app/init/theme/fonts/custom_fonts.dart';

extension WidgetExtension on Widget {
  Widget toLabelWithHelperText(
    BuildContext context, {
    String? labelText,
    String? helperText,
    bool required = false,
    TextStyle? labelTextStyle,
    TextStyle? helperTextStyle,
  }) {
    final textTheme = Theme.of(context).extension<CustomFonts>()!;
    final colorTokens = Theme.of(context).extension<ColorTokens>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText?.isNotEmpty ?? false) ...[
          Text(
            '${labelText!} ${required ? '*' : ''}',
            style: labelTextStyle ?? textTheme.body2.copyWith(color: colorTokens.inputs?.text?.filled),
          ),
          const SizedBox(height: 5),
        ],
        this,
        if (helperText?.isNotEmpty ?? false) ...[
          const SizedBox(height: 5),
          Text(
            helperText!,
            style: helperTextStyle ?? textTheme.body2.copyWith(color: colorTokens.inputs?.text?.hintColor),
          ),
        ],
      ],
    );
  }
}
