import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_body.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';

// Inherited widget to provide functions to the children
class HomeFunctions extends InheritedWidget {
  final void Function(TabItem tabItem) goToFirst;

  const HomeFunctions(
      {super.key, required this.goToFirst, required super.child});

  static HomeFunctions of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeFunctions>()!;

  @override
  bool updateShouldNotify(HomeFunctions oldWidget) => false;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // keys for each tab navigator for maintaining state
    final navigatorKeys = {
      TabItem.feed: GlobalKey<NavigatorState>(),
      TabItem.search: GlobalKey<NavigatorState>(),
      TabItem.favorites: GlobalKey<NavigatorState>(),
      TabItem.profile: GlobalKey<NavigatorState>(),
    };

    // function to pop to first route in each tab
    void goToFirst(TabItem tabItem) {
      navigatorKeys[tabItem]!.currentState?.popUntil((route) => route.isFirst);
    }

    return HomeFunctions(
      goToFirst: goToFirst,
      child: Scaffold(
        body: HomeBody(navigatorKeys),
        bottomNavigationBar: const HomeBottomNav(),
      ),
    );
  }
}
