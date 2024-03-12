import 'package:flutter/material.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/generated/colors.gen.dart';
import 'package:weather_app/generated/fonts.gen.dart';

final textThemes = TextThemes(
  h1_32_36: () => const TextStyle(
    fontFamily: FontFamily.ubuntu,
    fontWeight: FontWeight.w500,
    fontSize: 32,
    color: ColorName.text,
    height: 36 / 32,
  ),
  h2_22_28: () => const TextStyle(
    fontFamily: FontFamily.ubuntu,
    fontWeight: FontWeight.w500,
    fontSize: 22,
    color: ColorName.text,
    height: 28 / 22,
  ),
  b1_17_24_400: () => const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    color: ColorName.text,
    height: 24 / 17,
  ),
  b1_17_24_500: () => const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 17,
    color: ColorName.text,
    height: 24 / 17,
  ),
  b2_15_22_400: () => const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: ColorName.text,
    height: 15 / 22,
  ),
  b2_15_22_500: () => const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: ColorName.text,
    height: 15 / 22,
  ),
  b3_13_18_400: () => const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: ColorName.text,
    height: 13 / 18,
  ),
  b3_13_18_500: () => const TextStyle(
    fontFamily: FontFamily.roboto,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: ColorName.text,
    height: 13 / 18,
  ),
);
