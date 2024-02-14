import 'package:flutter/material.dart';
import 'package:ice/app/components/screen_side_offset/screen_side_offset.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/dapps/views/components/favourite_icon/favorite_icon.dart';
import 'package:ice/generated/assets.gen.dart';

double containerHeight = 60.0.s;

class Favourites extends StatelessWidget {
  const Favourites({
    super.key,
    this.onPress,
  });

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ScreenSideOffset.small(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.0.s,
        ),
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            height: containerHeight,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSideOffset.defaultSmallMargin,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0.s),
              color: context.theme.appColors.tertararyBackground,
              border: Border.all(
                color: context.theme.appColors.onTerararyFill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const FavouriteIcon(),
                    SizedBox(width: 8.0.s),
                    SizedBox(
                      height: 36.0.s,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            context.i18n.dapps_section_title_favourites,
                            style: context.theme.appTextThemes.body.copyWith(
                              color: context.theme.appColors.primaryText,
                            ),
                          ),
                          Text(
                            context.i18n.dapps_favourites_added(17),
                            style:
                                context.theme.appTextThemes.caption3.copyWith(
                              color: context.theme.appColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  Assets.images.icons.iconArrowRight.path,
                  width: 12.0.s,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
