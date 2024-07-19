import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ice/app/extensions/build_context.dart';
import 'package:ice/app/extensions/num.dart';
import 'package:ice/app/extensions/theme_data.dart';
import 'package:ice/app/router/app_routes.dart';
import 'package:ice/app/router/providers/bottom_sheet_state_provider.dart';
import 'package:ice/generated/assets.gen.dart';

enum TabItem {
  feed,
  chat,
  main,
  dapps,
  wallet;

  const TabItem();

  AssetGenImage? get icon {
    return switch (this) {
      TabItem.feed => Assets.images.icons.iconHomeOff,
      TabItem.chat => Assets.images.icons.iconChatOff,
      TabItem.main => Assets.images.logo.logoButton,
      TabItem.dapps => Assets.images.icons.iconDappOff,
      TabItem.wallet => Assets.images.icons.iconsWalletOff
    };
  }

  int get navigationIndex => index > TabItem.main.index ? index - 1 : index;
}

class MainTabNavigation extends HookConsumerWidget {
  const MainTabNavigation({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  static final Map<int, TabItem> _navigationIndexToTab = {
    for (var tab in TabItem.values)
      if (tab != TabItem.main) tab.navigationIndex: tab,
  };

  TabItem _getCurrentTab() {
    final adjustedIndex = navigationShell.currentIndex;
    return _navigationIndexToTab[adjustedIndex] ?? TabItem.main;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _adjustBottomNavIndex(navigationShell.currentIndex),
        onTap: (index) => _onTabSelected(context, ref, index),
        items: _navBarItems(ref),
        type: BottomNavigationBarType.fixed,
        backgroundColor: context.theme.appColors.secondaryBackground,
        selectedItemColor: context.theme.appColors.primaryAccent,
        unselectedItemColor: context.theme.appColors.tertararyText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  void _onTabSelected(BuildContext context, WidgetRef ref, int index) {
    final tabItem = TabItem.values[index];
    if (tabItem == TabItem.main) {
      _handleMainButtonTap(context, ref);
    } else {
      _navigateToTab(context, ref, tabItem);
    }
  }

  void _navigateToTab(BuildContext context, WidgetRef ref, TabItem tabItem) {
    final bottomSheetNotifier = ref.read(bottomSheetStateProvider.notifier);
    final currentTab = _getCurrentTab();

    if (bottomSheetNotifier.isSheetOpen(currentTab)) {
      context.pop();
      bottomSheetNotifier.closeCurrentSheet(currentTab);
    }

    final adjustedIndex = tabItem.navigationIndex;
    navigationShell.goBranch(
      adjustedIndex,
      initialLocation: true,
    );
  }

  void _handleMainButtonTap(BuildContext context, WidgetRef ref) {
    final currentTab = _getCurrentTab();
    final bottomSheetNotifier = ref.read(bottomSheetStateProvider.notifier);

    if (bottomSheetNotifier.isSheetOpen(currentTab)) {
      context.pop();
      bottomSheetNotifier.closeCurrentSheet(currentTab);
    } else {
      bottomSheetNotifier.setSheetState(currentTab, isOpen: true);
      _openMainModalForCurrentTab(context, currentTab);
    }
  }

  void _openMainModalForCurrentTab(BuildContext context, TabItem currentTab) {
    switch (currentTab) {
      case TabItem.feed:
        FeedMainModalRoute().go(context);
      case TabItem.chat:
        ChatMainModalRoute().go(context);
      case TabItem.dapps:
        DappsMainModalRoute().go(context);
      case TabItem.wallet:
        WalletMainModalRoute().go(context);
      case TabItem.main:
        break;
    }
  }

  List<BottomNavigationBarItem> _navBarItems(WidgetRef ref) {
    return TabItem.values.map((tabItem) {
      if (tabItem == TabItem.main) {
        return BottomNavigationBarItem(
          icon: _MainButton(navigationShell: navigationShell),
          label: '',
        );
      }
      return BottomNavigationBarItem(
        icon: _TabIcon(
          icon: tabItem.icon!,
          isSelected: _getCurrentTab() == tabItem,
        ),
        label: '',
      );
    }).toList();
  }

  int _adjustBottomNavIndex(int index) =>
      index >= TabItem.main.index ? index + 1 : index;
}

class _MainButton extends ConsumerWidget {
  const _MainButton({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomSheetState = ref.watch(bottomSheetStateProvider);
    final currentTab = TabItem.values.firstWhere(
      (tab) =>
          tab != TabItem.main &&
          tab.navigationIndex == navigationShell.currentIndex,
      orElse: () => TabItem.main,
    );
    final isModalOpen = bottomSheetState[currentTab] ?? false;

    final icon = isModalOpen
        ? Assets.images.logo.logoButtonClose
        : Assets.images.logo.logoButton;

    return SizedBox(
      width: 50,
      height: 50,
      child: icon.image(fit: BoxFit.contain),
    );
  }
}

class _TabIcon extends StatelessWidget {
  const _TabIcon({
    required this.icon,
    required this.isSelected,
  });

  final AssetGenImage icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return icon.image(
      width: 24.0.s,
      height: 24.0.s,
      color: isSelected
          ? context.theme.appColors.primaryAccent
          : context.theme.appColors.tertararyText,
    );
  }
}
