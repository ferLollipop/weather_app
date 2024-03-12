import 'package:talker/talker.dart';

enum Level {
  verbose,
  debug,
  info,
  warning,
  error,
  wtf,
  nothing,
}

mixin Logs {
  Future<void> d(message, [error, StackTrace? stackTrace]);

  Future<void> e(message, [error, StackTrace? stackTrace]);

  Future<void> i(message, [error, StackTrace? stackTrace]);

  Future<void> v(message, [error, StackTrace? stackTrace]);

  Future<void> w(message, [error, StackTrace? stackTrace]);

  Future<void> wtf(message, [error, StackTrace? stackTrace]);

  Future<List<TalkerData>> history();
}
