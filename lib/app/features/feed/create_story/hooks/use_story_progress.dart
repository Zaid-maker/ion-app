// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ion/app/features/core/providers/video_player_provider.dart';
import 'package:ion/app/features/feed/create_story/data/models/story.dart';

typedef StoryProgressResult = double;

/// Tracks the progress of a story (image or video) and calls [onCompleted] when the story finishes.
StoryProgressResult useStoryProgress(
  WidgetRef ref, {
  required Story story,
  required bool isCurrent,
  required VoidCallback onCompleted,
}) {
  final progress = useState<double>(0);
  final animationController = useAnimationController(duration: const Duration(seconds: 5));

  final videoController = story is VideoStory
      ? ref.watch(
          videoControllerProvider(story.data.contentUrl, autoPlay: isCurrent),
        )
      : null;

  void handleImageProgress() {
    if (!isCurrent) return;
    progress.value = animationController.value;
    if (animationController.isCompleted) {
      onCompleted();
    }
  }

  void handleVideoProgress() {
    if (!isCurrent || videoController == null || !videoController.value.isInitialized) return;

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
      if (!isCurrent) {
        progress.value = 0;
        return null;
      }

      if (story is ImageStory) {
        animationController
          ..reset()
          ..forward()
          ..addListener(handleImageProgress);
        return () {
          animationController
            ..removeListener(handleImageProgress)
            ..reset();
        };
      }

      if (videoController != null) {
        videoController.addListener(handleVideoProgress);
        return () {
          videoController.removeListener(handleVideoProgress);
        };
      }

      return null;
    },
    [isCurrent, videoController?.value.isInitialized],
  );

  // Очистка при размонтировании
  useEffect(
    () => () {
      if (story is VideoStory && videoController != null) {
        videoController
          ..pause()
          ..seekTo(Duration.zero);
      }
    },
    const [],
  );

  return progress.value;
}
