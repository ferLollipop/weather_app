import 'package:flutter/material.dart';

typedef TextStyleBuilder = TextStyle Function();

@immutable
class TextThemes extends ThemeExtension<TextThemes> {
  /// Heading
  final TextStyleBuilder _h1_32_36;
  final TextStyleBuilder _h2_22_28;

  /// Main Text
  final TextStyleBuilder _b1_17_24_400;
  final TextStyleBuilder _b1_17_24_500;
  final TextStyleBuilder _b2_15_22_400;
  final TextStyleBuilder _b2_15_22_500;
  final TextStyleBuilder _b3_13_18_400;
  final TextStyleBuilder _b3_13_18_500;

  const TextThemes({
    required TextStyleBuilder h1_32_36,
    required TextStyleBuilder h2_22_28,
    required TextStyleBuilder b1_17_24_400,
    required TextStyleBuilder b1_17_24_500,
    required TextStyleBuilder b2_15_22_400,
    required TextStyleBuilder b2_15_22_500,
    required TextStyleBuilder b3_13_18_400,
    required TextStyleBuilder b3_13_18_500,
  })  : _h1_32_36 = h1_32_36,
        _h2_22_28 = h2_22_28,
        _b1_17_24_400 = b1_17_24_400,
        _b1_17_24_500 = b1_17_24_500,
        _b2_15_22_400 = b2_15_22_400,
        _b2_15_22_500 = b2_15_22_500,
        _b3_13_18_400 = b3_13_18_400,
        _b3_13_18_500 = b3_13_18_500;

  // Optional
  @override
  String toString() => '';

  @override
  TextThemes copyWith({
    TextStyleBuilder? h1_32_36,
    TextStyleBuilder? h2_22_28,
    TextStyleBuilder? b1_17_24_400,
    TextStyleBuilder? b1_17_24_500,
    TextStyleBuilder? b2_15_22_400,
    TextStyleBuilder? b2_15_22_500,
    TextStyleBuilder? b3_13_18_400,
    TextStyleBuilder? b3_13_18_500,
  }) {
    return TextThemes(
      h1_32_36: h1_32_36 ?? _h1_32_36,
      h2_22_28: h2_22_28 ?? _h2_22_28,
      b1_17_24_400: b1_17_24_400 ?? _b1_17_24_400,
      b1_17_24_500: b1_17_24_500 ?? _b1_17_24_500,
      b2_15_22_400: b2_15_22_400 ?? _b2_15_22_500,
      b2_15_22_500: b2_15_22_500 ?? _b2_15_22_500,
      b3_13_18_400: b3_13_18_400 ?? _b3_13_18_400,
      b3_13_18_500: b3_13_18_500 ?? _b3_13_18_500,
    );
  }

  @override
  ThemeExtension<TextThemes> lerp(ThemeExtension<TextThemes>? other, double t) {
    if (other is! TextThemes) return this;
    return other;
  }

  TextStyle get h1_32_36 => _h1_32_36();

  TextStyle get h2_22_28 => _h2_22_28();

  TextStyle get b1_17_24_400 => _b1_17_24_400();

  TextStyle get b1_17_24_500 => _b1_17_24_500();

  TextStyle get b2_15_22_400 => _b2_15_22_400();

  TextStyle get b2_15_22_500 => _b2_15_22_500();

  TextStyle get b3_13_18_400 => _b3_13_18_400();

  TextStyle get b3_13_18_500 => _b3_13_18_500();
}

@immutable
class ColorsScheme extends ThemeExtension<ColorsScheme> {
  final Color background;
  final Color text;
  final Color blue;
  final Color grey;
  final Color purple;
  final Color white;
  final Color black;

  const ColorsScheme({
    required this.background,
    required this.text,
    required this.blue,
    required this.grey,
    required this.purple,
    required this.white,
    required this.black,
  });

  @override
  ColorsScheme copyWith({
    Color? background,
    Color? text,
    Color? blue,
    Color? grey,
    Color? purple,
    Color? white,
    Color? black,
  }) {
    return ColorsScheme(
      background: background ?? this.background,
      text: text ?? this.text,
      blue: blue ?? this.blue,
      grey: grey ?? this.grey,
      purple: purple ?? this.purple,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  ThemeExtension<ColorsScheme> lerp(ThemeExtension<ColorsScheme>? other, double t) {
    if (other is! ColorsScheme) return this;
    return ColorsScheme(
      background: Color.lerp(background, other.background, t)!,
      text: Color.lerp(text, other.text, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}
