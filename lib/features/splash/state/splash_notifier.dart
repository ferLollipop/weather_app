import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/providers/navigation_provider.dart';
import 'package:weather_app/common/providers/token_provider.dart';
import 'package:weather_app/common/utils/ref_keep_providers_extension.dart';

part 'splash_notifier.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  AsyncValue build() {
    ref.keepProviders([
      tokenProvider,
      navigationNotifierProvider.notifier,
    ]);
    fetch().ignore();
    return const AsyncValue.loading();
  }

  Future<void> fetch() async {
    final navNotifier = ref.read(navigationNotifierProvider.notifier);

    try {
      state = const AsyncValue.loading();
      await Future.delayed(const Duration(seconds: 3));
      final tokenProv = ref.read(tokenProvider);

      if (tokenProv.isHave()) {
        navNotifier.authWithoutTokens();
      } else {
        navNotifier.unAuth();
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
