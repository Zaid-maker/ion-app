// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/components/screen_offset/screen_side_offset.dart';
import 'package:ion/app/extensions/asset_gen_image.dart';
import 'package:ion/app/extensions/build_context.dart';
import 'package:ion/app/extensions/num.dart';
import 'package:ion/app/extensions/theme_data.dart';
import 'package:ion/app/features/auth/providers/auth_provider.dart';
import 'package:ion/app/features/wallet/providers/wallet_user_preferences/user_preferences_selectors.dart';
import 'package:ion/app/features/wallet/providers/wallet_user_preferences/wallet_user_preferences_provider.dart';
import 'package:ion/app/features/wallet/views/pages/wallet_page/components/balance/balance_actions.dart';
import 'package:ion/app/features/wallets/providers/wallets_data_provider.dart';
import 'package:ion/app/router/app_routes.dart';
import 'package:ion/app/utils/num.dart';
import 'package:ion/generated/assets.gen.dart';

class Balance extends ConsumerWidget {
  const Balance({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: get actual balance
    final walletBalance = ref.watch(currentWalletDataProvider).valueOrNull?.balance ?? 0;

    final isBalanceVisible = ref.watch(isBalanceVisibleSelectorProvider);
    final iconAsset = isBalanceVisible ? Assets.svg.iconBlockEyeOn : Assets.svg.iconBlockEyeOff;
    final hitSlop = 5.0.s;

    return ScreenSideOffset.small(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 6.0.s - hitSlop,
              bottom: 8.0.s - hitSlop,
            ),
            child: Row(
              children: [
                Text(
                  context.i18n.wallet_balance,
                  style: context.theme.appTextThemes.subtitle2
                      .copyWith(color: context.theme.appColors.secondaryText),
                ),
                TextButton(
                  child: Padding(
                    padding: EdgeInsets.all(hitSlop),
                    child: iconAsset.icon(
                      color: context.theme.appColors.secondaryText,
                    ),
                  ),
                  onPressed: () {
                    final identityKeyName = ref.read(currentIdentityKeyNameSelectorProvider) ?? '';
                    ref
                        .read(
                          walletUserPreferencesNotifierProvider(identityKeyName: identityKeyName)
                              .notifier,
                        )
                        .switchBalanceVisibility();
                  },
                ),
              ],
            ),
          ),
          // TODO: temporary added GestureDetector to show modal until we have a decision
          // on when to show the modal page for secure account
          GestureDetector(
            onDoubleTap: () => SecureAccountModalRoute().push<void>(context),
            child: Text(
              isBalanceVisible ? formatToCurrency(walletBalance) : '********',
              style: context.theme.appTextThemes.headline1
                  .copyWith(color: context.theme.appColors.primaryText),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.0.s,
              bottom: 16.0.s,
            ),
            child: BalanceActions(
              onReceive: () => ReceiveCoinRoute().push<void>(context),
              onSend: () => CoinSendRoute().push<void>(context),
            ),
          ),
        ],
      ),
    );
  }
}
