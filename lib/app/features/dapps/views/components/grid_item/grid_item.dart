import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ice/app/constants/ui_size.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/dapps/views/components/favourite_icon/favorite_icon.dart';
import 'package:ice/app/features/dapps/views/pages/mocks/mocked_apps.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/utils/num.dart';
import 'package:ice/generated/assets.gen.dart';

class GridItem extends HookWidget {
  const GridItem({
    required this.item,
    super.key,
    this.showIsFavourite = false,
  });
  final DAppItem item;
  final bool showIsFavourite;

  @override
  Widget build(BuildContext context) {
    final isFavourite = useState(item.isFavourite);
    return InkWell(
      onTap: () => IceRoutes.dappsDetails.go(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 48.0.s,
            height: 48.0.s,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(UiSize.small),
            ),
            child: Image.asset(
              item.iconImage,
              width: 48.0.s,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: UiSize.xSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      item.title,
                      style: context.theme.appTextThemes.body.copyWith(
                        color: context.theme.appColors.primaryText,
                      ),
                    ),
                    if (item.isVerified != null && item.isVerified!)
                      Padding(
                        padding: EdgeInsets.only(left: UiSize.xxxSmall),
                        child: IconTheme(
                          data: IconThemeData(
                            size: UiSize.medium,
                            color:
                                context.theme.appColors.onTertararyBackground,
                          ),
                          child: Assets.images.icons.iconBadgeVerify.image(
                            width: UiSize.medium,
                            height: UiSize.medium,
                          ),
                        ),
                      ),
                  ],
                ),
                Text(
                  item.description ?? '',
                  style: context.theme.appTextThemes.caption3.copyWith(
                    color: context.theme.appColors.secondaryText,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconTheme(
                      data: IconThemeData(
                        size: UiSize.small,
                        color: context.theme.appColors.onTertararyBackground,
                      ),
                      child: Assets.images.icons.iconButtonIceStroke
                          .icon(size: UiSize.small),
                    ),
                    if (item.value != null)
                      Padding(
                        padding: EdgeInsets.only(left: 3.0.s),
                        child: Text(
                          formatDouble(item.value!),
                          style: context.theme.appTextThemes.caption3.copyWith(
                            color: context.theme.appColors.tertararyText,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (showIsFavourite)
            FavouriteIcon(
              isFavourite: isFavourite.value,
              onTap: () {
                isFavourite.value = !isFavourite.value;
              },
            ),
        ],
      ),
    );
  }
}
