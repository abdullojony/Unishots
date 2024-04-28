import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/domain/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';
import 'package:instagram_clone/features/feed/data/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/follow_button.dart';
import 'package:styled_widget/styled_widget.dart';

class UserActions extends ConsumerWidget {
  const UserActions(this.user, {required this.isCurrentUser, super.key});
  final UserEntity user;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser
        .userId;
    final isFollowing = user.followers.contains(currentUserId);

    void followUser(bool following) {
      sl
          .get<FirestoreRepositories>()
          .followUser(
              userId: currentUserId,
              followId: user.userId,
              isFollowing: following)
          .then((value) {
        following
            ? ref.read(feedSetProvider.notifier).remove(user.userId)
            : ref.read(feedSetProvider.notifier).add(user.userId);
      },
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    void sendMessage() {
      sl
          .get<FirestoreRepositories>()
          .createChat(
              userId: currentUserId,
              chatId: user.userId,
              username: user.username,
              profileImageUrl: user.profileImage)
          .then((chat) {
        ref
            .read(currentTabNotifierProvider.notifier)
            .update((state) => TabItem.chats);
        if (ref.read(openChatProvider) != null) {
          ref.read(openChatProvider)!(chat);
        }
      },
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    void signout() {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Do you want to sign out?').fontSize(18),
                actions: [
                  TextButton(
                      child: const Text('Cancel').textColor(Colors.red),
                      onPressed: () => Navigator.of(ctx).pop()),
                  TextButton(
                      onPressed: () {
                        sl.get<AuthRepositories>().signOut().then((value) {
                          ref.read(currentUserProvider.notifier).signout();
                          ref.invalidate(openChatProvider);
                        },
                            onError: (e) => sl
                                .get<CoreRepositories>()
                                .showSnackBar(context, message: e.toString()));
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('Yes')),
                ],
              ));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isCurrentUser
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FollowButton(
                    text: 'Sign Out',
                    function: signout,
                  ),
                  FollowButton(
                      text: 'Edit profile',
                      function: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => EditProfilePage(user)))),
                ],
              )
            : isFollowing
                ? Column(mainAxisSize: MainAxisSize.min, children: [
                    FollowButton(
                      text: 'Unfollow',
                      function: () => followUser(isFollowing),
                    ),
                    FollowButton(
                      text: 'Send a message',
                      function: sendMessage,
                    ),
                  ])
                : FollowButton(
                    text: 'Follow',
                    backgroundColor: Colors.blue,
                    textColor: Colors.white,
                    borderColor: Colors.blue,
                    function: () => followUser(isFollowing),
                  ),
      ],
    );
  }
}
