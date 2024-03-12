import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ice/app/components/avatar/avatar.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/generated/assets.gen.dart';

class ContactsListItem extends StatelessWidget {
  const ContactsListItem({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.hasIceAccount,
  });

  final String imageUrl;
  final String label;
  final bool hasIceAccount;

  static double get width => 70.0.s;

  static double get imageWidth => 54.0.s;

  static double get height => 76.0.s;

  static double get iceLogoSize => 20.0.s;

  static double get iceLogoBorderRadius => 8.0.s;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Avatar(
                  size: imageWidth,
                  imageUrl: imageUrl,
                  borderRadius: BorderRadius.circular(14.0.s),
                ),
                if (hasIceAccount == true)
                  Positioned(
                    right: -4.0.s,
                    bottom: -4.0.s,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(iceLogoBorderRadius),
                        border: Border.all(
                          color: context.theme.appColors.secondaryBackground,
                          width: 2.0.s,
                        ),
                      ),
                      position: DecorationPosition.foreground,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(iceLogoBorderRadius),
                        child: Assets.images.icons.iconBadgeIcelogo.image(
                          width: iceLogoSize,
                          height: iceLogoSize,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Text(
              label,
              style: context.theme.appTextThemes.caption.copyWith(
                color: context.theme.appColors.secondaryText,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}