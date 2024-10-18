// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/features/wallet/model/coin_data.dart';
import 'package:ion/app/features/wallet/views/pages/coins_flow/coin_receive_modal/components/coins_list_view.dart';
import 'package:ion/app/features/wallet/views/pages/coins_flow/providers/send_asset_form_provider.dart';
import 'package:ion/app/router/app_routes.dart';
import 'package:ion/app/router/components/sheet_content/sheet_content.dart';

class SendCoinModalPage extends ConsumerWidget {
  const SendCoinModalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sendAssetFormControllerProvider());
    return SheetContent(
      body: CoinsListView(
        onCoinItemTap: (CoinData coin) {
          ref.read(sendAssetFormControllerProvider().notifier).setCoin(coin);
          NetworkSelectSendRoute().push<void>(context);
        },
      ),
    );
  }
}
