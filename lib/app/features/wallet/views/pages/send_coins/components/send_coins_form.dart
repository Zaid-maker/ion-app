import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/inputs/text_input/components/text_input_icons.dart';
import 'package:ice/app/components/inputs/text_input/components/text_input_text_button.dart';
import 'package:ice/app/components/inputs/text_input/text_input.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/slider/app_slider.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/wallet/views/pages/send_coins/components/address_input_field.dart';
import 'package:ice/app/features/wallet/views/pages/send_coins/components/arrival_time/arrival_time.dart';
import 'package:ice/app/features/wallet/views/pages/send_coins/components/network_fee.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_close_button.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';
import 'package:ice/generated/assets.gen.dart';

class SendCoinsForm extends IceSimplePage {
  const SendCoinsForm(super.route, super.payload);

  // TODO (@ice-alcides): replace with actual selected coin
  static const String coinTitle = 'Coin';

  @override
  Widget buildPage(BuildContext context, WidgetRef ref, __) {
    return SheetContent(
      backgroundColor: context.theme.appColors.secondaryBackground,
      body: FractionallySizedBox(
        heightFactor: 0.9,
        child: KeyboardDismissOnTap(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.s),
                  child: NavigationAppBar.screen(
                    title: context.i18n.wallet_send_coins,
                    actions: const <Widget>[
                      NavigationCloseButton(),
                    ],
                  ),
                ),
                ScreenSideOffset.small(
                  child: Column(
                    children: <Widget>[
                      TextInput(
                        labelText: coinTitle,
                        suffixIcon: TextInputIcons(
                          icons: <Widget>[
                            IconButton(
                              icon: Assets.images.icons.iconArrowDown.icon(),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0.s),
                      TextInput(
                        labelText: context.i18n.wallet_network,
                        suffixIcon: TextInputIcons(
                          icons: <Widget>[
                            IconButton(
                              icon: Assets.images.icons.iconArrowDown.icon(),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0.s),
                      AddressInputField(
                        onContactListPressed: () {},
                        onScanPressed: () {},
                      ),
                      SizedBox(height: 12.0.s),
                      TextInput(
                        labelText: context.i18n.wallet_usdt_amount,
                        initialValue: '350.00',
                        suffixIcon: TextInputTextButton(
                          onPressed: () {},
                          label: context.i18n.wallet_max,
                        ),
                      ),
                      SizedBox(height: 10.0.s),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '~ 349.99 USD',
                          style: context.theme.appTextThemes.caption2.copyWith(
                            color: context.theme.appColors.tertararyText,
                          ),
                        ),
                      ),
                      SizedBox(height: 17.0.s),
                      const ArrivalTime(),
                      SizedBox(height: 12.0.s),
                      AppSlider(
                        onChanged: (double value) {},
                      ),
                      SizedBox(height: 8.0.s),
                      const NetworkFee(),
                      SizedBox(height: 45.0.s),
                      Button(
                        label: Text(
                          context.i18n.button_continue,
                        ),
                        mainAxisSize: MainAxisSize.max,
                        trailingIcon: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            context.theme.appColors.primaryBackground,
                            BlendMode.srcIn,
                          ),
                          child: Assets.images.icons.iconButtonNext.icon(),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.0.s),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
