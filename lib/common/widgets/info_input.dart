import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:weather_app/common/hooks/use_init_state.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/common/widgets/input_decoration_builder.dart';

class InfoInput extends HookConsumerWidget {
  final String? value;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool autofocus;
  final bool hasError;
  final bool hasFocus;
  final bool obscureText;
  final bool hasCompleted;
  final bool? readOnly;
  final TextInputType keyboardType;
  final VoidCallback? onComplete;
  final ValueChanged<dynamic>? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final EdgeInsets? contentPadding;
  final Widget? leftWidget;
  final double? height;
  final Color valueColor;
  final TextCapitalization? textCapitalization;
  final int? minLines;
  final int? maxLines;
  final double? radius;
  final Color? fillColor;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final double? labelSpacing;
  final AbstractControl<dynamic>? formControl;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final FocusNode? focusNode;
  final bool? showErrors;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final bool expands;
  final int? maxLength;
  final String? label;

  const InfoInput({
    super.key,
    this.controller,
    this.label,
    this.value,
    this.suffixIcon,
    this.prefixIcon,
    this.hasFocus = false,
    this.hasError = false,
    this.autofocus = false,
    this.obscureText = false,
    this.hasCompleted = false,
    this.expands = false,
    this.keyboardType = TextInputType.text,
    this.onComplete,
    this.inputFormatter,
    this.contentPadding,
    this.leftWidget,
    this.height,
    this.valueColor = Colors.black,
    this.textCapitalization,
    this.minLines,
    this.maxLines,
    this.radius,
    this.fillColor,
    this.textStyle,
    this.labelStyle,
    this.labelSpacing,
    this.readOnly,
    this.formControl,
    this.validationMessages,
    this.prefixIconConstraints,
    this.focusNode,
    this.showErrors,
    this.onChanged,
    this.onTap,
    this.suffixIconConstraints,
    this.textInputAction = TextInputAction.done,
    this.autofillHints,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useThemeExtension<ColorsScheme>();
    final themes = useThemeExtension<TextThemes>();

    final focus = useMemoized(() => focusNode ?? FocusNode());
    final hasFocus = useState(focus.hasFocus);

    useInitState(
      initState: () {
        focus.addListener(() {
          hasFocus.value = focus.hasFocus;
        });

        return () => focus.removeListener(() {
              hasFocus.value = focus.hasFocus;
            });
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (leftWidget != null) leftWidget!,
              if (leftWidget != null) SizedBox(width: 16.w),
              Expanded(
                child: HookBuilder(
                  builder: (context) {
                    if (formControl == null) {
                      final controllerDefault = TextEditingController(text: value);
                      return TextFormField(
                        maxLength: maxLength,
                        expands: expands,
                        controller: controller ?? controllerDefault,
                        focusNode: focus,
                        keyboardType: keyboardType,
                        obscureText: obscureText,
                        cursorColor: colors.grey,
                        autocorrect: true,
                        autofocus: autofocus,
                        inputFormatters: inputFormatter,
                        textCapitalization: textCapitalization ?? TextCapitalization.none,
                        style: textStyle ??
                            themes.b1_17_24_400.copyWith(
                              color: hasCompleted && !hasFocus.value ? colors.text : valueColor,
                            ),
                        onFieldSubmitted: (val) {
                          if (onComplete != null) {
                            onComplete!();
                          }
                        },
                        onTap: () {
                          if (onTap != null) onTap!();
                        },
                        onChanged: onChanged,
                        enableSuggestions: true,
                        minLines: minLines,
                        maxLines: maxLines,
                        readOnly: readOnly ?? false,
                        textAlignVertical: const TextAlignVertical(y: -0.5),
                        decoration: InputDecorationBuilder.defaultDecoration(
                          fillColor: fillColor,
                          contentPadding: contentPadding,
                          radius: radius,
                          prefixIcon: prefixIcon,
                          prefixIconConstraints: prefixIconConstraints,
                          suffixIcon: suffixIcon,
                          suffixIconConstraints: suffixIconConstraints,
                          hasFocus: hasFocus.value,
                          labelText: label,
                        ),
                      );
                    }
                    return ReactiveStatusListenableBuilder(
                      formControl: formControl,
                      builder: (_, control, widget) {
                        return Container(
                          child: widget,
                        );
                      },
                      child: ReactiveTextField(
                        expands: expands,
                        controller: controller,
                        focusNode: focus,
                        formControl: formControl as FormControl<String>,
                        keyboardType: keyboardType,
                        obscureText: obscureText,
                        cursorColor: Colors.black,
                        autocorrect: true,
                        autofocus: autofocus,
                        inputFormatters: inputFormatter,
                        validationMessages: validationMessages,
                        readOnly: readOnly ?? false,
                        textCapitalization: textCapitalization ?? TextCapitalization.none,
                        textInputAction: textInputAction ?? TextInputAction.next,
                        autofillHints: autofillHints,
                        style: textStyle ??
                            themes.b1_17_24_400.copyWith(
                              color: hasCompleted && !hasFocus.value ? colors.text : valueColor,
                            ),
                        onSubmitted: (control) {
                          formControl?.unfocus();
                          if (onComplete != null) {
                            onComplete!();
                          }
                        },
                        onTap: (_) {
                          if (onTap != null) onTap!();
                        },
                        onChanged: onChanged,
                        enableSuggestions: false,
                        minLines: minLines,
                        maxLines: maxLines,
                        textAlignVertical: const TextAlignVertical(y: -0.5),
                        decoration: InputDecorationBuilder.defaultDecoration(
                          fillColor: fillColor,
                          contentPadding: contentPadding,
                          radius: radius,
                          prefixIcon: prefixIcon,
                          prefixIconConstraints: prefixIconConstraints,
                          suffixIcon: suffixIcon,
                          suffixIconConstraints: suffixIconConstraints,
                          hasFocus: hasFocus.value,
                          labelText: label,
                        ),
                        showErrors: (control) =>
                            showErrors ?? (control.invalid && control.touched && control.dirty),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
