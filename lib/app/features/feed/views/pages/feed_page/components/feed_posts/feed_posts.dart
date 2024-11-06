// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/features/feed/providers/feed_posts_data_source_provider.dart';
import 'package:ion/app/features/feed/views/components/entities_list/entities_list.dart';
import 'package:ion/app/features/feed/views/components/entities_list/entities_list_skeleton.dart';
import 'package:ion/app/features/nostr/providers/entities_paged_data_provider.dart';
import 'package:ion/app/hooks/use_on_init.dart';

class FeedPosts extends HookConsumerWidget {
  const FeedPosts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSource = ref.watch(feedPostsDataSourceProvider);
    final entities = ref.watch(entitiesPagedDataProvider(dataSource));

    useOnInit(
      () {
        if (dataSource != null) {
          ref.read(entitiesPagedDataProvider(dataSource).notifier).fetchEntities();
        }
      },
      [dataSource],
    );

    if (entities == null) {
      return const EntitiesListSkeleton();
    }

    return EntitiesList(entities: entities.data.items.toList());
  }
}
