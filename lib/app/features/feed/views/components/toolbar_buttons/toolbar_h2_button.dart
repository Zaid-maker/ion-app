// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:ion/app/features/feed/views/components/actions_toolbar_button/actions_toolbar_button.dart';
import 'package:ion/app/features/feed/views/components/text_editor/hooks/use_text_editor_font_style.dart';
import 'package:ion/app/features/feed/views/components/text_editor/utils/wipe_styles/wipe_styles.dart';
import 'package:ion/generated/assets.gen.dart';

class ToolbarH2Button extends HookWidget {
  const ToolbarH2Button({required this.textEditorController, super.key});
  final QuillController textEditorController;

  @override
  Widget build(BuildContext context) {
    final fontType = useTextEditorFontStyle(textEditorController);

    return ActionsToolbarButton(
      icon: Assets.svg.iconArticleH2Off,
      iconSelected: Assets.svg.iconArticleH2On,
      onPressed: () {
        wipeAllStyles(textEditorController);
        textEditorController.formatSelection(Attribute.h2);
      },
      selected: fontType == FontType.h2,
    );
  }
}