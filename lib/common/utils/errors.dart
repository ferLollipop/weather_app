import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather_app/common/network/errors.dart' as network;
import 'package:weather_app/generated/locale_keys.g.dart';

abstract class AppErrors implements Exception {
  String get defaultTitle;

  String? get defaultMessage;
}

class UnknownError extends AppErrors {
  @override
  String get defaultTitle => LocaleKeys.errors_error.tr();

  @override
  String get defaultMessage => LocaleKeys.errors_unknown.tr();
}

class ApiError extends AppErrors {
  final String title;
  final String? message;

  ApiError({required this.title, this.message});

  @override
  String get defaultTitle => title;

  @override
  String? get defaultMessage => message;
}

class BadRequest extends AppErrors {
  final String title;
  final String? message;

  BadRequest({required this.title, this.message});

  @override
  String get defaultTitle => title;

  @override
  String? get defaultMessage => message;
}

class AuthError extends AppErrors {
  @override
  final String defaultTitle;

  @override
  final String? defaultMessage;

  AuthError({this.defaultMessage, required this.defaultTitle});

  factory AuthError.wrongPassword() => AuthError(
        defaultTitle: LocaleKeys.errors_error.tr(),
        defaultMessage: LocaleKeys.errors_email_or_password_incorrect.tr(),
      );
}

class Errors {
  static AppErrors map(dynamic e) {
    switch (e.runtimeType) {
      case network.BadRequest:
      case DioException:
        final error = e as DioException;
        final response = error.response as Response<dynamic>;
        final msg =
            (response.data['error'] is Iterable ? response.data['error'] : [response.data['error']])
                ?.join(', ');
        final title = response.data['message'];

        return BadRequest(title: title, message: msg ?? error.message);
      case AuthError:
        return BadRequest(title: e.defaultTitle, message: e.defaultMessage);
      case network.NotFound:
        final error = e as network.NotFound;
        final response = error.response as Response<dynamic>;
        final msg =
            (response.data['error'] is Iterable ? response.data['error'] : [response.data['error']])
                ?.join(', ');
        final title = response.data['message'];

        return ApiError(title: title, message: msg ?? error.message);
      case network.ServerInternal:
        return ApiError(title: LocaleKeys.errors_server.tr());
      case network.NoInternetConnection:
        return ApiError(title: LocaleKeys.errors_no_internet.tr());

      default:
        return UnknownError();
    }
  }
}
