import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';

class TcNotification {
  static DefaultFlashController<Object?> show(
    BuildContext context, {
    required String title,
  }) {
    return DefaultFlashController(
      context,
      duration: const Duration(seconds: 7),
      persistent: true,
      transitionDuration: const Duration(seconds: 1),
      reverseTransitionDuration: const Duration(seconds: 1),
      barrierCurve: Curves.fastLinearToSlowEaseIn,
      builder: (context, controller) {
        return HookBuilder(
          builder: (context) {
            final textTheme = useThemeExtension<TextThemes>();
            final colors = useThemeExtension<ColorsScheme>();

            return Flash(
              controller: controller,
              position: FlashPosition.top,
              forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
              reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
              child: FlashBar(
                controller: controller,
                position: FlashPosition.top,
                insetAnimationDuration: const Duration(seconds: 2),
                forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
                insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
                reverseAnimationCurve: Curves.fastLinearToSlowEaseIn,
                shadowColor: const Color.fromRGBO(0, 0, 0, 0.12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 6.w,
                ),
                behavior: FlashBehavior.floating,
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.h,
                  vertical: 22.5.h,
                ),
                content: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.b3_13_18_400.copyWith(color: colors.white),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
