import 'package:flutter/material.dart';
import 'package:ice/app/templates/template.dart';

IconThemeData buildIconTheme(TemplateTheme templateTheme) {
  final double averageSize =
      (templateTheme.icon.width + templateTheme.icon.height) / 2;

  return IconThemeData(
    size: averageSize,
    // color: iconButtonTheme.iconTintColor,
  );
}
