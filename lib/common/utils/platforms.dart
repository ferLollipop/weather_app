import 'dart:io';

class PlatformsUtils {
  static bool isMobile() {
    return Platform.isAndroid || Platform.isIOS;
  }
}
