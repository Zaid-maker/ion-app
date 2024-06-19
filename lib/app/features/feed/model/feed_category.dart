import 'package:flutter/widgets.dart';
import 'package:ice/app/extensions/asset_gen_image.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/generated/assets.gen.dart';

enum FeedCategory {
  feed,
  videos,
  articles;

  String getLabel(BuildContext context) => switch (this) {
        FeedCategory.feed => context.i18n.general_feed,
        FeedCategory.videos => context.i18n.general_videos,
        FeedCategory.articles => context.i18n.general_articles,
      };

  Color getColor(BuildContext context) => switch (this) {
        FeedCategory.feed => context.theme.appColors.purple,
        FeedCategory.videos => context.theme.appColors.raspberry,
        FeedCategory.articles => context.theme.appColors.success,
      };

  Widget getIcon(BuildContext context) {
    final color = context.theme.appColors.secondaryBackground;
    return switch (this) {
      FeedCategory.feed =>
        Assets.images.icons.iconProfileFeed.icon(color: color),
      FeedCategory.videos =>
        Assets.images.icons.iconVideosTrading.icon(color: color),
      FeedCategory.articles =>
        Assets.images.icons.iconFeedStories.icon(color: color),
    };
  }
}