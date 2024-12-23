// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/extensions/extensions.dart';
import 'package:ion/app/features/chat/recent_chats/providers/conversations_edit_mode_provider.dart';
import 'package:ion/generated/assets.gen.dart';

class ConversationReadAllButton extends ConsumerWidget {
  const ConversationReadAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ref.read(conversationsEditModeProvider.notifier).editMode = false;
      },
      child: Row(
        children: [
          Assets.svg.iconChatReadall.icon(
            color: context.theme.appColors.primaryAccent,
            size: 20.0.s,
          ),
          SizedBox(width: 4.0.s),
          Flexible(
            child: Text(
              context.i18n.chat_read_all,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.theme.appTextThemes.body2
                  .copyWith(color: context.theme.appColors.primaryAccent),
            ),
          ),
        ],
      ),
    );
  }
}
