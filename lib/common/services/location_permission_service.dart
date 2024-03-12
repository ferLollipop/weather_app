import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/core_main.dart';

part 'location_permission_service.g.dart';

@riverpod
class LocationPermissionsService extends _$LocationPermissionsService {
  late bool _serviceEnabled;
  late LocationPermission _permission;

  @override
  AsyncValue<Position?> build() {
    init();
    return const AsyncLoading();
  }

  Future<void> init() async {
    try {
      _serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!_serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      _permission = await Geolocator.checkPermission();
      if (_permission == LocationPermission.denied) {
        _permission = await Geolocator.requestPermission();
        if (_permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (_permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      state = AsyncData(await getUserUpdatedLocationFuture());
    } catch (e, s) {
      state = AsyncError(e, s);
      logger.e(e, error: e, stackTrace: s);
    }
  }

  Future<Position?> getUserUpdatedLocationFuture() async {
    try {
      Position? userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        timeLimit: const Duration(seconds: 3),
      );
      return userPosition;
    } catch (e) {
      return await Geolocator.getLastKnownPosition();
    }
  }
}
