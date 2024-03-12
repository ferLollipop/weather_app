// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:weather_app/common/config/config.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final Config _config;

  AuthInterceptor(
    this._config,
  );

  RequestOptions? requestOptions;
  String deviceUUID = '';

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, handler) {
    options._setApiKey(_config.apiKey);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, handler) {
    handler.next(response);
  }
}

extension AuthRequestOptionsX on RequestOptions {
  void _setApiKey(final String apiKey) => queryParameters['appid'] = apiKey;
}
