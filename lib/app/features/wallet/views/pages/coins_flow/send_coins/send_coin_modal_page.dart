import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/features/wallet/model/coin_data.dart';
import 'package:ice/app/features/wallet/views/pages/coins_flow/coin_receive_modal/components/coins_list_view.dart';
import 'package:ice/app/features/wallet/views/pages/coins_flow/network_list/network_list_view.dart';
import 'package:ice/app/features/wallet/views/pages/coins_flow/send_coins/providers/send_coins_form_provider.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';

class SendCoinModalPage extends ConsumerWidget {
  const SendCoinModalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(sendCoinsFormControllerProvider);
    return SheetContent(
      body: CoinsListView(
        onCoinItemTap: (CoinData coin) {
          ref.read(sendCoinsFormControllerProvider.notifier).selectCoin(coin);
          NetworkSelectSendRoute($extra: NetworkListViewType.send).push<void>(context);
        },
      ),
    );
  }
}
