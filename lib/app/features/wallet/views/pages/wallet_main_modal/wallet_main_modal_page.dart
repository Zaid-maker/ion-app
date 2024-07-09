import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';

class WalletMainModalPage extends IcePage {
  const WalletMainModalPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return SheetContent(
      body: ScreenSideOffset.small(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 250.0.s,
                child: const Center(
                  child: Text('WALLET MAIN MODAL'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
