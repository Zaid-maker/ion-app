// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:ion/app/features/feed/views/components/actions_toolbar_button/actions_toolbar_button.dart';
import 'package:ion/app/features/feed/views/components/text_editor/hooks/use_text_editor_font_style.dart';
import 'package:ion/app/features/feed/views/components/text_editor/utils/wipe_styles.dart';
import 'package:ion/generated/assets.gen.dart';

class ToolbarH1Button extends HookWidget {
  const ToolbarH1Button({required this.textEditorController, super.key});
  final QuillController textEditorController;

  @override
  Widget build(BuildContext context) {
    final fontType = useTextEditorFontStyle(textEditorController);

    return ActionsToolbarButton(
      icon: Assets.svg.iconArticleH1Off,
      iconSelected: Assets.svg.iconArticleH1On,
      onPressed: () {
        wipeAllStyles(textEditorController);
        textEditorController.formatSelection(Attribute.h1);
      },
      selected: fontType == FontType.h1,
    );
  }
}
