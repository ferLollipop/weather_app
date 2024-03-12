import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'endpoints.g.dart';

@riverpod
Endpoints endpoints(_) => Endpoints();

class Endpoints {
  final weather = _Weather();
}

class _Weather {
  final day = '/weather';
  final hourly = '/forecast';
}
