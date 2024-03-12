/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/cloud_moon.svg
  SvgGenImage get cloudMoon => const SvgGenImage('assets/icons/cloud_moon.svg');

  /// File path: assets/icons/cloud_rain.svg
  SvgGenImage get cloudRain => const SvgGenImage('assets/icons/cloud_rain.svg');

  /// File path: assets/icons/cloud_snow.svg
  SvgGenImage get cloudSnow => const SvgGenImage('assets/icons/cloud_snow.svg');

  /// File path: assets/icons/cloud_storm.svg
  SvgGenImage get cloudStorm => const SvgGenImage('assets/icons/cloud_storm.svg');

  /// File path: assets/icons/cloud_sun.svg
  SvgGenImage get cloudSun => const SvgGenImage('assets/icons/cloud_sun.svg');

  /// File path: assets/icons/eye-closed.svg
  SvgGenImage get eyeClosed => const SvgGenImage('assets/icons/eye-closed.svg');

  /// File path: assets/icons/eye_open.svg
  SvgGenImage get eyeOpen => const SvgGenImage('assets/icons/eye_open.svg');

  /// File path: assets/icons/humidity.svg
  SvgGenImage get humidity => const SvgGenImage('assets/icons/humidity.svg');

  /// File path: assets/icons/location.svg
  SvgGenImage get location => const SvgGenImage('assets/icons/location.svg');

  /// File path: assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/sun.svg');

  /// File path: assets/icons/wind.svg
  SvgGenImage get wind => const SvgGenImage('assets/icons/wind.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        cloudMoon,
        cloudRain,
        cloudSnow,
        cloudStorm,
        cloudSun,
        eyeClosed,
        eyeOpen,
        humidity,
        location,
        sun,
        wind
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cloudy.png
  AssetGenImage get cloudy => const AssetGenImage('assets/images/cloudy.png');

  /// File path: assets/images/heavy_rain.png
  AssetGenImage get heavyRain => const AssetGenImage('assets/images/heavy_rain.png');

  /// File path: assets/images/rain.png
  AssetGenImage get rain => const AssetGenImage('assets/images/rain.png');

  /// File path: assets/images/snow.png
  AssetGenImage get snow => const AssetGenImage('assets/images/snow.png');

  /// File path: assets/images/storm.png
  AssetGenImage get storm => const AssetGenImage('assets/images/storm.png');

  /// File path: assets/images/sunny.png
  AssetGenImage get sunny => const AssetGenImage('assets/images/sunny.png');

  /// List of all assets
  List<AssetGenImage> get values => [cloudy, heavyRain, rain, snow, storm, sunny];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ru.json
  String get ru => 'assets/translations/ru.json';

  /// List of all assets
  List<String> get values => [ru];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
