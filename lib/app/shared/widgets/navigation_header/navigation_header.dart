import 'package:flutter/material.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/generated/assets.gen.dart';

const double navigationHeaderHeight = 50;
const double backButtonSide = 24.0;
const double backButtonPadding = 10.0;

class NavigationHeader extends StatelessWidget {
  const NavigationHeader({
    required this.title,
    this.showBackButton = true,
    this.onBackPress,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appColors.secondaryBackground,
      height: navigationHeaderHeight,
      child: Row(
        children: <Widget>[
          if (showBackButton)
            IconButton(
              icon: Image.asset(
                Assets.images.backArrow.path,
                width: backButtonSide,
                height: backButtonSide,
              ),
              onPressed: () {
                if (onBackPress != null) {
                  onBackPress!();
                } else {
                  Navigator.pop(context);
                }
              },
            )
          else
            const SizedBox(width: backButtonSide + backButtonPadding * 2),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: context.theme.appTextThemes.title,
            ),
          ),
          const SizedBox(width: backButtonSide + backButtonPadding * 2),
        ],
      ),
    );
  }
}
