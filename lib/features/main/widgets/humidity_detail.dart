import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/models/hourly_weather/hour.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/generated/assets.gen.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class HumidityDetail extends HookWidget {
  final Hour hour;

  const HumidityDetail(this.hour, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = useThemeExtension<ColorsScheme>();
    final textTheme = useThemeExtension<TextThemes>();

    final wind = useMemoized(() {
      final deg = hour.wind.deg;
      if ((deg >= 0 && deg < 22.5) || (deg >= 337.5 && deg < 360)) {
        return LocaleKeys.weather_wind_detail_north.tr();
      } else if (deg >= 22.5 && deg < 67.5) {
        return LocaleKeys.weather_wind_detail_northeast.tr();
      } else if (deg >= 67.5 && deg < 112.5) {
        return LocaleKeys.weather_wind_detail_eastern.tr();
      } else if (deg >= 112.5 && deg < 157.5) {
        return LocaleKeys.weather_wind_detail_southeast.tr();
      } else if (deg >= 157.5 && deg < 202.5) {
        return LocaleKeys.weather_wind_detail_south.tr();
      } else if (deg >= 202.5 && deg < 247.5) {
        return LocaleKeys.weather_wind_detail_southwest.tr();
      } else if (deg >= 247.5 && deg < 292.5) {
        return LocaleKeys.weather_wind_detail_west.tr();
      } else if (deg >= 292.5 && deg < 337.5) {
        return LocaleKeys.weather_wind_detail_northwest.tr();
      }
      return '';
    });

    final humidity = useMemoized(() {
      final humidity = hour.main.humidity;
      if (humidity < 34) {
        return LocaleKeys.weather_humidity_detail_low.tr();
      } else if (humidity < 67) {
        return LocaleKeys.weather_humidity_detail_medium.tr();
      } else if (humidity <= 100) {
        return LocaleKeys.weather_humidity_detail_high.tr();
      }
      return '';
    });

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: colors.white.withOpacity(.2),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Assets.icons.wind.svg(),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    LocaleKeys.weather_wind.tr(args: [
                      hour.wind.speed.round().toString(),
                    ]),
                    style: textTheme.b2_15_22_500.copyWith(
                      color: colors.white.withOpacity(0.2),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                wind,
                style: textTheme.b2_15_22_400.copyWith(
                  color: colors.white,
                ),
              )
            ],
          ),
          SizedBox(height: 16.r),
          Row(
            children: [
              Row(
                children: [
                  Assets.icons.humidity.svg(),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    LocaleKeys.weather_humidity.tr(args: [
                      hour.main.humidity.toString(),
                    ]),
                    style: textTheme.b2_15_22_500.copyWith(
                      color: colors.white.withOpacity(0.2),
                    ),
                  )
                ],
              ),
              const Spacer(),
              Text(
                humidity,
                style: textTheme.b2_15_22_400.copyWith(
                  color: colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
