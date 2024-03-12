import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ice/app/components/search_input/components/cancel_button.dart';
import 'package:ice/app/components/search_input/components/search_clear_button.dart';
import 'package:ice/app/components/search_input/hooks/use_node_focused.dart';
import 'package:ice/app/components/search_input/hooks/use_text_changed.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/generated/assets.gen.dart';

class SearchInput extends HookWidget {
  const SearchInput({
    super.key,
    required this.onTextChanged,
    this.loading = false,
  });

  final Function(String) onTextChanged;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = useTextEditingController();
    final FocusNode focusNode = useFocusNode();

    final ValueNotifier<bool> showClear = useState(false);
    final ValueNotifier<bool> focused = useNodeFocused(focusNode);

    useTextChanged(
      searchController,
      onTextChanged: (String text) {
        onTextChanged(text);
        showClear.value = text.isNotEmpty;
      },
    );

    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 40.0.s,
            child: TextField(
              focusNode: focusNode,
              style: context.theme.appTextThemes.body.copyWith(
                color: context.theme.appColors.primaryText,
              ),
              cursorColor: context.theme.appColors.primaryAccent,
              decoration: InputDecoration(
                isCollapsed: true,
                isDense: true,
                contentPadding: EdgeInsets.all(11.0.s),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.appColors.primaryBackground,
                  ),
                  borderRadius: BorderRadius.circular(16.0.s),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: context.theme.appColors.primaryAccent,
                  ),
                  borderRadius: BorderRadius.circular(16.0.s),
                ),
                hintText: context.i18n.search_placeholder,
                hintStyle: context.theme.appTextThemes.body.copyWith(
                  color: context.theme.appColors.tertararyText,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 9.0.s, right: 5.0.s),
                  child: Assets.images.icons.iconFieldSearch.icon(
                    color: context.theme.appColors.tertararyText,
                    size: 18.0.s,
                  ),
                ),
                suffixIcon: loading
                    ? Assets.images.icons.iconFieldIceloader.icon(size: 20.0.s)
                    : showClear.value
                        ? SearchClearButton(
                            onPressed: () => searchController.clear(),
                          )
                        : null,
                prefixIconConstraints: const BoxConstraints(),
                filled: true,
                fillColor: context.theme.appColors.primaryBackground,
              ),
              controller: searchController,
            ),
          ),
        ),
        if (focused.value)
          SearchCancelButton(onPressed: () => focusNode.unfocus()),
      ],
    );
  }
}