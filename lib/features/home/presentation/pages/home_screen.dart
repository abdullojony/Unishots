import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:instagram_clone/features/auth/presentation/pages/login_screen.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_body.dart';
import 'package:instagram_clone/features/home/presentation/widgets/home_bottom_nav.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';

// Inherited widget to provide functions to the children
class HomeResources extends InheritedWidget {
  final UserEntity user;
  final void Function(TabItem tabItem) goToFirst;

  const HomeResources(
      {super.key,
      required this.user,
      required this.goToFirst,
      required super.child});

  static HomeResources of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<HomeResources>()!;

  @override
  bool updateShouldNotify(HomeResources oldWidget) => oldWidget.user != user;
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
            final following = user.following.toSet();
            following.add(user.userId);
            Future(() {
              ref.read(followsProvider.notifier).update((state) => following);
              ref
                  .read(postCounterProvider.notifier)
                  .update((state) => user.posts.length);
            });
            return HomeResources(
              goToFirst: goToFirst,
              user: user,
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
