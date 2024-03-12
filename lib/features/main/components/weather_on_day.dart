import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/common/utils/date_extensions.dart';
import 'package:weather_app/features/main/state/main_notifier.dart';
import 'package:weather_app/features/main/widgets/hour_detail.dart';
import 'package:weather_app/features/main/widgets/humidity_detail.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class WeatherOnDay extends HookConsumerWidget {
  const WeatherOnDay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useThemeExtension<ColorsScheme>();
    final textTheme = useThemeExtension<TextThemes>();

    final forecast = ref.watch(mainNotifierProvider.select((state) {
      return state.value?.hourly?.list.take(4).toList() ?? [];
    }));

    final selectedItem = useState(forecast.firstOrNull);

    final today = useMemoized(() {
      return DateTime.now().parseFullMonthDay();
    });

    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: colors.white.withOpacity(.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.weather_today.tr(),
                      style: textTheme.b1_17_24_500.copyWith(
                        color: colors.white,
                      ),
                    ),
                    Text(
                      today,
                      style: textTheme.b2_15_22_400.copyWith(
                        color: colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: colors.white,
                height: 1,
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Row(
                  children: forecast
                      .map(
                        (e) => Expanded(
                          child: HourDetail(
                            e,
                            isSelected: selectedItem.value?.dt == e.dt,
                            onTap: (item) => selectedItem.value = item,
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
        if (selectedItem.value != null) HumidityDetail(selectedItem.value!),
      ],
    );
  }
}
