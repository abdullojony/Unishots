import 'package:flutter/material.dart';
import 'package:instagram_clone/features/chat/presentation/pages/chat_screen.dart';
import 'package:instagram_clone/features/feed/presentation/pages/feed_screen.dart';
import 'package:instagram_clone/features/home/presentation/widgets/offstage_navigator.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_screen.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_screen.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(
      {required this.navKeys, required this.currentUserId, super.key});
  final Map<TabItem, GlobalKey<NavigatorState>> navKeys;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      OffstageNavigator(
        tabItem: TabItem.feed,
        navKey: navKeys[TabItem.feed],
        screen: const FeedScreen(),
      ),
      OffstageNavigator(
        tabItem: TabItem.search,
        navKey: navKeys[TabItem.search],
        screen: const SearchScreen(),
      ),
      OffstageNavigator(
          tabItem: TabItem.chats,
          navKey: navKeys[TabItem.chats],
          screen: const ChatScreen()),
      OffstageNavigator(
        tabItem: TabItem.profile,
        navKey: navKeys[TabItem.profile],
        screen: ProfileScreen(userId: currentUserId, isCurrentUser: true),
      ),
    ]);
  }
}
