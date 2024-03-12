import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/text_themes.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';

@immutable
abstract class InputDecorationBuilder {
  static InputDecoration defaultDecoration({
    EdgeInsets? contentPadding,
    double? radius,
    Widget? prefixIcon,
    BoxConstraints? prefixIconConstraints,
    Widget? suffixIcon,
    Widget? label,
    BoxConstraints? suffixIconConstraints,
    bool enabled = true,
    bool hasFocus = false,
    Color? fillColor,
    String? labelText,
  }) {
    final colors = useThemeExtension<ColorsScheme>();
    final themes = useThemeExtension<TextThemes>();

    return InputDecoration(
      labelText: labelText,
      enabled: enabled,
      errorStyle: themes.b1_17_24_400.copyWith(
        color: colors.grey,
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
        (Set<MaterialState> states) {
          return textThemes.b2_15_22_400.copyWith(color: colors.grey);
        },
      ),
      labelStyle: textThemes.b1_17_24_400.copyWith(color: colors.grey),
      contentPadding: contentPadding ??
          EdgeInsets.symmetric(
            vertical: 11.h,
          ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: colors.grey,
        ),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: colors.blue,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: colors.grey,
        ),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: colors.blue,
        ),
      ),
      hintStyle: themes.b1_17_24_400.copyWith(
        color: colors.grey,
      ),
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints ??
          BoxConstraints(
            maxHeight: 24.r,
            maxWidth: 24.r,
          ),
      suffixIcon: suffixIcon,
      suffixIconConstraints: suffixIconConstraints ??
          BoxConstraints(
            maxHeight: 24.r,
            maxWidth: 24.r,
          ),
      filled: true,
      fillColor: fillColor ?? Colors.transparent,
    );
  }
}
