import 'package:ice/app/features/wallet/model/coin_data.dart';
import 'package:ice/app/features/wallet/model/network_type.dart';
import 'package:ice/app/features/wallet/model/send_coins_data.dart';
import 'package:ice/app/features/wallet/providers/mock_data/wallet_assets_mock_data.dart';
import 'package:ice/app/features/wallets/providers/selected_wallet_id_provider.dart';
import 'package:ice/app/features/wallets/providers/wallets_data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_coins_form_provider.g.dart';

@riverpod
class SendCoinsFormController extends _$SendCoinsFormController {
  @override
  SendCoinsData build() {
    final walletId = ref.watch(selectedWalletIdNotifierProvider);
    final walletsData = ref.watch(walletsDataNotifierProvider);

    final wallet = walletsData[walletId]!;

    return SendCoinsData(
      selectedCoin: mockedCoinsDataArray[0],
      selectedNetwork: NetworkType.eth,
      wallet: wallet,
      address: '0xf59B7547F254854F3f17a594Fe97b0aB24gf3023',
      usdtAmount: 350,
      arrivalTime: 15,
    );
  }

  void selectCoin(CoinData coin) => state = state.copyWith(selectedCoin: coin);

  void selectNetwork(NetworkType network) => state = state.copyWith(selectedNetwork: network);

  void updateAddress(String address) => state = state.copyWith(address: address);

  void updateAmount(String amount) {
    final value = double.tryParse(amount) ?? 0.0;
    state = state.copyWith(usdtAmount: value);
  }

  void updateArrivalTime(int arrivalTime) => state = state.copyWith(arrivalTime: arrivalTime);
}
