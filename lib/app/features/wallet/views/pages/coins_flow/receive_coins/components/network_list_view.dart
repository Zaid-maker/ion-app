import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/extensions.dart';
import 'package:ice/app/features/wallet/model/coin_data.dart';
import 'package:ice/app/features/wallet/model/network_type.dart';
import 'package:ice/app/features/wallet/views/pages/coins_flow/components/network_item.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_close_button.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';

class NetworkListReceiveView extends IcePage {
  const NetworkListReceiveView({required this.payload, super.key});

  final CoinData payload;

  static const List<NetworkType> networkTypeValues = NetworkType.values;

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return SheetContent(
      backgroundColor: context.theme.appColors.secondaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.s),
            child: NavigationAppBar.screen(
              title: context.i18n.wallet_choose_network,
              actions: const <Widget>[
                NavigationCloseButton(),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: networkTypeValues.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 12.0.s,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ScreenSideOffset.small(
                child: NetworkItem(
                  networkType: networkTypeValues[index],
                  onTap: () {
                    ShareAddressRoute(
                      $extra: <String, dynamic>{
                        'coinData': payload,
                        'networkType': networkTypeValues[index],
                      },
                    ).push<void>(context);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
