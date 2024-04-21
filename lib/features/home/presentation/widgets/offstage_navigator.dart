import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';

class OffstageNavigator extends ConsumerWidget {
  const OffstageNavigator(
      {super.key, required this.tabItem, this.navKey, required this.screen});
  final TabItem tabItem;
  final GlobalKey<NavigatorState>? navKey;
  final Widget screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Offstage(
      offstage: ref.watch(currentTabNotifierProvider) != tabItem,
      child: NavigatorPopHandler(
        onPop: () => navKey!.currentState!.maybePop(),
        child: Navigator(
          key: navKey,
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(builder: (_) => screen);
          },
        ),
      ),
    );
  }
}
