import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/providers/navigation_provider.dart';

import 'routes.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final routerKey = ref.read(globalProvider);
  var authStatus = Status.unknown;

  ref.listen(
    navigationNotifierProvider,
    (_, next) async {
      authStatus = next;
      await null;
      switch (authStatus) {
        case Status.unAuth:
          routerKey.currentContext?.go(const AuthRoute().location);
          break;

        case Status.authorized:
          routerKey.currentContext?.go(const MainRoute().location);
          break;

        case Status.unknown:
          break;
      }
    },
  );

  final router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final isSplash = state.uri.path == const SplashRoute().location;
      if (isSplash) {
        return switch (authStatus) {
          Status.unAuth => const AuthRoute().location,
          Status.authorized => const MainRoute().location,
          Status.unknown => null,
        };
      }

      final isLoggingIn = state.uri.path == const AuthRoute().location;
      if (isLoggingIn) {
        return authStatus == Status.authorized ? const MainRoute().location : null;
      }

      if (!isSplash) {
        return authStatus == Status.authorized ? null : const SplashRoute().location;
      }
      return null;
    },
  );
  ref.onDispose(router.dispose);

  return router;
}
