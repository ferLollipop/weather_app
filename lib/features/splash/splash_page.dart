import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/common/hooks/use_init_state.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/features/splash/state/splash_notifier.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useThemeExtension<ColorsScheme>();
    final textTheme = useThemeExtension<TextThemes>();
    final bloc = ref.watch(splashNotifierProvider.notifier);

    useInitState(onBuild: () {
      bloc.fetch();
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.0, 1.0],
              colors: [
                colors.black,
                colors.blue,
              ],
              transform: const GradientRotation(167.96 * (3.141592653589793 / 180)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 43.w),
                child: Text(
                  LocaleKeys.weather_service.tr(),
                  style: textTheme.h1_32_36.copyWith(
                    color: colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: Text(
                  LocaleKeys.dawn_is_coming_soon.tr(),
                  style: textTheme.b1_17_24_400.copyWith(
                    color: colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 85.h),
            ],
          ),
        ),
      ),
    );
  }
}
