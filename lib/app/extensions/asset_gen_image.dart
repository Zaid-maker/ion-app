import 'package:flutter/widgets.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/generated/assets.gen.dart';

extension IconExtension on AssetGenImage {
  Widget icon({Color? color, double? size, BoxFit? fit}) {
    final iconSize = size ?? 24.0.s;
    return Image.asset(
      path,
      width: iconSize,
      height: iconSize,
      excludeFromSemantics: true,
      fit: fit ?? BoxFit.contain,
      color: color,
    );
  }

  Widget iconWithDimensions({Color? color, double? width, double? height}) {
    final iconWidth = width ?? 24.0.s;
    final iconHeight = height ?? 24.0.s;
    return Image.asset(
      path,
      width: iconWidth,
      height: iconHeight,
      excludeFromSemantics: true,
      fit: BoxFit.contain,
      color: color,
    );
  }
}
