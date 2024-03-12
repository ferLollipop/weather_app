import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';
import 'package:weather_app/common/providers/navigation_provider.dart';
import 'package:weather_app/common/utils/ref_keep_providers_extension.dart';
import 'package:weather_app/features/auth/state/auth_state.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  Logs get _log => ref.read(loggerProvider);

  NavigationNotifier get navNotifier => ref.read(navigationNotifierProvider.notifier);

  @override
  AuthState build() {
    ref.keepProviders([
      loggerProvider,
    ]);

    return const AuthState();
  }

  Future login(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = user.user?.uid;
      print(token);
      if (token != null) navNotifier.authWithTokens(token);
    } catch (e, s) {
      _log.e(e, e, s);
      state = state.copyWith(error: e);
    }
  }
}
