import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/extensions.dart';
import 'package:ice/app/features/feed/model/post_data.dart';
import 'package:ice/app/features/wallet/model/network_type.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_close_button.dart';
import 'package:ice/generated/assets.gen.dart';

class ShareTypeView extends IcePage<PostData> {
  const ShareTypeView(super.route, super.payload, {super.key});

  static const List<NetworkType> networkTypeValues = NetworkType.values;

  @override
  Widget buildPage(BuildContext context, WidgetRef ref, PostData? payload) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.s),
          child: NavigationAppBar.screen(
            showBackButton: false,
            title: context.i18n.feed_repost_type,
            actions: const [
              NavigationCloseButton(),
            ],
          ),
        ),
        ScreenSideOffset.small(
          child: Row(
            children: [
              Expanded(
                child: Button.compact(
                  type: ButtonType.secondary,
                  backgroundColor: context.theme.appColors.tertararyBackground,
                  onPressed: () {},
                  leadingIcon: Assets.images.icons.iconFeedRepost.icon(),
                  label: Text(
                    context.i18n.feed_repost,
                    style: context.theme.appTextThemes.subtitle2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.0.s,
        ),
        ScreenSideOffset.small(
          child: Row(
            children: [
              Expanded(
                child: Button.compact(
                  type: ButtonType.secondary,
                  backgroundColor: context.theme.appColors.tertararyBackground,
                  onPressed: () {
                    IceRoutes.quotePost.push(context, payload: payload);
                  },
                  leadingIcon: Assets.images.icons.iconFeedQuote.icon(),
                  label: Text(
                    context.i18n.feed_quote_post,
                    style: context.theme.appTextThemes.subtitle2,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.0.s,
        ),
      ],
    );
  }
}