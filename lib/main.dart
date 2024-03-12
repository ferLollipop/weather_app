import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:weather_app/core_main.dart';

void main() async {
  FlavorConfig(
    name: 'General',
    variables: {
      'base_url': 'https://api.openweathermap.org/data/2.5',
      'api_key': '562c17105b016a43a2bbb71167bb7646',
    },
  );

  await coreMain();
}
