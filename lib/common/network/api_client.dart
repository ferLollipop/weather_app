import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:weather_app/common/config/config.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';
import 'package:weather_app/common/network/interceptors/auth_interceptor.dart';

part 'api_client.g.dart';

@Riverpod(keepAlive: true)
APIClient apiClient(ApiClientRef ref) {
  return APIClient(
    ref.watch(configProvider),
    ref.watch(loggerProvider),
    ref.watch(talkerProvider),
  );
}

class APIClient {
  late Dio _dio;
  final Config config;
  final Logs logger;
  final Talker talker;

  APIClient(
    this.config,
    this.logger,
    this.talker,
  ) {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        sendTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 20),
        baseUrl: config.baseUrl,
      ),
    );

    _dio.interceptors.addAll(
      [
        AuthInterceptor(config),
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseData: false,
          ),
          talker: talker,
        ),
      ],
    );
  }

  Dio client() {
    return _dio;
  }
}
