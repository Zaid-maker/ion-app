import 'package:flutter/material.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/theme_data.dart';

class ProfileDetailsCell extends StatelessWidget {
  const ProfileDetailsCell({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: context.theme.appTextThemes.caption3.copyWith(
            color: context.theme.appColors.tertararyText,
          ),
        ),
        Text(
          value.toString(),
          style: context.theme.appTextThemes.title.copyWith(
            color: context.theme.appColors.primaryText,
          ),
        ),
      ],
    );
  }
}
