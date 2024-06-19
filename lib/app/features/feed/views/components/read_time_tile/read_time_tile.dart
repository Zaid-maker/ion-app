import 'package:flutter/material.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';

double iconSize = 16.0.s;

class ReadTimeTile extends StatelessWidget {
  const ReadTimeTile({required this.minutesToRead, super.key});

  final int minutesToRead;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.access_time,
          size: iconSize,
          color: context.theme.appColors.sharkText,
        ),
        SizedBox(width: 3.0.s),
        Text(
          context.i18n.feed_read_time_in_mins(minutesToRead),
          style: context.theme.appTextThemes.caption
              .copyWith(color: context.theme.appColors.sharkText),
        ),
      ],
    );
  }
}