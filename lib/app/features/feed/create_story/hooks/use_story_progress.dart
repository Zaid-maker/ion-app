// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/features/core/providers/video_player_provider.dart';
import 'package:ion/app/features/feed/create_story/data/models/story.dart';
import 'package:ion/app/hooks/use_on_init.dart';

typedef StoryProgressResult = double;

/// Tracks the progress of a story (image or video) and calls [onCompleted] when the story finishes.
StoryProgressResult useStoryProgress(
  WidgetRef ref, {
  required Story story,
  required bool isCurrent,
  required VoidCallback onCompleted,
  required BuildContext context,
}) {
  final progress = useState<double>(0);
  final animationController = useAnimationController(duration: const Duration(seconds: 5));

  final videoController = story is VideoStory
      ? ref.watch(
          videoControllerProvider(story.data.contentUrl, autoPlay: isCurrent),
        )
      : null;

  void handleImageProgress() {
    if (!isCurrent || !context.mounted) return;
    progress.value = animationController.value;
    if (animationController.isCompleted) {
      onCompleted();
    }
  }

  void handleVideoProgress() {
    if (!isCurrent ||
        !context.mounted ||
        videoController == null ||
        !videoController.value.isInitialized) {
      return;
    }

    final position = videoController.value.position;
    final duration = videoController.value.duration;

    if (duration.inMilliseconds > 0) {
      final currentProgress = (position.inMilliseconds / duration.inMilliseconds).clamp(0.0, 1.0);
      progress.value = currentProgress;

      if (currentProgress >= 1.0) {
        onCompleted();
      }
    }
  }

  useEffect(
    () {
      if (!isCurrent || !context.mounted) {
        progress.value = 0;
        return null;
      }

      if (story is ImageStory) {
        animationController
          ..reset()
          ..forward()
          ..addListener(handleImageProgress);
        return () {
          if (context.mounted) {
            animationController
              ..removeListener(handleImageProgress)
              ..reset();
          }
        };
      }

      if (videoController != null) {
        videoController.addListener(handleVideoProgress);
        return () {
          if (context.mounted) {
            videoController.removeListener(handleVideoProgress);
          }
        };
      }

      return null;
    },
    [isCurrent, videoController?.value.isInitialized],
  );

  useOnInit(() {
    if (context.mounted && story is VideoStory && videoController != null) {
      videoController
        ..pause()
        ..seekTo(Duration.zero);
    }
  });

  return progress.value;
}
