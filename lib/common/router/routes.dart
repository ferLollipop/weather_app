import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/auth/auth_page.dart';
import 'package:weather_app/features/main/main_page.dart';
import 'package:weather_app/features/shell_rout_page/shell_route_page.dart';
import 'package:weather_app/features/splash/splash_page.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<AuthRoute>(path: '/auth')
class AuthRoute extends GoRouteData {
  const AuthRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AuthPage();
  }
}

@TypedStatefulShellRoute<HomeRoute>(branches: [
  TypedStatefulShellBranch<MainBranchData>(routes: [
    TypedGoRoute<MainRoute>(path: '/'),
  ]),
])
class HomeRoute extends StatefulShellRouteData {
  const HomeRoute();

  static const String $restorationScopeId = 'homeRestorationScope';

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      ShellRoutePage(
        shell: navigationShell,
      );
}

class MainBranchData extends StatefulShellBranchData {}

class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainPage();
  }
}
