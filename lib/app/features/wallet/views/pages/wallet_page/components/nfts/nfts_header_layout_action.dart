import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/constants/ui.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/user/model/nft_layout_type.dart';
import 'package:ice/app/features/user/providers/user_preferences_provider.dart';
import 'package:ice/app/features/user/providers/user_preferences_selectors.dart';

class NftHeaderLayoutAction extends HookConsumerWidget {
  const NftHeaderLayoutAction({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nftLayoutType = nftLayoutTypeSelector(ref);
    final activeColor = context.theme.appColors.primaryText;
    final inactiveColor = context.theme.appColors.tertararyText;

    return Row(
      children: <Widget>[
        TextButton(
          onPressed: () {
            ref
                .read(userPreferencesNotifierProvider.notifier)
                .setNftLayoutType(NftLayoutType.grid);
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: UiConstants.hitSlop,
              left: UiConstants.hitSlop,
              right: 7.0.s,
              bottom: UiConstants.hitSlop,
            ),
            child: NftLayoutType.grid.iconAsset.icon(
              color: NftLayoutType.grid == nftLayoutType
                  ? activeColor
                  : inactiveColor,
              size: 20.0.s,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            ref
                .watch(userPreferencesNotifierProvider.notifier)
                .setNftLayoutType(NftLayoutType.list);
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: UiConstants.hitSlop,
              right: UiConstants.hitSlop,
              left: 7.0.s,
              bottom: UiConstants.hitSlop,
            ),
            child: NftLayoutType.list.iconAsset.icon(
              color: NftLayoutType.list == nftLayoutType
                  ? activeColor
                  : inactiveColor,
              size: 20.0.s,
            ),
          ),
        ),
      ],
    );
  }
}