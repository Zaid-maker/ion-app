// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/components/button/button.dart';
import 'package:ion/app/extensions/extensions.dart';
import 'package:ion/app/router/app_routes.dart';
import 'package:ion/generated/assets.gen.dart';

class EditUserButton extends ConsumerWidget {
  const EditUserButton({
    required this.pupkey,
    super.key,
  });

  final String pupkey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Button(
      onPressed: () {
        ProfileEditRoute(pubkey: pupkey).push<void>(context);
      },
      leadingIcon: Assets.svg.iconEditLink.icon(
        color: context.theme.appColors.onPrimaryAccent,
        size: 16.0.s,
      ),
      tintColor: context.theme.appColors.primaryAccent,
      label: Text(
        context.i18n.profile_edit,
        style: context.theme.appTextThemes.caption.copyWith(
          color: context.theme.appColors.secondaryBackground,
        ),
      ),
      style: OutlinedButton.styleFrom(
        minimumSize: Size(87.0.s, 28.0.s),
        padding: EdgeInsets.symmetric(horizontal: 15.0.s),
      ),
    );
  }
}
