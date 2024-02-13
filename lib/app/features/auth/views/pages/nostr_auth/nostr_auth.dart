import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/modal_wrapper/modal_wrapper.dart';
import 'package:ice/app/components/screen_side_offset/screen_side_offset.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/features/auth/views/components/auth_header/auth_header.dart';
import 'package:ice/app/features/auth/views/pages/nostr_login/nostr_login.dart';
import 'package:ice/generated/assets.gen.dart';

class NostrAuth extends HookConsumerWidget {
  const NostrAuth({super.key});

  void showModalScreen(
    Widget screen,
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) => ModalWrapper(
        child: screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ScreenSideOffset.large(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AuthHeaderWidget(
              title: context.i18n.nostr_auth_title,
              description: context.i18n.nostr_auth_description,
            ),
            Image.asset(
              Assets.images.ostrichlogo.path,
              width: 256.0.s,
              height: 160.0.s,
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Button(
                    leadingIcon: ImageIcon(
                      AssetImage(Assets.images.loginCreateacc.path),
                      size: 24.0.s,
                    ),
                    onPressed: () {
                      // showModalScreen(
                      //   const NostrCreateAccount(),
                      //   context,
                      // );
                    },
                    type: ButtonType.outlined,
                    label: Text(context.i18n.button_create_account),
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
                SizedBox(
                  height: 26.0.s,
                ),
                Center(
                  child: Button(
                    leadingIcon: ImageIcon(
                      AssetImage(Assets.images.profileSave.path),
                      size: 24.0.s,
                    ),
                    onPressed: () {
                      showModalScreen(
                        const NostrLogin(),
                        context,
                      );
                    },
                    label: Text(context.i18n.button_login),
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
                SizedBox(
                  height: 91.0.s,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
