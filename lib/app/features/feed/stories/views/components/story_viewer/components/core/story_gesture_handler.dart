// SPDX-License-Identifier: ice License 1.0

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryGestureHandler extends HookConsumerWidget {
  const StoryGestureHandler({
    required this.child,
    required this.onTapLeft,
    required this.onTapRight,
    required this.onLongPressStart,
    required this.onLongPressEnd,
    super.key,
  });

  final Widget child;
  final VoidCallback onTapLeft;
  final VoidCallback onTapRight;
  final VoidCallback onLongPressStart;
  final VoidCallback onLongPressEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tapPosition = useState<Offset?>(null);

    return GestureDetector(
      onTapDown: (details) => tapPosition.value = details.globalPosition,
      onTap: () {
        final screenWidth = MediaQuery.sizeOf(context).width;
        final isLeftSide = (tapPosition.value?.dx ?? 0) < screenWidth / 2;

        if (isLeftSide) {
          onTapLeft();
        } else {
          onTapRight();
        }
      },
      onLongPress: onLongPressStart,
      onLongPressEnd: (_) => onLongPressEnd,
      child: child,
    );
  }
}
