import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart' as pr;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:weather_app/common/logs/locale_logs.dart';
import 'package:weather_app/common/logs/logs.dart';

part 'infra_module.g.dart';

Future<List<Override>> getOverridesDependency() async {
  final sp = await SharedPreferences.getInstance();
  final tkProvider = TalkerFlutter.init(
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(enableColors: Platform.isIOS != true),
    ),
  );
  return [
    sharedPrefProvider.overrideWithValue(sp),
    talkerProvider.overrideWithValue(tkProvider),
  ];
}

final globalProvider = Provider<GlobalKey<NavigatorState>>((ref) {
  return GlobalKey<NavigatorState>();
});

@Riverpod(keepAlive: true)
Logs logger(ref) {
  return LocaleLogs(
    level: kReleaseMode ? pr.Level.off : pr.Level.trace,
    talker: ref.watch(talkerProvider),
  );
}

final sharedPrefProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final talkerProvider = Provider<Talker>((ref) {
  throw UnimplementedError();
});
