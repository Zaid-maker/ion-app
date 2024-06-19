import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/wallets/pages/wallets_modal/components/wallets_list/wallets_list.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_close_button.dart';
import 'package:ice/generated/assets.gen.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class WalletsModal extends IceSimplePage {
  const WalletsModal(super.route, super.payload, {super.key});

  @override
  Widget buildPage(
    BuildContext context,
    WidgetRef ref,
    void payload,
  ) {
    return SheetContentScaffold(
      backgroundColor: context.theme.appColors.secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NavigationAppBar.modal(
              showBackButton: false,
              title: context.i18n.wallet_wallets,
              actions: const <Widget>[NavigationCloseButton()],
            ),
            ScreenSideOffset.small(child: const WalletsList()),
            Padding(
              padding: EdgeInsets.only(
                bottom: 16.0.s,
                top: 8.0.s,
                left: ScreenSideOffset.defaultSmallMargin,
                right: ScreenSideOffset.defaultSmallMargin,
              ),
              child: Button(
                leadingIcon: Assets.images.icons.iconButtonManageWallet.icon(),
                onPressed: () {
                  IceRoutes.manageWallets.push(context);
                },
                label: Text(context.i18n.wallet_manage_wallets),
                mainAxisSize: MainAxisSize.max,
                type: ButtonType.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}