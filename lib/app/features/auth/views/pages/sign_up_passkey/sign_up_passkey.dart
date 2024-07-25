import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/screen_offset/screen_bottom_offset.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/auth/views/components/auth_scrolled_body/auth_scrolled_body.dart';
import 'package:ice/app/features/auth/views/components/sign_up_list_item/sign_up_list_item.dart';
import 'package:ice/app/features/auth/views/pages/sign_up_passkey/sign_up_passkey_form.dart';
import 'package:ice/app/hooks/use_hide_keyboard_and_call_once.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';
import 'package:ice/generated/assets.gen.dart';

class SignUpPasskeyPage extends HookWidget {
  const SignUpPasskeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hideKeyboardAndCallOnce = useHideKeyboardAndCallOnce();
    return SheetContent(
      body: KeyboardDismissOnTap(
        child: AuthScrollContainer(
          title: context.i18n.sign_up_passkey_title,
          icon: Assets.images.icons.iconLoginPasskey.icon(size: 36.0.s),
          children: [
            ScreenSideOffset.large(
              child: Column(
                children: [
                  SizedBox(height: 14.0.s),
                  SignUpListItem(
                    title: context.i18n.sign_up_passkey_advantage_1_title,
                    subtitle: context.i18n.sign_up_passkey_advantage_1_description,
                    icon: Assets.images.icons.iconLoginFingerprint.icon(),
                  ),
                  SignUpListItem(
                    title: context.i18n.sign_up_passkey_advantage_2_title,
                    subtitle: context.i18n.sign_up_passkey_advantage_2_description,
                    icon: Assets.images.icons.iconLoginDevice.icon(),
                  ),
                  SignUpListItem(
                    title: context.i18n.sign_up_passkey_advantage_3_title,
                    subtitle: context.i18n.sign_up_passkey_advantage_3_description,
                    icon: Assets.images.icons.iconLoginSafeacc.icon(),
                  ),
                  SizedBox(height: 18.0.s),
                  const SignUpPasskeyForm(),
                  SizedBox(height: 12.0.s),
                  Button(
                    type: ButtonType.outlined,
                    onPressed: () {
                      hideKeyboardAndCallOnce(
                        callback: () => SignUpPasswordRoute().push<void>(context),
                      );
                    },
                    label: Text(context.i18n.sign_up_passkey_use_password),
                    mainAxisSize: MainAxisSize.max,
                    borderColor: Colors.transparent,
                    tintColor: context.theme.appColors.primaryAccent,
                  ),
                  ScreenBottomOffset(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}