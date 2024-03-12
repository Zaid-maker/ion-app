import 'package:flutter/material.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/generated/assets.gen.dart';

class PostMenu extends StatelessWidget {
  const PostMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.0.s,
      height: 48.0.s,
      transform: Matrix4.translationValues(12.0.s, 0, 0),
      child: IconButton(
        onPressed: () {},
        icon: Assets.images.icons.iconMorePopup.icon(
          color: context.theme.appColors.onTertararyBackground,
        ),
      ),
    );
  }
}