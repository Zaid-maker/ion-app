import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/features/user/providers/user_preferences_selectors.dart';
import 'package:ice/app/features/wallet/model/coin_data.dart';
import 'package:ice/app/features/wallet/providers/wallet_data_selectors.dart';

List<CoinData> useFilteredWalletCoins(WidgetRef ref) {
  final bool isZeroValueAssetsVisible = isZeroValueAssetsVisibleSelector(ref);
  final List<CoinData> walletCoins = walletCoinsSelector(ref);

  return useMemoized(
    () {
      return isZeroValueAssetsVisible
          ? walletCoins
          : walletCoins.where((CoinData coin) => coin.balance > 0.00).toList();
    },
    <Object?>[isZeroValueAssetsVisible, walletCoins],
  );
}
