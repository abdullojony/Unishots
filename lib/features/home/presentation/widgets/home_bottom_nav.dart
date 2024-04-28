import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/chat_icon.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/dialogs/android_dialog.dart';
import 'package:instagram_clone/features/home/presentation/widgets/dialogs/cupertino_dialog.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:ionicons/ionicons.dart';

class HomeBottomNav extends ConsumerWidget {
  const HomeBottomNav(this.goToFirst, {super.key});
  final Function(TabItem) goToFirst;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // current tab taken from provider [default: feed]
    final currentTab = ref.watch(currentTabNotifierProvider);

    void addPost() {
      Platform.isIOS
          ? showCupertinoModalPopup(
              context: context,
              barrierDismissible: true,
              builder: (_) => const CupertinoDialog())
          : showDialog(context: context, builder: (_) => const AndroidDialog());
    }

    return CupertinoTabBar(
        backgroundColor: Theme.of(context).primaryColor,
        activeColor: Theme.of(context).primaryColorDark,
        inactiveColor: Theme.of(context).primaryColorDark,
        currentIndex: currentTab.index,
        onTap: (index) {
          final tabItem = TabItem.values[index];
          if (tabItem == TabItem.post) {
            addPost();
          } else {
            if (index == currentTab.index) {
              goToFirst(tabItem);
            } else {
              ref
                  .read(currentTabNotifierProvider.notifier)
                  .update((state) => tabItem);
            }
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              activeIcon: Icon(Ionicons.home)),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.search_outline),
              activeIcon: Icon(Ionicons.search)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_sharp, size: 35)),
          BottomNavigationBarItem(
              icon: ChatIcon(Ionicons.chatbubble_ellipses_outline),
              activeIcon: ChatIcon(Ionicons.chatbubble_ellipses)),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.person_circle_outline),
              activeIcon: Icon(Ionicons.person_circle))
        ]);
  }
}
