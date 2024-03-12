import 'package:logger/logger.dart' as pr;
import 'package:talker/talker.dart';

import 'logs.dart';

class LocaleLogs implements Logs {
  final pr.Level level;
  final Talker talker;

  LocaleLogs({
    required this.level,
    required this.talker,
  });

  @override
  Future<List<TalkerData>> history() async {
    return talker.history;
  }

  @override
  Future<void> d(message, [error, StackTrace? stackTrace]) async {
    return talker.debug(message, error, stackTrace);
  }

  @override
  Future<void> e(message, [error, StackTrace? stackTrace]) async {
    return talker.error(message, error, stackTrace);
  }

  @override
  Future<void> i(message, [error, StackTrace? stackTrace]) async {
    return talker.info(message, error, stackTrace);
  }

  @override
  Future<void> v(message, [error, StackTrace? stackTrace]) async {
    return talker.verbose(message, error, stackTrace);
  }

  @override
  Future<void> w(message, [error, StackTrace? stackTrace]) async {
    return talker.warning(message, error, stackTrace);
  }

  @override
  Future<void> wtf(message, [error, StackTrace? stackTrace]) async {
    return talker.critical(message, error, stackTrace);
  }
}
