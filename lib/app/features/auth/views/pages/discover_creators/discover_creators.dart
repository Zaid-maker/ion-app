// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/components/button/button.dart';
import 'package:ion/app/components/list_item/list_item.dart';
import 'package:ion/app/components/progress_bar/ion_loading_indicator.dart';
import 'package:ion/app/components/screen_offset/screen_side_offset.dart';
import 'package:ion/app/components/scroll_view/load_more_builder.dart';
import 'package:ion/app/components/separated/separated_column.dart';
import 'package:ion/app/components/separated/separator.dart';
import 'package:ion/app/components/skeleton/skeleton.dart';
import 'package:ion/app/extensions/extensions.dart';
import 'package:ion/app/features/auth/providers/content_creators_data_source_provider.dart';
import 'package:ion/app/features/auth/providers/onboarding_complete_notifier.dart';
import 'package:ion/app/features/auth/providers/onboarding_data_provider.dart';
import 'package:ion/app/features/auth/views/components/auth_scrolled_body/auth_scrolled_body.dart';
import 'package:ion/app/features/auth/views/pages/discover_creators/creator_list_item.dart';
import 'package:ion/app/features/nostr/providers/entities_paged_data_provider.dart';
import 'package:ion/app/features/user/model/user_metadata.dart';
import 'package:ion/app/hooks/use_selected_state.dart';
import 'package:ion/app/router/components/sheet_content/sheet_content.dart';

class DiscoverCreators extends HookConsumerWidget {
  const DiscoverCreators({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finishNotifier = ref.watch(onboardingCompleteNotifierProvider);
    final dataSource = ref.watch(contentCreatorsDataSourceProvider);
    final contentCreators = ref.watch(entitiesPagedDataProvider(dataSource));

    ref.displayErrors(onboardingCompleteNotifierProvider);

    final (selectedCreators, toggleCreatorSelection) = useSelectedState(<UserMetadataEntity>[]);

    final mayContinue = selectedCreators.isNotEmpty;

    final slivers = [
      if (contentCreators == null || contentCreators.data.items.isEmpty)
        SliverToBoxAdapter(
          child: ScreenSideOffset.small(
            child: Skeleton(
              child: SeparatedColumn(
                separator: SizedBox(height: 8.0.s),
                children: List.generate(5, (_) => ListItem()),
              ),
            ),
          ),
        )
      else
        SliverList.separated(
          separatorBuilder: (BuildContext _, int __) => SizedBox(height: 8.0.s),
          itemCount: contentCreators.data.items.length,
          itemBuilder: (BuildContext context, int index) {
            final creator = contentCreators.data.items.elementAt(index);
            if (creator is UserMetadataEntity) {
              return CreatorListItem(
                userMetadataEntity: creator,
                selected: selectedCreators.contains(creator),
                onPressed: () => toggleCreatorSelection(creator),
              );
            }
            return null;
          },
        ),
      SliverPadding(padding: EdgeInsets.only(top: 16.0.s)),
    ];

    return SheetContent(
      body: Column(
        children: [
          Expanded(
            child: LoadMoreBuilder(
              slivers: slivers,
              onLoadMore: ref.read(entitiesPagedDataProvider(dataSource).notifier).fetchEntities,
              hasMore: contentCreators?.data.pagination.values.first.hasMore ?? true,
              builder: (context, slivers) {
                return AuthScrollContainer(
                  title: context.i18n.discover_creators_title,
                  description: context.i18n.discover_creators_description,
                  slivers: [
                    SliverPadding(padding: EdgeInsets.only(top: 34.0.s)),
                    ...slivers,
                    SliverPadding(
                      padding: EdgeInsets.only(
                        bottom: 16.0.s + (mayContinue ? 0 : MediaQuery.paddingOf(context).bottom),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (mayContinue)
            Column(
              children: [
                const HorizontalSeparator(),
                SizedBox(height: 16.0.s),
                ScreenSideOffset.small(
                  child: Button(
                    disabled: finishNotifier.isLoading,
                    trailingIcon: finishNotifier.isLoading ? const IONLoadingIndicator() : null,
                    label: Text(context.i18n.button_continue),
                    mainAxisSize: MainAxisSize.max,
                    onPressed: () {
                      ref.read(onboardingDataProvider.notifier).followees =
                          selectedCreators.map((creator) => creator.pubkey).toList();
                      ref.read(onboardingCompleteNotifierProvider.notifier).finish();
                    },
                  ),
                ),
                SizedBox(height: 8.0.s + MediaQuery.paddingOf(context).bottom),
              ],
            ),
        ],
      ),
    );
  }
}
