import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/screen_side_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/auth/views/components/terms_privacy/terms_privacy.dart';
import 'package:ice/generated/assets.gen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CheckEmail extends IceSimplePage {
  const CheckEmail(super._route, super.payload);

  @override
  Widget buildPage(BuildContext context, WidgetRef ref, __) {
    final StreamController<ErrorAnimationType> errorController =
        StreamController<ErrorAnimationType>();
    const String email = 'hello@ice.io';
    final TextEditingController textEditingController =
        TextEditingController(text: '1234');

    return Scaffold(
      body: ScreenSideOffset.large(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 65.0.s,
                ),
                Image.asset(
                  Assets.images.logo.logoIce.path,
                ),
                SizedBox(
                  height: 12.0.s,
                ),
                Text(
                  context.i18n.check_email_title,
                  style: context.theme.appTextThemes.headline1,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(context.i18n.check_email_subtitle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      email,
                      style: context.theme.appTextThemes.subtitle,
                    ),
                    Image.asset(Assets.images.icons.iconEditLink.path),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 36.0.s,
                    horizontal: 20.0.s,
                  ),
                  child: Text(
                    context.i18n.check_email_description,
                    textAlign: TextAlign.center,
                    style: context.theme.appTextThemes.subtitle2.copyWith(
                      color: context.theme.appColors.secondaryText,
                    ),
                  ),
                ),
                SizedBox(
                  width: 248.0.s,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    animationType: AnimationType.fade,
                    enabled: false,
                    cursorColor: Colors.black,
                    cursorWidth: 3.0.s,
                    cursorHeight: 25.0.s,
                    textStyle: context.theme.appTextThemes.inputFieldText,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(16.0.s),
                      fieldHeight: 56.0.s,
                      fieldWidth: 50.0.s,
                      borderWidth: 1,
                      inactiveColor: context.theme.appColors.strokeElements,
                      disabledColor: context.theme.appColors.strokeElements,
                      activeColor: context.theme.appColors.primaryAccent,
                      errorBorderColor: context.theme.appColors.attentionRed,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      errorBorderWidth: 1,
                      activeBorderWidth: 1,
                      inactiveBorderWidth: 1,
                      disabledBorderWidth: 1,
                      selectedBorderWidth: 1,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    keyboardType: TextInputType.number,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (String completed) {},
                    onChanged: (String text) {},
                    beforeTextPaste: (String? text) {
                      //if return true => the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      return true;
                    },
                  ),
                ),
              ],
            ),
            Image.asset(
              Assets.images.logo.logoIce.path,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 48.0.s),
              child: const TermsPrivacy(),
            ),
          ],
        ),
      ),
    );
  }
}
