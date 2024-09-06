import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/features/user/pages/pull_right_menu_page/components/decorations.dart';
import 'package:ice/app/features/user/pages/pull_right_menu_page/components/profile_info/components/profile_details/profile_details_cell.dart';
import 'package:ice/app/features/user/providers/user_data_provider.dart';
import 'package:ice/app/utils/username.dart';
import 'package:ice/generated/assets.gen.dart';

class ProfileDetails extends ConsumerWidget {
  const ProfileDetails({
    super.key,
  });

  double get verifiedIconSize => 16.0.s;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataNotifierProvider);

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40.0.s),
      padding: EdgeInsets.fromLTRB(24.0.s, 32.0.s, 24.0.s, 24.0.s),
      decoration: Decorations.borderBoxDecoration(context),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userData.name,
                style: context.theme.appTextThemes.title.copyWith(
                  color: context.theme.appColors.primaryText,
                ),
              ),
              if (userData.isVerified ?? false) ...[
                SizedBox(width: 6.0.s),
                Assets.svg.iconBadgeVerify.icon(size: verifiedIconSize),
              ],
            ],
          ),
          SizedBox(height: 3.0.s),
          Text(
            prefixUsername(
              username: userData.nickname,
              context: context,
            ),
            style: context.theme.appTextThemes.caption.copyWith(
              color: context.theme.appColors.secondaryText,
            ),
          ),
          SizedBox(height: 20.0.s),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileDetailsCell(
                  title: context.i18n.profile_following,
                  value: userData.following ?? 0,
                ),
                VerticalDivider(
                  width: 36.0.s,
                  thickness: 1.0.s,
                  color: context.theme.appColors.onTerararyFill,
                ),
                ProfileDetailsCell(
                  title: context.i18n.profile_followers,
                  value: userData.followers ?? 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
