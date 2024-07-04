import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/template/ice_page.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/auth/providers/auth_provider.dart';
import 'package:ice/app/features/auth/views/components/auth_header/auth_header.dart';
import 'package:ice/app/features/auth/views/pages/turn_on_notifications/descriptions.dart';
import 'package:ice/app/features/auth/views/pages/turn_on_notifications/notifications.dart';
import 'package:ice/app/features/core/providers/permissions_provider.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';

class TurnOnNotifications extends IceSimplePage {
  const TurnOnNotifications(super.route, super.payload, {super.key});

  void handleSignIn(WidgetRef ref) {
    ref.read(authProvider.notifier).signIn(
          email: 'foo@bar.baz',
          password: '123',
        );
  }

  @override
  Widget buildPage(BuildContext context, WidgetRef ref, void payload) {
    return SheetContent(
      backgroundColor: context.theme.appColors.secondaryBackground,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 16.0.s),
            child: AuthHeader(
              title: context.i18n.turn_notifications_title,
              description: context.i18n.turn_notifications_description,
              descriptionSidePadding: 12.0.s,
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Notifications(),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 24.0.s)),
                const SliverToBoxAdapter(
                  child: Descriptions(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 76.0.s),
                      ScreenSideOffset.small(
                        child: Button(
                          label: Text(context.i18n.button_continue),
                          mainAxisSize: MainAxisSize.max,
                          onPressed: () {
                            ref
                                .read(permissionsProvider.notifier)
                                .requestPermission(
                                  PermissionType.Notifications,
                                )
                                .then((_) => handleSignIn(ref));
                          },
                        ),
                      ),
                      SizedBox(height: 50.0.s),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}