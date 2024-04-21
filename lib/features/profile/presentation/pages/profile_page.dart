import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/data/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/cached_profile_image.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/follow_button.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/stat_column.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/user_posts.dart';
import 'package:styled_widget/styled_widget.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key, required this.userData});
  final UserEntity userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .user
        .userId;
    final isCurrentUser = currentUserId == userData.userId;
    final follows = ref.watch(followsProvider);
    final postCount = ref.watch(postCounterProvider);
    final followers = useState<int>(userData.followers.length);
    final isFollowing =
        useState<bool>(userData.followers.contains(currentUserId));

    return Scaffold(
      appBar: AppBar(
        title: Text(userData.username).fontWeight(FontWeight.bold),
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
                    isCurrentUser
                        ? CachedProfileImage(userData.profileImage)
                        : CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                              userData.profileImage,
                            ),
                            radius: 40,
                          ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StatColumn(
                                  isCurrentUser
                                      ? postCount
                                      : userData.posts.length,
                                  "posts"),
                              StatColumn(followers.value, "followers"),
                              StatColumn(
                                  isCurrentUser
                                      ? follows.length - 1
                                      : userData.following.length,
                                  "following"),
                            ],
                          ),
                          currentUserId == userData.userId
                              ? FollowButton(
                                  text: 'Sign Out',
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  textColor: Theme.of(context).primaryColorDark,
                                  borderColor: Colors.grey,
                                  function: () {
                                    sl.get<AuthRepositories>().signOut().then(
                                        (value) => ref
                                            .read(currentUserProvider.notifier)
                                            .signout());
                                  },
                                )
                              : isFollowing.value
                                  ? Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                          FollowButton(
                                            text: 'Unfollow',
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                            borderColor: Colors.grey,
                                            function: () {
                                              ref
                                                  .read(
                                                      followsProvider.notifier)
                                                  .remove(userData.userId);
                                              sl
                                                  .get<FirestoreRepositories>()
                                                  .followUser(
                                                      userId: currentUserId,
                                                      followId: userData.userId)
                                                  .then((value) {
                                                isFollowing.value =
                                                    !isFollowing.value;
                                                followers.value--;
                                              });
                                            },
                                          ),
                                          FollowButton(
                                            text: 'Send a message',
                                            backgroundColor: Colors.white,
                                            textColor: Colors.black,
                                            borderColor: Colors.grey,
                                            function: () => sl
                                                .get<FirestoreRepositories>()
                                                .createChat(
                                                    userId: currentUserId,
                                                    chatId: userData.userId,
                                                    username: userData.username,
                                                    profileImageUrl:
                                                        userData.profileImage)
                                                .then((value) {
                                              ref
                                                  .read(
                                                      currentTabNotifierProvider
                                                          .notifier)
                                                  .update(
                                                      (state) => TabItem.chats);
                                              ref
                                                  .read(chatNotifierProvider
                                                      .notifier)
                                                  .update((state) => value);
                                            }),
                                          ),
                                        ])
                                  : FollowButton(
                                      text: 'Follow',
                                      backgroundColor: Colors.blue,
                                      textColor: Colors.white,
                                      borderColor: Colors.blue,
                                      function: () {
                                        ref
                                            .read(followsProvider.notifier)
                                            .add(userData.userId);
                                        sl
                                            .get<FirestoreRepositories>()
                                            .followUser(
                                                userId: currentUserId,
                                                followId: userData.userId)
                                            .then((value) {
                                          isFollowing.value =
                                              !isFollowing.value;
                                          followers.value++;
                                        });
                                      },
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
                  child: Text(userData.bio),
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   padding: const EdgeInsets.only(
                //     top: 1,
                //   ),
                //   child: Text(
                //     userData.bio,
                //   ),
                // ),
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
