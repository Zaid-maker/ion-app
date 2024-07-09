import 'package:flutter/material.dart';
import 'package:ice/app/router/app_routes.dart';

class PullRightMenuHandler extends StatelessWidget {
  const PullRightMenuHandler({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) {
        if (details.velocity.pixelsPerSecond.dx > 100 &&
            details.velocity.pixelsPerSecond.dx >
                details.velocity.pixelsPerSecond.dy) {
          PullRightMenuRoute().go(context);
        }
      },
      child: child,
    );
  }
}
