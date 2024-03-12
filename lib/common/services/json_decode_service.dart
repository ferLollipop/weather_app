// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:async_task/async_task.dart';
import 'package:async_task/async_task_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'json_decode_service.g.dart';

// This top-level function returns the tasks types that will be registered
// for execution. Task instances are returned, but won't be executed and
// will be used only to identify the task type:
@pragma('vm:entry-point')
List<AsyncTask> _taskTypeRegister() => [
      _JsonDecodeTask(
        args: _JsonDecodeArgs(
          jsonDecoder: (data) {},
          data: null,
        ),
      )
    ];

class _JsonDecodeArgs {
  final Function(dynamic) jsonDecoder;
  final dynamic data;

  const _JsonDecodeArgs({
    required this.jsonDecoder,
    required this.data,
  });
}

class _JsonDecodeTask<T> extends AsyncTask<_JsonDecodeArgs, T> {
  final _JsonDecodeArgs args;

  _JsonDecodeTask({
    required this.args,
  });

  @override
  AsyncTask<_JsonDecodeArgs, T> instantiate(
    _JsonDecodeArgs parameters, [
    Map<String, SharedData>? sharedData,
  ]) {
    return _JsonDecodeTask(
      args: parameters,
    );
  }

  @override
  _JsonDecodeArgs parameters() {
    return args;
  }

  @override
  FutureOr<T> run() {
    if (kDebugMode) {
      return args.jsonDecoder(args.data);
    }

    try {
      return args.jsonDecoder(args.data);
    } catch (_, __) {
      return Future.value(null);
    }
  }
}

@riverpod
JsonDecodeService jsonDecodeService(_) => JsonDecodeService();

class JsonDecodeService {
  final asyncExecutor = AsyncExecutor(
    sequential: false, // Non-sequential tasks.
    parallelism: 6, // Concurrency with 4 threads.
    taskTypeRegister: _taskTypeRegister, // The top-level function to register the tasks types.
  );

  JsonDecodeService() {
    if (!kReleaseMode) {
      asyncExecutor.logger.enabled = true;
    }
  }

  Future<T> run<T>({
    required Function(dynamic) jsonDecoder,
    required dynamic data,
  }) async {
    return (await asyncExecutor.execute(
      _JsonDecodeTask(
        args: _JsonDecodeArgs(
          jsonDecoder: jsonDecoder,
          data: data,
        ),
      ),
    )) as T;
  }
}
