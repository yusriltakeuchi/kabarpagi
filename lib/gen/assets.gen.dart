/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/icon_darkmode.svg
  SvgGenImage get iconDarkmode =>
      const SvgGenImage('assets/icons/icon_darkmode.svg');

  /// File path: assets/icons/icon_globe.svg
  SvgGenImage get iconGlobe => const SvgGenImage('assets/icons/icon_globe.svg');

  /// File path: assets/icons/icon_morning.svg
  SvgGenImage get iconMorning =>
      const SvgGenImage('assets/icons/icon_morning.svg');

  /// File path: assets/icons/icon_news.svg
  SvgGenImage get iconNews => const SvgGenImage('assets/icons/icon_news.svg');

  /// File path: assets/icons/icon_notfound.svg
  SvgGenImage get iconNotfound =>
      const SvgGenImage('assets/icons/icon_notfound.svg');

  /// File path: assets/icons/icon_search.svg
  SvgGenImage get iconSearch =>
      const SvgGenImage('assets/icons/icon_search.svg');

  /// File path: assets/icons/icon_setting.svg
  SvgGenImage get iconSetting =>
      const SvgGenImage('assets/icons/icon_setting.svg');

  /// File path: assets/icons/icon_user.svg
  SvgGenImage get iconUser => const SvgGenImage('assets/icons/icon_user.svg');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/illustration_notfound.svg
  SvgGenImage get illustrationNotfound =>
      const SvgGenImage('assets/images/illustration_notfound.svg');

  /// File path: assets/images/illustration_search.svg
  SvgGenImage get illustrationSearch =>
      const SvgGenImage('assets/images/illustration_search.svg');
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
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
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
