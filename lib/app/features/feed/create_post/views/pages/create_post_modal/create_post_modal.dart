// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/components/avatar/avatar.dart';
import 'package:ion/app/components/back_hardware_button_interceptor/back_hardware_button_interceptor.dart';
import 'package:ion/app/components/screen_offset/screen_side_offset.dart';
import 'package:ion/app/components/separated/separator.dart';
import 'package:ion/app/extensions/extensions.dart';
import 'package:ion/app/features/feed/create_post/views/pages/create_post_modal/hooks/use_has_poll.dart';
import 'package:ion/app/features/feed/providers/poll/poll_answers_provider.dart';
import 'package:ion/app/features/feed/providers/poll/poll_title_notifier.dart';
import 'package:ion/app/features/feed/views/components/actions_toolbar/actions_toolbar.dart';
import 'package:ion/app/features/feed/views/components/text_editor/hooks/use_quill_controller.dart';
import 'package:ion/app/features/feed/views/components/text_editor/hooks/use_text_editor_has_content.dart';
import 'package:ion/app/features/feed/views/components/text_editor/text_editor.dart';
import 'package:ion/app/features/feed/views/components/toolbar_buttons/toolbar_buttons.dart';
import 'package:ion/app/features/feed/views/pages/cancel_creation_modal/cancel_creation_modal.dart';
import 'package:ion/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ion/app/router/components/sheet_content/sheet_content.dart';
import 'package:ion/app/router/utils/show_simple_bottom_sheet.dart';
import 'package:ion/app/services/markdown_parser/markdown_parser.dart';

class CreatePostModal extends HookConsumerWidget {
  const CreatePostModal({super.key});

  Future<void> _showCancelCreationModal(BuildContext context) async {
    await showSimpleBottomSheet<void>(
      context: context,
      child: CancelCreationModal(
        title: context.i18n.cancel_creation_post_title,
        onCancel: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditorController = useQuillController();
    final hasContent = useTextEditorHasContent(textEditorController);
    final hasPoll = useHasPoll(textEditorController);

    final pollTitle = ref.watch(pollTitleNotifierProvider);
    final pollAnswers = ref.watch(pollAnswersNotifierProvider);

    bool isPollValid() {
      return pollTitle.text.trim().isNotEmpty &&
          pollAnswers.length >= 2 &&
          pollAnswers.every(
            (answer) => answer.text.trim().isNotEmpty && answer.text.trim().length <= 25,
          );
    }

    bool isSendButtonEnabled() {
      if (hasPoll) {
        return isPollValid();
      } else {
        return hasContent;
      }
    }

    return BackHardwareButtonInterceptor(
      onBackPress: (context) async {
        await _showCancelCreationModal(context);
      },
      child: SheetContent(
        topPadding: 0,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NavigationAppBar.modal(
              title: Text(context.i18n.create_post_modal_title),
              onBackPress: () async {
                await _showCancelCreationModal(context);
              },
            ),
            Expanded(
              child: ScreenSideOffset.small(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Avatar(
                      size: 30.0.s,
                      imageUrl:
                          'https://ice-staging.b-cdn.net/profile/default-profile-picture-16.png',
                    ),
                    SizedBox(width: 10.0.s),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 6.0.s),
                        child: TextEditor(
                          textEditorController,
                          placeholder: context.i18n.create_post_modal_placeholder,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const HorizontalSeparator(),
                ScreenSideOffset.small(
                  child: ActionsToolbar(
                    actions: [
                      ToolbarImageButton(textEditorController: textEditorController),
                      if (!hasPoll)
                        ToolbarPollButton(
                          textEditorController: textEditorController,
                        ),
                      ToolbarRegularButton(textEditorController: textEditorController),
                      ToolbarItalicButton(textEditorController: textEditorController),
                      ToolbarBoldButton(textEditorController: textEditorController),
                    ],
                    trailing: ToolbarSendButton(
                      enabled: isSendButtonEnabled(),
                      onPressed: () {
                        generateMarkdownFromDelta(textEditorController.document.toDelta());
                        context.pop();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
