import 'package:flutter/material.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/extensions/extensions.dart';
import 'package:ice/generated/assets.gen.dart';

class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0.s,
      padding: EdgeInsets.symmetric(horizontal: 16.0.s),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.theme.appColors.strokeElements.withOpacity(0.5),
            offset: Offset(0.0.s, -1.0.s),
            blurRadius: 5.0.s,
          ),
        ],
        color: context.theme.appColors.secondaryBackground,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Assets.images.icons.iconGalleryOpen.icon(),
          ),
          SizedBox(width: 16.0.s),
          GestureDetector(
            onTap: () {},
            child: Assets.images.icons.iconCameraOpen.icon(),
          ),
          SizedBox(width: 16.0.s),
          GestureDetector(
            onTap: () {},
            child: Assets.images.icons.iconFeedAddfile.icon(),
          ),
          const Spacer(),
          Button(
            minimumSize: Size(48.0.s, 28.0.s),
            borderRadius: BorderRadius.circular(100.0.s),
            onPressed: () {},
            leadingIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.s),
              child: Assets.images.icons.iconFeedSendbutton.icon(size: 20.0.s),
            ),
          ),
        ],
      ),
    );
  }
}
