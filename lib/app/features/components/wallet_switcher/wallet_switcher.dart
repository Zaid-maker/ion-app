import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/avatar/avatar.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/constants/ui_size.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/wallets/providers/selectors/wallets_data_selectors.dart';
import 'package:ice/app/router/app_routes.dart';

class WalletSwitcher extends HookConsumerWidget {
  const WalletSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletId = walletIdSelector(ref);
    final walletName = walletNameSelector(ref: ref, walletId: walletId);
    final walletIcon = walletIconSelector(ref: ref, walletId: walletId);

    return Button.dropdown(
      onPressed: () {
        IceRoutes.wallets.push(context);
      },
      leadingIcon: Avatar(
        size: 28.0.s,
        imageUrl: walletIcon,
        borderRadius: BorderRadius.circular(UiSize.xSmall),
      ),
      leadingButtonOffset: 11.0.s,
      trailingIconOffset: 0.0.s,
      backgroundColor: context.theme.appColors.tertararyBackground,
      label: Text(
        walletName,
        style: context.theme.appTextThemes.subtitle2.copyWith(
          color: context.theme.appColors.primaryText,
        ),
      ),
    );
  }
}
