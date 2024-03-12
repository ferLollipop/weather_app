import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/common/hooks/use_init_state.dart';
import 'package:weather_app/common/hooks/use_theme_extension.dart';
import 'package:weather_app/common/services/location_permission_service.dart';
import 'package:weather_app/common/themes/theme_extensions.dart';
import 'package:weather_app/features/main/components/location.dart';
import 'package:weather_app/features/main/components/weather_detail.dart';
import 'package:weather_app/features/main/components/weather_on_day.dart';
import 'package:weather_app/features/main/state/main_notifier.dart';
import 'package:weather_app/features/main/widgets/retry_widget.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = useThemeExtension<ColorsScheme>();
    final state = ref.watch(mainNotifierProvider);
    final bloc = ref.watch(mainNotifierProvider.notifier);
    final position = ref.watch(locationPermissionsServiceProvider);
    final positionService = ref.watch(locationPermissionsServiceProvider.notifier);

    final refreshPage = useCallback(() async {
      try {
        final position = await positionService.getUserUpdatedLocationFuture();
        if (position != null) {
          bloc.fetchWeather(position.latitude, position.longitude);
        }
      } catch (e, s) {
        bloc.setError(e, s);
      }
    }, []);

    useInitState(
      onBuild: () {
        if (position.value != null) {
          refreshPage();
        } else if (position is AsyncError) {
          bloc.setError(position.error!, position.stackTrace!);
        }
      },
      keys: [position],
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: colors.black,
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
                colors.blue.withOpacity(0.439216),
              ],
              transform: const GradientRotation(167.96 * (3.141592653589793 / 180)),
            ),
          ),
          child: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async => refreshPage(),
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                slivers: state.when(
                  data: (_) {
                    return [
                      const SliverToBoxAdapter(child: Location()),
                      const SliverToBoxAdapter(child: WeatherDetail()),
                      const SliverToBoxAdapter(child: WeatherOnDay()),
                    ];
                  },
                  error: (_, __) {
                    return [
                      SliverFillRemaining(
                        child: Center(
                          child: RetryWidget(
                            retry: refreshPage,
                          ),
                        ),
                      ),
                    ];
                  },
                  loading: () {
                    return [
                      SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(color: colors.white),
                        ),
                      )
                    ];
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
