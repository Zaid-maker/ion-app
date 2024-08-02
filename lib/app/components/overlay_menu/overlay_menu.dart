import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OverlayMenu extends HookWidget {
  const OverlayMenu({
    super.key,
    required this.child,
    required this.menuBuilder,
    this.offset = Offset.zero,
  });

  final Widget child;
  final Widget Function(VoidCallback closeMenu) menuBuilder;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    final overlayPortalController = useMemoized(() => OverlayPortalController());
    final followLink = useMemoized(() => LayerLink());

    return OverlayPortal(
      controller: overlayPortalController,
      overlayChildBuilder: (_) {
        final renderBox = context.findRenderObject() as RenderBox;

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: overlayPortalController.hide,
          child: Stack(
            children: [
              CompositedTransformFollower(
                link: followLink,
                offset: Offset(0, renderBox.size.height).translate(offset.dx, offset.dy),
                child: menuBuilder(overlayPortalController.hide),
              ),
            ],
          ),
        );
      },
      child: GestureDetector(
        onTap: overlayPortalController.show,
        child: CompositedTransformTarget(
          link: followLink,
          child: child,
        ),
      ),
    );
  }
}