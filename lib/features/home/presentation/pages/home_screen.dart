import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/auth/presentation/pages/login_screen.dart';
import 'package:instagram_clone/features/feed/data/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_body.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';

// Inherited widget to provide functions to the children
class HomeResources extends InheritedWidget {
  final UserEntity currentUser;
  final void Function(TabItem tabItem) goToFirst;

  const HomeResources(
      {super.key,
      required this.currentUser,
      required this.goToFirst,
      required super.child});

  static HomeResources of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeResources>()!;

  @override
  bool updateShouldNotify(HomeResources oldWidget) =>
      oldWidget.currentUser != currentUser;
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
      TabItem.chats: GlobalKey<NavigatorState>(),
      TabItem.profile: GlobalKey<NavigatorState>(),
    };

    // function to pop to first route in each tab
    void goToFirst(TabItem tabItem) {
      navigatorKeys[tabItem]!.currentState?.popUntil((route) => route.isFirst);
    }

    return currentUser.when(
        data: (user) {
          if (user != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref
                  .read(feedSetProvider.notifier)
                  .update((state) => {...user.following, user.userId});
            });

            return HomeResources(
              goToFirst: goToFirst,
              currentUser: user,
              child: Scaffold(
                body: HomeBody(navigatorKeys),
                bottomNavigationBar: const HomeBottomNav(),
              ),
            );
          } else {
            return const LoginScreen();
          }
        },
        loading: () => const Scaffold(body: LoadingWidget()),
        error: (error, stack) =>
            Scaffold(body: FailedWidget(error: error.toString())));
  }
}
