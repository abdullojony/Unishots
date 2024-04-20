import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/presentation/pages/login_screen.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_body.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';

// Inherited widget to provide functions to the children
class HomeFunctions extends InheritedWidget {
  final UserEntity user;
  final void Function(TabItem tabItem) goToFirst;

  const HomeFunctions(
      {super.key,
      required this.user,
      required this.goToFirst,
      required super.child});

  static HomeFunctions of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeFunctions>()!;

  @override
  bool updateShouldNotify(HomeFunctions oldWidget) => oldWidget.user != user;
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);

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

    return currentUser.when(
        data: (user) => user != null
            ? HomeFunctions(
                goToFirst: goToFirst,
                user: user,
                child: Scaffold(
                  body: HomeBody(navigatorKeys),
                  bottomNavigationBar: const HomeBottomNav(),
                ),
              )
            : const LoginScreen(),
        loading: () => const Scaffold(body: LoadingWidget()),
        error: (error, stack) =>
            Scaffold(body: FailedWidget(error: error.toString())));
  }
}
