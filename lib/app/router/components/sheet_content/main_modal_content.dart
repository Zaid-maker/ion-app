import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/main_tabs/components/components.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

class MainModalContent extends ConsumerWidget {
  const MainModalContent({required this.child, required this.state, super.key});

  final Widget child;
  final GoRouterState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = DefaultSheetController.of(context);

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          final metrics = controller.value;

          if (!metrics.hasDimensions || metrics.pixels <= metrics.minPixels) {
            final currentTab = _getCurrentTab(state.matchedLocation);
            ref
                .read(bottomSheetStateProvider.notifier)
                .closeCurrentSheet(currentTab);
            context.pop();
          }
        }
      },
      child: child,
    );
  }

  TabItem _getCurrentTab(String location) {
    if (location.startsWith(FeedRoute().location)) return TabItem.feed;
    if (location.startsWith(ChatRoute().location)) return TabItem.chat;
    if (location.startsWith(DappsRoute().location)) return TabItem.dapps;
    if (location.startsWith(WalletRoute().location)) return TabItem.wallet;
    return TabItem.main;
  }
}
