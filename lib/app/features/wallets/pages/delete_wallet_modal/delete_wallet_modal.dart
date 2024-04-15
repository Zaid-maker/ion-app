import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/wallet/model/wallet_data.dart';
import 'package:ice/app/features/wallets/providers/wallets_data_provider.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';
import 'package:ice/generated/assets.gen.dart';

class DeleteWalletModal extends IcePage<WalletData> {
  const DeleteWalletModal(super.route, super.payload);

  static double get buttonsSize => 56.0.s;

  @override
  Widget buildPage(
    BuildContext context,
    WidgetRef ref,
    WalletData? walletData,
  ) {
    if (walletData == null) {
      return const SizedBox.shrink();
    }

    final Size buttonMinimalSize = Size(buttonsSize, buttonsSize);

    return SheetContent(
      backgroundColor: context.theme.appColors.secondaryBackground,
      body: ScreenSideOffset.small(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 31.0.s, bottom: 4.0.s),
              child: Assets.images.misc.actionDeletewallet.icon(size: 80.0.s),
            ),
            Text(
              context.i18n.wallet_delete_q,
              style: context.theme.appTextThemes.title.copyWith(
                color: context.theme.appColors.primaryText,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 8.0.s,
                bottom: 30.0.s,
                left: 36.0.s,
                right: 36.0.s,
              ),
              child: Text(
                context.i18n.wallet_delete_message,
                style: context.theme.appTextThemes.body2.copyWith(
                  color: context.theme.appColors.secondaryText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Button.compact(
                    type: ButtonType.outlined,
                    label: Text(
                      context.i18n.button_cancel,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    minimumSize: buttonMinimalSize,
                  ),
                ),
                SizedBox(
                  width: 15.0.s,
                ),
                Expanded(
                  child: Button.compact(
                    label: Text(
                      context.i18n.button_delete,
                    ),
                    onPressed: () {
                      ref
                          .read(walletsDataNotifierProvider.notifier)
                          .deleteWallet(walletData.id);
                      context.pop();
                    },
                    minimumSize: buttonMinimalSize,
                    backgroundColor: context.theme.appColors.attentionRed,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 20.0.s),
          ],
        ),
      ),
    );
  }
}
