// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ion/app/features/feed/stories/data/models/story.dart';
import 'package:video_player/video_player.dart';

class StoryProgress {
  const StoryProgress({
    required this.progress,
    required this.isCompleted,
  });

  final double progress;
  final bool isCompleted;
}

StoryProgress useStoryProgress({
  required Story story,
  required bool isCurrent,
  required VideoPlayerController? videoController,
}) {
  final progress = useState<double>(0);
  final isCompleted = useState(false);
  final animationController = useAnimationController(
    duration: const Duration(seconds: 5),
  );

  useEffect(
    () {
      if (!isCurrent) {
        progress.value = 0.0;
        isCompleted.value = false;
        return null;
      }

      void handleProgress() {
        story.map(
          video: (_) => videoController != null
              ? _handleVideoProgress(
                  videoController,
                  progress,
                  isCompleted,
                )
              : null,
          image: (_) => _handleImageProgress(
            animationController,
            progress,
            isCompleted,
          ),
        );
      }

      return story.map(
        image: (_) => _setupAnimationController(
          animationController,
          handleProgress,
        ),
        video: (_) => _setupVideoController(
          videoController,
          handleProgress,
          isCurrent,
        ),
      );
    },
    [isCurrent, videoController, story],
  );

  return StoryProgress(
    progress: progress.value,
    isCompleted: isCompleted.value,
  );
}

void _handleVideoProgress(
  VideoPlayerController controller,
  ValueNotifier<double> progress,
  ValueNotifier<bool> isCompleted,
) {
  if (!controller.value.isInitialized) return;

  final position = controller.value.position;
  final duration = controller.value.duration;

  if (duration.inMilliseconds > 0) {
    final currentProgress = (position.inMilliseconds / duration.inMilliseconds).clamp(0.0, 1.0);
    progress.value = currentProgress;
    isCompleted.value = currentProgress >= 1.0;
  }
}

void _handleImageProgress(
  AnimationController controller,
  ValueNotifier<double> progress,
  ValueNotifier<bool> isCompleted,
) {
  progress.value = controller.value;
  isCompleted.value = controller.value >= 1.0;
}

VoidCallback? _setupVideoController(
  VideoPlayerController? controller,
  VoidCallback handleProgress,
  bool isCurrent,
) {
  if (controller == null) return null;

  controller.addListener(handleProgress);

  if (isCurrent) {
    controller.play();
  }
  return () => controller.removeListener(handleProgress);
}

VoidCallback _setupAnimationController(
  AnimationController controller,
  VoidCallback handleProgress,
) {
  controller
    ..reset()
    ..forward()
    ..addListener(handleProgress);

  return () => controller.removeListener(handleProgress);
}
