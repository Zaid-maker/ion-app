import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ice/app/components/screen_offset/screen_top_offset.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/generated/assets.gen.dart';

double navigationHeaderHeight = 50.0.s;
double backButtonSide = 24.0.s;
double backButtonPadding = 10.0.s;

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({
    required this.title,
    this.showBackButton = true,
    this.showCloseButton = false,
    this.onBackPress,
  });

  final String title;
  final bool showBackButton;
  final bool showCloseButton;
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return ScreenTopOffset(
      child: Container(
        color: context.theme.appColors.secondaryBackground,
        height: navigationHeaderHeight,
        child: Row(
          children: <Widget>[
            if (showBackButton && !showCloseButton)
              IconButton(
                icon: Image.asset(
                  Assets.images.icons.iconBackArrow.path,
                  width: backButtonSide,
                  height: backButtonSide,
                ),
                onPressed: () {
                  if (onBackPress != null) {
                    onBackPress!();
                  } else {
                    context.pop();
                  }
                },
              )
            else
              SizedBox(width: backButtonSide + backButtonPadding * 2),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.theme.appTextThemes.title,
              ),
            ),
            if (showCloseButton)
              IconButton(
                icon: Image.asset(
                  Assets.images.icons.iconSheetClose.path,
                  width: backButtonSide,
                  height: backButtonSide,
                ),
                onPressed: () {
                  if (onBackPress != null) {
                    onBackPress!();
                  } else {
                    context.pop();
                  }
                },
              )
            else
              SizedBox(width: backButtonSide + backButtonPadding * 2),
          ],
        ),
      ),
    );
  }
}