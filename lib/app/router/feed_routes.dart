// SPDX-License-Identifier: ice License 1.0

part of 'app_routes.dart';

class FeedRoutes {
  static const routes = <TypedRoute<RouteData>>[
    TypedGoRoute<PostDetailsRoute>(path: 'post/:postId'),
    TypedGoRoute<ArticleDetailsRoute>(path: 'article/:articleId'),
    TypedGoRoute<FeedSimpleSearchRoute>(path: 'feed-simple-search'),
    TypedGoRoute<FeedAdvancedSearchRoute>(path: 'feed-advanced-search'),
    TypedGoRoute<ProfileRoute>(path: 'profile/:pubkey', routes: ProfileRoutes.routes),
    TypedGoRoute<PullRightMenuRoute>(path: 'pull-right-menu'),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<SwitchAccountRoute>(path: 'switch-account'),
      ],
    ),
    TypedShellRoute<ModalShellRouteData>(
      routes: [
        TypedGoRoute<RepostOptionsModalRoute>(path: 'post-repost-options/:postId'),
        TypedGoRoute<CommentPostModalRoute>(path: 'comment-post/:postId'),
        TypedGoRoute<PostReplyModalRoute>(path: 'reply-to-post/:postId'),
        TypedGoRoute<SharePostModalRoute>(path: 'share-post/:postId'),
        TypedGoRoute<CreatePostRoute>(path: 'create-post'),
        TypedGoRoute<CreateArticleRoute>(path: 'create-article'),
        TypedGoRoute<CreateStoryRoute>(path: 'create-story'),
        TypedGoRoute<CreateVideoRoute>(path: 'create-video'),
        TypedGoRoute<MediaPickerRoute>(path: 'media-picker'),
        TypedGoRoute<FeedSearchFiltersRoute>(path: 'feed-search_filters'),
        TypedGoRoute<FeedSearchLanguagesRoute>(path: 'feed-search-languages'),
        TypedGoRoute<StoryContactsShareRoute>(path: 'story-contacts-share'),
        TypedGoRoute<ArticlePreviewRoute>(path: 'article-preview'),
        TypedGoRoute<AddTopicsRoute>(path: 'add-topics'),
      ],
    ),
  ];
}

class ArticleDetailsRoute extends BaseRouteData {
  ArticleDetailsRoute({required this.articleId})
      : super(
          child: ArticleDetailsPage(articleId: articleId),
        );

  final String articleId;
}

class PostDetailsRoute extends BaseRouteData {
  PostDetailsRoute({required this.postId})
      : super(
          child: PostDetailsPage(postId: postId),
        );

  final String postId;
}

class PostReplyModalRoute extends BaseRouteData {
  PostReplyModalRoute({
    required this.postId,
    this.showCollapseButton = false,
  }) : super(
          type: IceRouteType.bottomSheet,
          child: PostReplyModal(postId: postId, showCollapseButton: showCollapseButton),
        );

  final String postId;

  final bool showCollapseButton;
}

class CommentPostModalRoute extends BaseRouteData {
  CommentPostModalRoute({required this.postId})
      : super(
          child: CommentPostModal(postId: postId),
          type: IceRouteType.bottomSheet,
        );

  final String postId;
}

class RepostOptionsModalRoute extends BaseRouteData {
  RepostOptionsModalRoute({required this.postId})
      : super(
          child: RepostOptionsModal(postId: postId),
          type: IceRouteType.bottomSheet,
        );

  final String postId;
}

class SharePostModalRoute extends BaseRouteData {
  SharePostModalRoute({
    required this.postId,
  }) : super(
          child: SharePostModal(postId: postId),
          type: IceRouteType.bottomSheet,
        );

  final String postId;
}

class FeedSimpleSearchRoute extends BaseRouteData {
  FeedSimpleSearchRoute({this.query = ''})
      : super(
          child: FeedSimpleSearchPage(query: query),
          type: IceRouteType.fade,
        );

  final String query;
}

class FeedAdvancedSearchRoute extends BaseRouteData {
  FeedAdvancedSearchRoute({required this.query})
      : super(
          child: FeedAdvancedSearchPage(query: query),
          type: IceRouteType.fade,
        );

  final String query;
}

class PullRightMenuRoute extends BaseRouteData {
  PullRightMenuRoute()
      : super(
          child: const PullRightMenuPage(),
          type: IceRouteType.slideFromLeft,
        );
}

class SwitchAccountRoute extends BaseRouteData {
  SwitchAccountRoute()
      : super(
          child: const SwitchAccountModal(),
          type: IceRouteType.bottomSheet,
        );
}

class CreatePostRoute extends BaseRouteData {
  CreatePostRoute()
      : super(
          child: const CreatePostModal(),
          type: IceRouteType.bottomSheet,
        );
}

class CreateArticleRoute extends BaseRouteData {
  CreateArticleRoute()
      : super(
          child: const CreateArticleModal(),
          type: IceRouteType.bottomSheet,
        );
}

class CreateStoryRoute extends BaseRouteData {
  CreateStoryRoute()
      : super(
          child: const CreateStoryModal(),
          type: IceRouteType.bottomSheet,
        );
}

class CreateVideoRoute extends BaseRouteData {
  CreateVideoRoute()
      : super(
          child: const CreateVideoModal(),
          type: IceRouteType.bottomSheet,
        );
}

class MediaPickerRoute extends BaseRouteData {
  MediaPickerRoute()
      : super(
          child: const MediaPickerPage(
            maxSelection: 5,
          ),
          type: IceRouteType.bottomSheet,
        );
}

class ArticlePreviewRoute extends BaseRouteData {
  ArticlePreviewRoute()
      : super(
          child: const CreateArticlePreviewModal(),
          type: IceRouteType.bottomSheet,
        );
}

class AddTopicsRoute extends BaseRouteData {
  AddTopicsRoute()
      : super(
          child: const CreateArticleTopics(),
          type: IceRouteType.bottomSheet,
        );
}

class FeedSearchFiltersRoute extends BaseRouteData {
  FeedSearchFiltersRoute()
      : super(
          child: const FeedSearchFiltersPage(),
          type: IceRouteType.bottomSheet,
        );
}

class FeedSearchLanguagesRoute extends BaseRouteData {
  FeedSearchLanguagesRoute({this.selectedLanguages = const []})
      : super(
          child: FeedSearchLanguagesPage(defaultSelected: selectedLanguages),
          type: IceRouteType.bottomSheet,
        );

  final List<Language> selectedLanguages;
}

@TypedGoRoute<StoryRecordRoute>(
  path: '/story-record',
  routes: [
    TypedGoRoute<StoryPreviewRoute>(path: 'story-preview/:videoPath'),
  ],
)
class StoryRecordRoute extends BaseRouteData {
  StoryRecordRoute() : super(child: const StoryRecordPage());
}

class StoryPreviewRoute extends BaseRouteData {
  StoryPreviewRoute({required this.videoPath})
      : super(
          child: StoryPreviewPage(videoPath: videoPath),
          type: IceRouteType.slideFromLeft,
        );

  final String videoPath;
}

@TypedGoRoute<StoryViewerRoute>(
  path: '/story-viewing',
)
class StoryViewerRoute extends BaseRouteData {
  StoryViewerRoute() : super(child: const StoryViewerPage());
}

class StoryContactsShareRoute extends BaseRouteData {
  StoryContactsShareRoute()
      : super(
          child: const StoryShareModal(),
          type: IceRouteType.bottomSheet,
        );
}
