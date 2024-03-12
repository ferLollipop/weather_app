import 'package:collection/collection.dart';
import 'package:country_list_pick/support/code_countrys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/features/main/state/main_notifier.dart';
import 'package:weather_app/generated/assets.gen.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class Location extends HookConsumerWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = useThemeExtension<TextThemes>();
    final colors = useThemeExtension<ColorsScheme>();

    final location = ref.watch(mainNotifierProvider.select((state) {
      final city = state.value?.day?.name;
      final countryCode = state.value?.day?.sys.country;
      final country = codes.firstWhereOrNull((e) => e['code'] == countryCode)?['name'];
      if (city == null || country == null) return LocaleKeys.errors_no_location.tr();
      return '$city, $country';
    }));

    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Assets.icons.location.svg(),
            SizedBox(width: 8.w),
            Text(
              location,
              style: textTheme.b2_15_22_400.copyWith(
                color: colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
