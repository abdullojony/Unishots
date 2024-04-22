import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/data/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/follow_button.dart';

class UserActions extends HookConsumerWidget {
  const UserActions(this.user, this.currentUserId,
      {required this.isCurrentUser, super.key});
  final UserEntity user;
  final String currentUserId;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFollowing = useState<bool>(user.followers.contains(currentUserId));

    void followUser() {
      sl
          .get<FirestoreRepositories>()
          .followUser(
              userId: currentUserId,
              followId: user.userId,
              isFollowing: isFollowing.value)
          .then((value) => isFollowing.value = !isFollowing.value,
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
          .then((value) {
        ref
            .read(currentTabNotifierProvider.notifier)
            .update((state) => TabItem.chats);
        ref.read(chatNotifierProvider.notifier).update((state) => value);
      },
              onError: (error) => sl
                  .get<CoreRepositories>()
                  .showSnackBar(context, message: error.toString()));
    }

    void signout() {
      sl.get<AuthRepositories>().signOut().then(
          (value) => ref.read(currentUserProvider.notifier).signout(),
          onError: (error) => sl
              .get<CoreRepositories>()
              .showSnackBar(context, message: error.toString()));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        isCurrentUser
            ? FollowButton(
                text: 'Sign Out',
                function: signout,
              )
            : isFollowing.value
                ? Column(mainAxisSize: MainAxisSize.min, children: [
                    FollowButton(
                      text: 'Unfollow',
                      function: followUser,
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
                    function: followUser,
                  ),
      ],
    );
  }
}
