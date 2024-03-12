import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';

class PrimaryButton extends HookWidget {
  final VoidCallback? onPress;
  final String? label;
  final bool loading;
  final bool enabled;
  final double height;
  final Color? color;
  final double? borderRadius;
  final TextStyle? labelStyle;
  final EdgeInsets? padding;
  final Border? border;

  const PrimaryButton({
    super.key,
    required this.onPress,
    this.label,
    this.loading = false,
    this.enabled = true,
    this.height = 52,
    this.color,
    this.borderRadius,
    this.labelStyle,
    this.padding,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = useThemeExtension<TextThemes>();
    final colors = useThemeExtension<ColorsScheme>();

    return Material(
      color: color ?? (enabled ? colors.blue : colors.grey),
      borderRadius: BorderRadius.circular(
        borderRadius ?? 24,
      ),
      child: InkWell(
        onTap: enabled && !loading ? onPress : null,
        borderRadius: BorderRadius.circular(
          borderRadius ?? 24,
        ),
        splashColor: colors.blue,
        highlightColor: colors.blue,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 3.r,
            ),
          ),
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: 13.h,
                horizontal: 21.w,
              ),
          child: Center(
            child: loading
                ? Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Text(
                        '',
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.b1_17_24_500,
                      ),
                      Center(
                        child: SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 1.8.r,
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (label?.isNotEmpty == true)
                        Text(
                          label ?? '',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: labelStyle?.copyWith(
                                color: colors.white,
                              ) ??
                              textTheme.b1_17_24_500.copyWith(
                                color: colors.white,
                              ),
                        ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
