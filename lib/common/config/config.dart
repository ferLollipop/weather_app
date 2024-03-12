import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

@Riverpod(keepAlive: true)
Config config(_) => Config();

class Config {
  String baseUrl = FlavorConfig.instance.variables['base_url'];
  String apiKey = FlavorConfig.instance.variables['api_key'];
}
