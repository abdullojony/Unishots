import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/profile/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/follow_button.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/stat_column.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_posts.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key, required this.userData});
  final UserEntity userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeFunctions>()!
        .user
        .userId;
    final followers = useState<Set>(userData.followers.toSet());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userData.username,
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                        userData.photoUrl,
                      ),
                      radius: 40,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StatColumn(userData.posts.length, "posts"),
                              StatColumn(followers.value.length, "followers"),
                              StatColumn(
                                  userData.following.length, "following"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              currentUserId == userData.userId
                                  ? FollowButton(
                                      text: 'Sign Out',
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      textColor:
                                          Theme.of(context).primaryColorDark,
                                      borderColor: Colors.grey,
                                      function: () {
                                        sl
                                            .get<AuthRepositories>()
                                            .signOut()
                                            .then((value) => ref.invalidate(
                                                currentUserProvider));
                                      },
                                    )
                                  : followers.value.contains(currentUserId)
                                      ? FollowButton(
                                          text: 'Unfollow',
                                          backgroundColor: Colors.white,
                                          textColor: Colors.black,
                                          borderColor: Colors.grey,
                                          function: () {
                                            sl
                                                .get<FirestoreRepositories>()
                                                .followUser(
                                                    userId: currentUserId,
                                                    followId: userData.userId)
                                                .then((value) {
                                              followers.value
                                                  .remove(currentUserId);
                                              followers.value =
                                                  Set.from(followers.value);
                                            });
                                          },
                                        )
                                      : FollowButton(
                                          text: 'Follow',
                                          backgroundColor: Colors.blue,
                                          textColor: Colors.white,
                                          borderColor: Colors.blue,
                                          function: () {
                                            sl
                                                .get<FirestoreRepositories>()
                                                .followUser(
                                                    userId: currentUserId,
                                                    followId: userData.userId)
                                                .then((value) {
                                              followers.value
                                                  .add(currentUserId);
                                              followers.value =
                                                  Set.from(followers.value);
                                            });
                                          },
                                        )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 15,
                  ),
                  child: Text(
                    userData.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 1,
                  ),
                  child: Text(
                    userData.bio,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 5),
          UserPosts(userData.userId),
        ],
      ),
    );
  }
}
