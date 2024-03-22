import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/utils/image.dart';

class Avatar extends StatelessWidget {
  Avatar({
    super.key,
    required this.size,
    required this.imageUrl,
    BorderRadiusGeometry? borderRadius,
    BoxFit? fit,
  })  : borderRadius = borderRadius ?? BorderRadius.circular(10.0.s),
        fit = fit ?? BoxFit.fitWidth;

  final double size;
  final String imageUrl;
  final BorderRadiusGeometry borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        imageUrl: getAdaptiveImageUrl(imageUrl, size * 2),
        width: size,
        height: size,
        fit: fit,
      ),
    );
  }
}
