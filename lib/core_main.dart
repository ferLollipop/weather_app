import 'dart:async';
import 'dart:io';

import 'package:async_task/async_task_extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/common/consts/app_constants.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/router/router.dart';
import 'package:weather_app/common/themes/color_scheme.dart';
import 'package:weather_app/common/themes/text_themes.dart';
import 'package:weather_app/common/utils/platforms.dart';
import 'package:weather_app/generated/fonts.gen.dart';

var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    colors: Platform.isIOS != true,
  ),
);

Future<void> coreMain() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();
      final app = await Firebase.initializeApp();
      FirebaseAuth.instanceFor(app: app);
      final directory = await getApplicationSupportDirectory();
      Hive.defaultDirectory = directory.path;

      if (!kReleaseMode) {
        EasyLocalization.logger.enableLevels = [
          LevelMessages.error,
          LevelMessages.info,
          LevelMessages.warning,
          LevelMessages.debug,
        ];
      }

      runApp(
        EasyLocalization(
          path: AppConstants.translationsPath,
          fallbackLocale: AppConstants.fallbackLocale,
          supportedLocales: AppConstants.supportedLocales,
          child: ProviderScope(
            overrides: await getOverridesDependency(),
            child: const App(),
          ),
        ),
      );
    },
    (Object error, StackTrace stack) {
      logger.e(error.toString(), error: error, stackTrace: stack);
    },
  );
}

class App extends StatefulHookConsumerWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<App> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (_) {
        SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
        );
      },
    );
    if (kReleaseMode) {
      FlutterError.onError = (error) {
        ref.read(loggerProvider).e(
              error.exception.toString(),
              error.exception,
              error.stack,
            );
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: PlatformsUtils.isMobile() ? const Size(375, 812) : const Size(1440, 1134),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: MaterialApp.router(
            title: AppConstants.appName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: theme.copyWith(
              extensions: <ThemeExtension<dynamic>>[
                colorsScheme,
                textThemes,
              ],
              appBarTheme: theme.appBarTheme.copyWith(
                centerTitle: false,
                backgroundColor: colorsScheme.white,
                elevation: 0,
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                ),
                iconTheme: IconThemeData(
                  color: colorsScheme.text,
                ),
              ),
              textTheme: theme.textTheme.apply(
                bodyColor: colorsScheme.text,
                fontFamily: FontFamily.roboto,
              ),
              //   inputDecorationTheme: theme.inputDecorationTheme.copyWith(
              //     filled: true,
              //     isCollapsed: true,
              //     contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              //     hintStyle: textThemes.strokeR_16_16.copyWith(
              //       color: colorsScheme.dark300,
              //     ),
              //     fillColor: colorsScheme.white,
              //     border: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: colorsScheme.border,
              //         width: 0.6,
              //       ),
              //       borderRadius: BorderRadius.circular(
              //         8.r,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(
              //           8,
              //         ),
              //       ),
              //       borderSide: BorderSide(
              //         color: colorsScheme.border,
              //         width: 0.6,
              //       ),
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(
              //           8,
              //         ),
              //       ),
              //       borderSide: BorderSide(
              //         color: colorsScheme.dark300,
              //         width: 0.6,
              //       ),
              //     ),
              //     focusedErrorBorder: OutlineInputBorder(
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(
              //           8,
              //         ),
              //       ),
              //       borderSide: BorderSide(
              //         color: colorsScheme.red100,
              //         width: 0.6,
              //       ),
              //     ),
              //     errorBorder: OutlineInputBorder(
              //       borderRadius: const BorderRadius.all(
              //         Radius.circular(
              //           8,
              //         ),
              //       ),
              //       borderSide: BorderSide(
              //         color: colorsScheme.red100,
              //         width: 0.6,
              //       ),
              //     ),
              //     helperStyle: const TextStyle(
              //       height: 1,
              //     ),
              //     errorStyle: const TextStyle(
              //       height: 1,
              //     ),
              //   ),
              //   scaffoldBackgroundColor: colorsScheme.white,
              //   elevatedButtonTheme: ElevatedButtonThemeData(
              //     style: ElevatedButton.styleFrom(
              //       elevation: 0,
              //       textStyle: textThemes.strokeM_18_18,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(
              //           8.r,
              //         ),
              //       ),
              //       minimumSize: Size(
              //         double.infinity,
              //         52.h,
              //       ),
              //     ),
              //   ),
            ),
            routerConfig: router,
          ),
        );
      },
    );
  }
}
