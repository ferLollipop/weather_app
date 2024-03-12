import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/common/consts/shared_key.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';

part 'token_provider.g.dart';

@Riverpod(keepAlive: true)
TokenProvider token(TokenRef ref) {
  return TokenProvider(
    ref.watch(sharedPrefProvider),
    ref.watch(loggerProvider),
  );
}

class TokenProvider {
  final SharedPreferences _preferences;
  final Logs _logger;

  TokenProvider(
    this._preferences,
    this._logger,
  );

  bool isHave() {
    try {
      return _preferences.getString(SharedKey.authToken)?.isNotEmpty == true;
    } catch (e, s) {
      _logger.e(e, e, s);
      return false;
    }
  }

  Future<void> setToken(String token) async {
    try {
      await _preferences.remove(SharedKey.authToken);

      await _preferences.setString(SharedKey.authToken, token);
      _logger.d('${SharedKey.authToken} - $token');
    } catch (e, s) {
      _logger.e(e, e, s);
    }
  }

  String? getToken() {
    try {
      return _preferences.getString(SharedKey.authToken);
    } catch (e, s) {
      _logger.e(e, e, s);
      return null;
    }
  }

  Future<bool> clear() async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.remove(SharedKey.authToken);
      return true;
    } catch (e, s) {
      _logger.e(e, e, s);
      return false;
    }
  }
}
