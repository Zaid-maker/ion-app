import 'package:flutter/material.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/shared/widgets/favourite_icon/favorite_icon.dart';
import 'package:ice/app/values/constants.dart';
import 'package:ice/generated/assets.gen.dart';

const double containerHeight = 60.0;

class Favourites extends StatelessWidget {
  const Favourites({
    super.key,
    this.onPress,
  });

  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultSidePadding,
        vertical: 24,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: containerHeight,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: kDefaultSidePadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
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
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 36,
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
                          style: context.theme.appTextThemes.caption3.copyWith(
                            color: context.theme.appColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                Assets.images.forwardArrow.path,
                width: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
