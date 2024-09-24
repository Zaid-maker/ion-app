import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ice/app/components/button/button.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/components/separated/separator.dart';
import 'package:ice/app/extensions/extensions.dart';
import 'package:ice/app/features/feed/create_article/views/pages/create_article_modal/hooks/use_font_type.dart';
import 'package:ice/app/features/feed/views/components/actions_toolbar/actions_toolbar.dart';
import 'package:ice/app/features/feed/views/components/actions_toolbar_button/actions_toolbar_button.dart';
import 'package:ice/app/features/feed/views/components/actions_toolbar_button_send/actions_toolbar_button_send.dart';
import 'package:ice/app/features/gallery/data/models/media_data.dart';
import 'package:ice/app/hooks/use_on_init.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/app/router/components/sheet_content/sheet_content.dart';
import 'package:ice/generated/assets.gen.dart';

class CreateArticleModal extends HookWidget {
  const CreateArticleModal({super.key});

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useOnInit(focusNode.requestFocus);

    final (fontType, setFontType) = useFontType();

    return SheetContent(
      bottomPadding: 0,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NavigationAppBar.modal(
            title: Text(context.i18n.create_article_nav_title),
            actions: [
              Button(
                type: ButtonType.secondary,
                label: Text(
                  context.i18n.button_next,
                  style: context.theme.appTextThemes.body.copyWith(
                    color: context.theme.appColors.primaryAccent,
                  ),
                ),
                backgroundColor: context.theme.appColors.secondaryBackground,
                borderColor: context.theme.appColors.secondaryBackground,
                onPressed: () {},
              ),
            ],
          ),
          Expanded(
            child: ScreenSideOffset.small(
              child: TextField(
                maxLines: null,
                focusNode: focusNode,
                keyboardType: TextInputType.multiline,
                style: context.theme.appTextThemes.body2,
                decoration: InputDecoration(
                  hintStyle: context.theme.appTextThemes.body2.copyWith(
                    color: context.theme.appColors.quaternaryText,
                  ),
                  hintText: context.i18n.create_post_modal_placeholder,
                ),
                cursorColor: context.theme.appColors.primaryAccent,
                cursorHeight: 13.0.s,
              ),
            ),
          ),
          Column(
            children: [
              HorizontalSeparator(),
              ScreenSideOffset.small(
                child: ActionsToolbar(
                  actions: [
                    ActionsToolbarButton(
                      icon: Assets.svg.iconGalleryOpen,
                      onPressed: () => MediaPickerRoute().push<List<MediaData>>(context),
                    ),
                    ActionsToolbarButton(
                      icon: Assets.svg.iconPostPoll,
                      onPressed: () => {},
                    ),
                    ActionsToolbarButton(
                      icon: Assets.svg.iconPostRegulartextOff,
                      iconSelected: Assets.svg.iconPostRegulartextOn,
                      onPressed: () => setFontType(FontType.regular),
                      selected: fontType == FontType.regular,
                    ),
                    ActionsToolbarButton(
                      icon: Assets.svg.iconPostBoldtextOff,
                      iconSelected: Assets.svg.iconPostBoldtextOn,
                      onPressed: () => setFontType(FontType.bold),
                      selected: fontType == FontType.bold,
                    ),
                    ActionsToolbarButton(
                      icon: Assets.svg.iconPostItalictextOff,
                      iconSelected: Assets.svg.iconPostItalictextOn,
                      onPressed: () => setFontType(FontType.italic),
                      selected: fontType == FontType.italic,
                    ),
                  ],
                  trailing: ActionsToolbarButtonSend(
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
