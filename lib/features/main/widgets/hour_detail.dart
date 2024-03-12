import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/models/day_weather/weather_type.dart';
import 'package:weather_app/common/models/hourly_weather/hour.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/common/utils/date_extensions.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class HourDetail extends HookWidget {
  final Hour hour;
  final bool isSelected;
  final ValueChanged<Hour> onTap;

  const HourDetail(
    this.hour, {
    super.key,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = useThemeExtension<ColorsScheme>();
    final textTheme = useThemeExtension<TextThemes>();

    final (time, image, temp) = useMemoized(() {
      return (
        hour.dtTxt.parseTime(),
        hour.weather.firstOrNull?.main ?? WeatherType.unknown,
        hour.main.temp.round(),
      );
    }, [hour]);

    return GestureDetector(
      onTap: () => onTap(hour),
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: colors.white.withOpacity(.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.white),
              )
            : BoxDecoration(
                color: colors.white.withOpacity(0),
              ),
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              Text(
                time,
                style: textTheme.b2_15_22_400.copyWith(
                  color: colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              image.getSvgByType.svg(
                width: 32.r,
                height: 32.r,
              ),
              SizedBox(height: 16.h),
              Text(
                LocaleKeys.weather_temp.tr(args: [temp.toString()]),
                style: textTheme.b1_17_24_500.copyWith(
                  color: colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
