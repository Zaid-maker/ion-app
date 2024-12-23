// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:ion/app/extensions/build_context.dart';
import 'package:ion/app/extensions/num.dart';
import 'package:ion/app/extensions/theme_data.dart';

class FeedItemActionButton extends StatelessWidget {
  const FeedItemActionButton({
    required this.icon,
    this.activeIcon,
    super.key,
    this.value,
    this.isActive = false,
    this.activeColor,
  });

  final Widget icon;
  final Widget? activeIcon;
  final String? value;
  final bool isActive;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final effectiveIcon = isActive ? activeIcon : icon;
    final effectiveColor = isActive ? activeColor : context.theme.appColors.onTertararyBackground;

    return Row(
      children: [
        IconTheme(
          data: IconThemeData(
            size: 16.0.s,
            color: effectiveColor,
          ),
          child: effectiveIcon ?? icon,
        ),
        if (value != null)
          Padding(
            padding: EdgeInsets.only(left: 4.0.s),
            child: Text(
              value!,
              style: context.theme.appTextThemes.caption2.copyWith(
                color: effectiveColor,
              ),
            ),
          ),
      ],
    );
  }
}
