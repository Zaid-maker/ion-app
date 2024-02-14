import 'package:flutter/material.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/templates/template.dart';
import 'package:ice/app/theme/app_colors.dart';
import 'package:ice/app/theme/app_text_themes.dart';

MenuThemeData buildMenuTheme(
  TemplateTheme templateTheme,
  AppColorsExtension colors,
  AppTextThemesExtension textThemes,
) {
  return MenuThemeData(
    style: MenuStyle(
      elevation: MaterialStatePropertyAll<double>(templateTheme.menu.elevation),
      shadowColor: MaterialStatePropertyAll<Color>(
        colors.tertararyBackground.withOpacity(0.3),
      ),
      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.fromLTRB(
          templateTheme.menu.paddingLeft.s,
          templateTheme.menu.paddingTop.s,
          templateTheme.menu.paddingRight.s,
          templateTheme.menu.paddingBottom.s,
        ),
      ),
      shape: MaterialStatePropertyAll<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(templateTheme.menu.borderRadius.s),
          ),
        ),
      ),
      backgroundColor:
          MaterialStatePropertyAll<Color>(colors.secondaryBackground),
    ),
  );
}
