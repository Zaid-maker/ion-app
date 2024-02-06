import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/constants/ui.dart';
import 'package:ice/app/features/auth/views/pages/nostr_login/nostr_login.dart';
import 'package:ice/app/shared/widgets/auth_header/auth_header.dart';
import 'package:ice/app/shared/widgets/button/button.dart';
import 'package:ice/app/shared/widgets/modal_wrapper.dart';
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AuthHeaderWidget(
              title: 'Nostr',
              description: 'Create an account or login using your existing one',
            ),
            Image.asset(
              Assets.images.ostrichlogo.path,
              width: 256,
              height: 160,
            ),
            Column(
              children: <Widget>[
                Center(
                  child: Button(
                    leadingIcon: ImageIcon(
                      AssetImage(Assets.images.loginCreateacc.path),
                      size: 24,
                    ),
                    onPressed: () {
                      // showModalScreen(
                      //   const NostrCreateAccount(),
                      //   context,
                      // );
                    },
                    type: ButtonType.outlined,
                    label: const Text('Create account'),
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                Center(
                  child: Button(
                    leadingIcon: ImageIcon(
                      AssetImage(Assets.images.profileSave.path),
                      size: 24,
                    ),
                    onPressed: () {
                      showModalScreen(
                        const NostrLogin(),
                        context,
                      );
                    },
                    label: const Text('Login'),
                    mainAxisSize: MainAxisSize.max,
                  ),
                ),
                const SizedBox(
                  height: 91,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
