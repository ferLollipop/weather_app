import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/common/widgets/primary_button.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class RetryWidget extends HookWidget {
  final VoidCallback retry;
  const RetryWidget({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    final textTheme = useThemeExtension<TextThemes>();
    final colors = useThemeExtension<ColorsScheme>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            LocaleKeys.errors_error.tr(),
            style: textTheme.h2_22_28.copyWith(
              color: colors.white,
            ),
          ),
          SizedBox(height: 48.h),
          PrimaryButton(
            onPress: retry,
            label: LocaleKeys.errors_repeat.tr(),
          )
        ],
      ),
    );
  }
}
