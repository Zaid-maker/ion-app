import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/features/feed/feed_search/providers/feed_search_top_posts_provider.dart';
import 'package:ice/app/features/feed/feed_search/views/components/nothing_is_found.dart';
import 'package:ice/app/features/feed/views/components/post_list/post_list.dart';
import 'package:ice/app/features/feed/views/components/post_list/post_list_skeleton.dart';

class FeedAdvancedSearchTop extends HookConsumerWidget {
  const FeedAdvancedSearchTop({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    final topPostsSearchResults = ref.watch(feedSearchTopPostsProvider(query));

    return topPostsSearchResults.maybeWhen(
      data: (postIds) {
        if (postIds == null || postIds.isEmpty) {
          return NothingIsFound();
        }
        return CustomScrollView(slivers: [PostList(postIds: postIds)]);
      },
      orElse: () => CustomScrollView(slivers: [PostListSkeleton()]),
    );
  }
}