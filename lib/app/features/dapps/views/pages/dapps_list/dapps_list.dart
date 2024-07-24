import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/components/empty_list/empty_list.dart';
import 'package:ice/app/components/inputs/search_input/search_input.dart';
import 'package:ice/app/components/screen_offset/screen_side_offset.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/features/dapps/views/categories/apps/apps.dart';
import 'package:ice/app/features/dapps/views/components/grid_item/grid_item.dart';
import 'package:ice/app/features/dapps/views/pages/mocks/mocked_apps.dart';
import 'package:ice/app/router/components/navigation_app_bar/navigation_app_bar.dart';
import 'package:ice/generated/assets.gen.dart';

class DAppsList extends HookConsumerWidget {
  const DAppsList({required this.payload, super.key});

  final AppsRouteData payload;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = useState('');
    final items = payload.items ?? <DAppItem>[];

    final filteredApps = searchText.value.isEmpty
        ? items
        : items.where((DAppItem app) {
            final searchLower = searchText.value.toLowerCase().trim();
            final titleLower = app.title.toLowerCase();

            return titleLower.contains(searchLower);
          }).toList();

    return Scaffold(
      appBar: NavigationAppBar.screen(
        title: Text(payload.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ScreenSideOffset.small(
              child: Padding(
                padding: EdgeInsets.only(top: 12.0.s),
                child: Column(
                  children: [
                    if (payload.isSearchVisible ?? false)
                      SearchInput(
                        onTextChanged: (String value) => searchText.value = value,
                      ),
                    Expanded(
                      child: Container(
                        child: items.isEmpty
                            ? EmptyList(
                                asset: Assets.images.misc.dappsEmpty,
                                title: context.i18n.dapps_favourites_empty_title,
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  vertical: 10.0.s,
                                ),
                                itemCount: filteredApps.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final app = filteredApps[index];
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.5.s),
                                    child: GridItem(
                                      item: app,
                                      showIsFavourite: true,
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
