import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/inputs/text_input/components/text_input_clear_button.dart';
import 'package:ice/app/components/inputs/text_input/components/text_input_icons.dart';
import 'package:ice/app/components/inputs/text_input/text_input.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/wallet/model/wallet_data.dart';
import 'package:ice/app/features/wallets/providers/wallets_data_provider.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_close_button.dart';
import 'package:ice/generated/assets.gen.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class EditWalletModal extends IcePage<WalletData> {
  const EditWalletModal(super.route, super.payload, {super.key});

  @override
  Widget buildPage(
    BuildContext context,
    WidgetRef ref,
    WalletData? payload,
  ) {
    final walletName = useState(payload?.name ?? '');
    final controller = useTextEditingController(text: walletName.value);
    final isNameChanged = walletName.value != (payload?.name ?? '') &&
        walletName.value.isNotEmpty;

    if (payload == null) {
      return const SizedBox.shrink();
    }

    return SheetContentScaffold(
      backgroundColor: context.theme.appColors.secondaryBackground,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            NavigationAppBar.modal(
              title: context.i18n.wallet_edit,
              actions: const <Widget>[NavigationCloseButton()],
            ),
            ScreenSideOffset.small(
              child: Padding(
                padding: EdgeInsets.only(top: 21.0.s, bottom: 24.0.s),
                child: TextInput(
                  onChanged: (String newValue) => walletName.value = newValue,
                  controller: controller,
                  labelText: context.i18n.wallet_name,
                  suffixIcon: walletName.value.isEmpty
                      ? null
                      : TextInputIcons(
                          icons: <Widget>[
                            TextInputClearButton(
                              controller: controller,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            ScreenSideOffset.small(
              child: isNameChanged
                  ? Button(
                      onPressed: () {
                        ref
                                .read(walletsDataNotifierProvider.notifier)
                                .walletData =
                            payload.copyWith(name: walletName.value);
                        context.pop();
                      },
                      label: Text(context.i18n.button_save),
                      mainAxisSize: MainAxisSize.max,
                    )
                  : Button(
                      onPressed: () {
                        IceRoutes.deleteWallet
                            .replace(context, payload: payload);
                      },
                      leadingIcon: Assets.images.icons.iconBlockDelete
                          .icon(color: context.theme.appColors.onPrimaryAccent),
                      label: Text(context.i18n.wallet_delete),
                      mainAxisSize: MainAxisSize.max,
                      backgroundColor: context.theme.appColors.attentionRed,
                    ),
            ),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 16.0.s),
          ],
        ),
      ),
    );
  }
}