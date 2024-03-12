import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:weather_app/common/hooks/use_form_group.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/common/widgets/info_input.dart';
import 'package:weather_app/common/widgets/primary_button.dart';
import 'package:weather_app/common/widgets/tc_notification.dart';
import 'package:weather_app/features/auth/state/auth_notifier.dart';
import 'package:weather_app/generated/assets.gen.dart';
import 'package:weather_app/generated/locale_keys.g.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = useThemeExtension<TextThemes>();
    final colors = useThemeExtension<ColorsScheme>();
    final isOpenedPassword = useState(true);

    final bloc = ref.watch(authNotifierProvider.notifier);

    final form = useFormGroup({
      'email': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.email],
        touched: true,
      ),
      'password': FormControl<String>(
        value: '',
        validators: [Validators.required, Validators.minLength(8)],
        touched: true,
      ),
    });

    ref.listen(
      authNotifierProvider,
      (prev, next) {
        if (next.error is FirebaseAuthException) {
          TcNotification.show(
            context,
            title: (next.error as FirebaseAuthException).message ??
                LocaleKeys.errors_email_or_password_incorrect.tr(),
          ).show();
        }
      },
    );

    return KeyboardDismissOnTap(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.h),
                Text(
                  LocaleKeys.auth_login.tr(),
                  style: textTheme.h1_32_36,
                ),
                SizedBox(height: 12.h),
                Text(
                  LocaleKeys.auth_enter_credits.tr(),
                  style: textTheme.b2_15_22_400.copyWith(color: colors.grey),
                ),
                SizedBox(height: 24.h),
                InfoInput(
                  formControl: form.control('email'),
                  label: LocaleKeys.auth_email.tr(),
                  showErrors: false,
                  maxLines: 1,
                ),
                SizedBox(height: 24.h),
                InfoInput(
                  formControl: form.control('password'),
                  label: LocaleKeys.auth_password.tr(),
                  showErrors: false,
                  maxLines: 1,
                  obscureText: isOpenedPassword.value,
                  suffixIcon: isOpenedPassword.value
                      ? GestureDetector(
                          onTap: () {
                            isOpenedPassword.value = false;
                          },
                          child: Assets.icons.eyeOpen.svg(),
                        )
                      : GestureDetector(
                          onTap: () {
                            isOpenedPassword.value = true;
                          },
                          child: Assets.icons.eyeClosed.svg(),
                        ),
                ),
                SizedBox(height: 48.h),
                ReactiveValueListenableBuilder(
                  formControl: form,
                  builder: (context, form, child) {
                    return PrimaryButton(
                      label: LocaleKeys.auth_log_in.tr(),
                      enabled: form.valid,
                      onPress: () {
                        bloc.login(
                          form.value!['email'].toString(),
                          form.value!['password'].toString(),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
