import 'package:ice/app/features/wallet/model/wallet_data.dart';
import 'package:ice/app/features/wallets/providers/mock_data/mock_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallets_data_provider.g.dart';

@Riverpod(keepAlive: true)
class WalletsDataNotifier extends _$WalletsDataNotifier {
  @override
  Map<String, WalletData> build() {
    final wallets = <String, WalletData>{};
    for (final walletData in mockedWalletDataArray) {
      wallets.putIfAbsent(walletData.id, () => walletData);
    }

    return Map<String, WalletData>.unmodifiable(wallets);
  }

  set walletData(WalletData newData) {
    final newState = Map<String, WalletData>.from(state)
      ..update(
        newData.id,
        (WalletData value) => value.copyWith(
          id: newData.id,
          name: newData.name,
          icon: newData.icon,
          balance: newData.balance,
        ),
        ifAbsent: () => newData,
      );
    state = Map<String, WalletData>.unmodifiable(newState);
  }

  void deleteWallet(String walletId) {
    final newState = Map<String, WalletData>.from(state)
      ..removeWhere((String key, _) => key == walletId);
    state = Map<String, WalletData>.unmodifiable(newState);
  }
}