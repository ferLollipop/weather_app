import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/providers/token_provider.dart';

part 'navigation_provider.g.dart';

enum Status { unAuth, authorized, unknown }

@Riverpod(keepAlive: true)
class NavigationNotifier extends _$NavigationNotifier {
  NavigationNotifier();

  @override
  Status build() => Status.unknown;

  void authWithTokens(String accessToken) async {
    try {
      await ref.read(tokenProvider).setToken(accessToken);
      authWithoutTokens();
    } catch (e, s) {
      ref.read(loggerProvider).e(e, e, s);
    }
  }

  void authWithoutTokens() async {
    if (ref.read(tokenProvider).isHave()) {
      state = Status.authorized;
    }
  }

  Future unAuth() async {
    await ref.read(tokenProvider).clear();
    state = Status.unAuth;
  }
}
