part of 'app_routes.dart';

class WalletRoutes {
  static const routes = <TypedRoute<RouteData>>[
    TypedShellRoute<ModalShellRouteData>(
      routes: [TypedGoRoute<AllowAccessRoute>(path: 'allow-access')],
    ),
    TypedShellRoute<ModalShellRouteData>(
      routes: [TypedGoRoute<NftsSortingRoute>(path: 'nfts-sorting')],
    ),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<ContactRoute>(path: 'one-contact'),
        ...coinSendRoutes,
        ...coinReceiveRoutes,
      ],
    ),
    ...walletManagementRoutes,
    ...nftSendRoutes,
    TypedShellRoute<ModalShellRouteData>(
      routes: [TypedGoRoute<ScanWalletRoute>(path: 'scan-wallet')],
    ),
    TypedGoRoute<CoinsDetailsRoute>(path: 'coin-details'),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<CoinReceiveRoute>(path: 'coin-receive'),
      ],
    ),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<ManageCoinsRoute>(path: 'manage-coins'),
      ],
    ),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<ShareOptionsRoute>(path: 'share-options'),
      ],
    ),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<ShareTypeRoute>(
          path: 'share-type',
          routes: [
            TypedGoRoute<QuotePostModalRoute>(path: 'quote-post'),
          ],
        ),
      ],
    ),
  ];

  static const nftSendRoutes = <TypedRoute<RouteData>>[
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<NftDetailsRoute>(path: 'nft-details'),
        TypedGoRoute<NftsSortingRoute>(path: 'nfts-sorting'),
        TypedGoRoute<NftSendFormRoute>(path: 'nft-send'),
        TypedGoRoute<SendNftConfirmRoute>(path: 'nft-confirm'),
        TypedGoRoute<NftTransactionResultRoute>(path: 'nft-transaction-result'),
        TypedGoRoute<NftTransactionDetailsRoute>(path: 'nft-transaction-details'),
      ],
    ),
  ];

  static const coinSendRoutes = <TypedRoute<RouteData>>[
    TypedGoRoute<CoinSendRoute>(
      path: 'coin-send',
      routes: [
        TypedGoRoute<NetworkSelectSendRoute>(path: 'network-select'),
        TypedGoRoute<CoinsSendFormRoute>(
          path: 'coin-send-form',
          routes: [
            TypedGoRoute<ContactsListRoute>(path: 'contacts-list'),
          ],
        ),
        TypedGoRoute<CoinsSendFormConfirmationRoute>(
          path: 'coin-send-form-confirmation',
        ),
      ],
    ),
    TypedGoRoute<CoinTransactionResultRoute>(path: 'coin-transaction-result'),
    TypedGoRoute<CoinTransactionDetailsRoute>(path: 'coin-transaction-details'),
  ];

  static const coinReceiveRoutes = <TypedRoute<RouteData>>[
    TypedGoRoute<ReceiveCoinRoute>(
      path: 'receive-coin',
      routes: [
        TypedGoRoute<NetworkSelectReceiveRoute>(path: 'network-select-receive'),
      ],
    ),
    TypedGoRoute<ShareAddressRoute>(path: 'share-address'),
  ];

  static const walletManagementRoutes = <TypedRoute<RouteData>>[
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<WalletsRoute>(path: 'wallets'),
        TypedGoRoute<ManageWalletsRoute>(path: 'manage-wallets'),
        TypedGoRoute<CreateWalletRoute>(path: 'create-wallet'),
        TypedGoRoute<EditWalletRoute>(path: 'edit-wallet'),
        TypedGoRoute<DeleteWalletRoute>(path: 'delete-wallet'),
      ],
    ),
  ];
}

class AllowAccessRoute extends BaseRouteData {
  AllowAccessRoute()
      : super(
          child: const RequestContactAccessModal(),
          type: IceRouteType.bottomSheet,
        );
}

class NftsSortingRoute extends BaseRouteData {
  NftsSortingRoute()
      : super(
          child: const NftsSortingModal(),
          type: IceRouteType.bottomSheet,
        );
}

class CoinSendRoute extends BaseRouteData {
  CoinSendRoute()
      : super(
          child: const SendCoinModalPage(),
          type: IceRouteType.bottomSheet,
        );
}

class ReceiveCoinRoute extends BaseRouteData {
  ReceiveCoinRoute()
      : super(
          child: const ReceiveCoinModalPage(),
          type: IceRouteType.bottomSheet,
        );
}

class ScanWalletRoute extends BaseRouteData {
  ScanWalletRoute()
      : super(
          child: const WalletScanModalPage(),
          type: IceRouteType.bottomSheet,
        );
}

class NetworkSelectReceiveRoute extends BaseRouteData {
  NetworkSelectReceiveRoute({this.$extra})
      : super(
          child: NetworkListView(type: $extra),
          type: IceRouteType.bottomSheet,
        );

  final NetworkListViewType? $extra;
}

class NetworkSelectSendRoute extends BaseRouteData {
  NetworkSelectSendRoute({this.$extra})
      : super(
          child: NetworkListView(type: $extra),
          type: IceRouteType.bottomSheet,
        );

  final NetworkListViewType? $extra;
}

