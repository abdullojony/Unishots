import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/profile/presentation/pages/edit_info_page.dart';
import 'package:instagram_clone/features/profile/presentation/pages/followers_page.dart';
import 'package:instagram_clone/features/profile/presentation/pages/following_page.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/stat_column.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_actions.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_posts.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_profile_image.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.user, super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser
        .userId;
    final isCurrentUser = user.userId == currentUserId;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username).fontWeight(FontWeight.bold),
        centerTitle: false,
        actions: isCurrentUser
            ? [
                IconButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => EditInfoPage(user))),
                    icon: const Icon(Icons.menu))
              ]
            : null,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    UserProfileImage(user.profileImage,
                        isCurrentUser: isCurrentUser),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StatColumn(user.posts.length, "posts"),
                              StatColumn(user.followers.length, "followers")
                                  .gestures(
                                onTap: () => isCurrentUser
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                FollowersPage(currentUserId)))
                                    : {},
                              ),
                              StatColumn(user.following.length, "following")
                                  .gestures(
                                onTap: () => isCurrentUser
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                FollowingPage(currentUserId)))
                                    : {},
                              ),
                            ],
                          ),
                          UserActions(user, currentUserId,
                              isCurrentUser: isCurrentUser),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(user.bio),
                ),
              ],
            ),
          ),
          const Divider(height: 5),
          UserPosts(
              userId: user.userId, isCurrentUser: user.userId == currentUserId),
        ],
      ),
    );
  }
}
