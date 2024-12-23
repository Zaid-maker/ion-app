// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/features/core/providers/video_player_provider.dart';
import 'package:ion/app/features/feed/stories/data/models/models.dart';
import 'package:ion/app/features/feed/stories/hooks/use_story_progress.dart';
import 'package:ion/app/features/feed/stories/views/components/story_viewer/components/progress/progress.dart';
import 'package:video_player/video_player.dart';

class StoryProgressTracker extends HookConsumerWidget {
  const StoryProgressTracker({
    required this.story,
    required this.isActive,
    required this.isCurrent,
    required this.isPreviousStory,
    required this.onCompleted,
    this.margin,
    super.key,
  });

  final Story story;
  final bool isActive;
  final bool isCurrent;
  final bool isPreviousStory;
  final VoidCallback onCompleted;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoController = _getVideoController(ref);
    final storyProgress = useStoryProgress(
      story: story,
      isCurrent: isCurrent,
      videoController: videoController,
    );

    useEffect(
      () {
        if (storyProgress.isCompleted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onCompleted();
          });
        }
        return null;
      },
      [storyProgress.isCompleted],
    );

    return StoryProgressSegment(
      isActive: isActive,
      storyProgress: isActive ? storyProgress.progress : 0.0,
      isPreviousStory: isPreviousStory,
      margin: margin,
    );
  }

  VideoPlayerController? _getVideoController(WidgetRef ref) {
    if (story is! VideoStory) return null;

    return ref.watch(
      videoControllerProvider(
        story.data.contentUrl,
        autoPlay: isCurrent,
      ),
    );
  }
}