class ShareAddressRoute extends BaseRouteData {
  ShareAddressRoute()
      : super(
          child: const ShareAddressView(),
          type: IceRouteType.bottomSheet,
        );
}

class NftSendFormRoute extends BaseRouteData {
  NftSendFormRoute()
      : super(
          child: SendNftForm(),
          type: IceRouteType.bottomSheet,
        );
}

class CoinsSendFormRoute extends BaseRouteData {
  CoinsSendFormRoute()
      : super(
          child: const SendCoinsForm(),
          type: IceRouteType.bottomSheet,
        );
}

class ContactsListRoute extends BaseRouteData {
  ContactsListRoute({required this.title, this.action = ContactRouteAction.pop})
      : super(
          child: ContactsListView(
            appBarTitle: title,
            action: action,
          ),
          type: IceRouteType.bottomSheet,
        );

  final String title;
  final ContactRouteAction action;
}

class CoinsSendFormConfirmationRoute extends BaseRouteData {
  CoinsSendFormConfirmationRoute()
      : super(
          child: const ConfirmationSheet(),
          type: IceRouteType.bottomSheet,
        );
}

class CoinTransactionResultRoute extends BaseRouteData {
  CoinTransactionResultRoute({required this.$extra})
      : super(
          child: TransactionResultSheet(type: $extra),
          type: IceRouteType.bottomSheet,
        );

  final CryptoAssetType $extra;
}

class NftTransactionResultRoute extends BaseRouteData {
  NftTransactionResultRoute({required this.$extra})
      : super(
          child: TransactionResultSheet(type: $extra),
          type: IceRouteType.bottomSheet,
        );

  final CryptoAssetType $extra;
}

class CoinsDetailsRoute extends BaseRouteData {
  CoinsDetailsRoute({required this.$extra}) : super(child: CoinDetailsPage(payload: $extra));

  final CoinData $extra;
}

class CoinReceiveRoute extends BaseRouteData {
  CoinReceiveRoute({required this.$extra})
      : super(
          child: CoinReceiveModal(payload: $extra),
          type: IceRouteType.bottomSheet,
        );

  final CoinReceiveModalData $extra;
}

class ManageCoinsRoute extends BaseRouteData {
  ManageCoinsRoute()
      : super(
          child: const ManageCoinsPage(),
          type: IceRouteType.bottomSheet,
        );
}

class WalletsRoute extends BaseRouteData {
  WalletsRoute()
      : super(
          child: const WalletsModal(),
          type: IceRouteType.bottomSheet,
        );
}

class ManageWalletsRoute extends BaseRouteData {
  ManageWalletsRoute()
      : super(
          child: const ManageWalletsModal(),
          type: IceRouteType.bottomSheet,
        );
}

class CreateWalletRoute extends BaseRouteData {
  CreateWalletRoute()
      : super(
          child: const CreateNewWalletModal(),
          type: IceRouteType.bottomSheet,
        );
}

class EditWalletRoute extends BaseRouteData {
  EditWalletRoute({required this.$extra})
      : super(
          child: EditWalletModal(payload: $extra),
          type: IceRouteType.bottomSheet,
        );

  final WalletData $extra;
}

class DeleteWalletRoute extends BaseRouteData {
  DeleteWalletRoute({required this.$extra})
      : super(
          child: DeleteWalletModal(payload: $extra),
          type: IceRouteType.bottomSheet,
        );

  final WalletData $extra;
}

class QuotePostModalRoute extends BaseRouteData {
  QuotePostModalRoute({required this.$extra})
      : super(
          child: QuotePostModalPage(payload: $extra),
          type: IceRouteType.bottomSheet,
        );

  final PostData $extra;
}

class ShareOptionsRoute extends BaseRouteData {
  ShareOptionsRoute()
      : super(
          child: const ShareOptionsPage(),
          type: IceRouteType.bottomSheet,
        );
}

class ShareTypeRoute extends BaseRouteData {
  ShareTypeRoute({required this.$extra})
      : super(
          child: ShareTypePage(payload: $extra),
          type: IceRouteType.bottomSheet,
        );

  final PostData $extra;
}

class ContactRoute extends BaseRouteData {
  ContactRoute({required this.$extra})
      : super(
          child: ContactPage(contactData: $extra),
          type: IceRouteType.bottomSheet,
        );

  final ContactData $extra;
}

class NftDetailsRoute extends BaseRouteData {
  NftDetailsRoute({required this.$extra})
      : super(
          child: NftDetailsPage(nft: $extra),
          type: IceRouteType.bottomSheet,
        );

  final NftData $extra;
}

class SendNftConfirmRoute extends BaseRouteData {
  SendNftConfirmRoute()
      : super(
          child: SendNftConfirmPage(),
          type: IceRouteType.bottomSheet,
        );
}

class NftTransactionDetailsRoute extends BaseRouteData {
  NftTransactionDetailsRoute({required this.$extra})
      : super(
          child: TransactionDetailsPage(type: $extra),
          type: IceRouteType.bottomSheet,
        );

  final CryptoAssetType $extra;
}

class CoinTransactionDetailsRoute extends BaseRouteData {
  CoinTransactionDetailsRoute({required this.$extra})
      : super(
          child: TransactionDetailsPage(type: $extra),
          type: IceRouteType.bottomSheet,
        );
  final CryptoAssetType $extra;
}
