import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/common/di/infra_module.dart';
import 'package:weather_app/common/logs/logs.dart';
import 'package:weather_app/common/utils/ref_keep_providers_extension.dart';

part 'connectivity_service.g.dart';

@riverpod
class ConnectivityService extends _$ConnectivityService {
  final _connectivity = Connectivity();
  Logs get _log => ref.read(loggerProvider);

  @override
  ConnectivityResult build() {
    ref.keepProviders([
      loggerProvider,
    ]);

    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      state = result;
      _log.i('Connectivity changed: ${result.name}');
    });

    _connectivity.checkConnectivity().then((value) {
      state = value;
      _log.i('Connectivity changed: ${value.name}');
    });

    return ConnectivityResult.none;
  }

  Future<bool> isHaveInternet() async {
    return (await _connectivity.checkConnectivity()).isHaveInternet();
  }
}

extension ConnectivityResultExt on ConnectivityResult {
  bool isHaveInternet() {
    return this != ConnectivityResult.none;
  }
}
