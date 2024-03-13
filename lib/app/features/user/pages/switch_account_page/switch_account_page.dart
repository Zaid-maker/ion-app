import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/features/user/pages/switch_account_page/components/accounts_list/accounts_list.dart';
import 'package:ice/app/features/user/pages/switch_account_page/components/actions_list/actions_list.dart';
import 'package:ice/app/features/user/pages/switch_account_page/components/header/header.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class SwitchAccountPage extends IceSimplePage {
  const SwitchAccountPage(super.route, super.payload);

  @override
  Widget buildPage(BuildContext context, WidgetRef ref, __) {
    return SheetContentScaffold(
      body: ScreenSideOffset.small(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Header(),
              const AccountsList(),
              const ActionsList(),
              SizedBox(height: MediaQuery.paddingOf(context).bottom),
            ],
          ),
        ),
      ),
    );
  }
}
