import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/models/day_weather/weather_type.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/features/main/state/main_notifier.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class WeatherDetail extends HookConsumerWidget {
  const WeatherDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useThemeExtension<ColorsScheme>();
    final textTheme = useThemeExtension<TextThemes>();

    final (
      temp,
      minTemp,
      maxTemp,
      description,
      weatherType,
    ) = ref.watch(mainNotifierProvider.select((state) {
      return (
        state.value?.day?.main.temp.round() ?? 0,
        state.value?.day?.main.tempMin.round() ?? 0,
        state.value?.day?.main.tempMax.round() ?? 0,
        state.value?.day?.weather.firstOrNull?.description ?? '',
        state.value?.day?.weather.firstOrNull?.main ?? WeatherType.unknown,
      );
    }));

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          children: [
            Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                boxShadow: [
                  BoxShadow(
                    color: colors.purple,
                    spreadRadius: 80,
                    blurRadius: 70,
                  ),
                ],
              ),
            ),
            weatherType.getImageByType.image(
              width: 180.r,
              height: 180.r,
            ),
          ],
        ),
        Text(
          LocaleKeys.weather_temp.tr(args: [temp.toString()]),
          textAlign: TextAlign.center,
          style: textTheme.h1_32_36.copyWith(
            color: colors.white,
            fontSize: 64,
            height: 72 / 64,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: textTheme.b1_17_24_400.copyWith(
            color: colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          LocaleKeys.weather_min_max_temp.tr(args: [minTemp.toString(), maxTemp.toString()]),
          textAlign: TextAlign.center,
          style: textTheme.b1_17_24_400.copyWith(
            color: colors.white,
          ),
        ),
      ],
    );
  }
}
