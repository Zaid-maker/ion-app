import 'package:flutter/material.dart';
import 'package:ice/app/components/card/warning_card.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/extensions/extensions.dart';
import 'package:ice/app/features/auth/views/pages/protect_account/authenticator/components/copy_key_card.dart';

class AuthenticatorInstructionsPage extends StatelessWidget {
  const AuthenticatorInstructionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.i18n;

    return ScreenSideOffset.large(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          CopyKeyCard(),
          Spacer(),
          WarningCard(text: locale.warning_authenticator_setup),
        ],
      ),
    );
  }
}
