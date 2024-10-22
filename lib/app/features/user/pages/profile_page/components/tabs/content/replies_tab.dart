// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:ion/app/features/user/model/user_content_type.dart';
import 'package:ion/app/features/user/pages/profile_page/components/tabs/empty_state.dart';

class RepliesTab extends StatelessWidget {
  const RepliesTab({
    required this.pubkey,
    super.key,
  });

  final String pubkey;

  static const UserContentType tabType = UserContentType.replies;

  @override
  Widget build(BuildContext context) {
    return const EmptyState(
      tabType: tabType,
    );
  }
}