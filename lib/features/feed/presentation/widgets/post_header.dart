import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_screen.dart';
import 'package:styled_widget/styled_widget.dart';

class PostHeader extends ConsumerWidget {
  const PostHeader(this.post, this.currentUserId, {super.key});
  final PostEntity post;
  final String currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void openProfile() {
      post.userId == currentUserId
          ? ref
              .read(currentTabNotifierProvider.notifier)
              .update((state) => TabItem.profile)
          : Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProfileScreen(userId: post.userId)));
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
          .copyWith(right: 0),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(post.profileImageUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ).gestures(onTap: openProfile),
          const Spacer(),
          IconButton(
            onPressed: () {
              // showDialog(
              //   useRootNavigator: false,
              //   context: context,
              //   builder: (context) {
              //     return Dialog(
              //       child: ListView(
              //           padding: const EdgeInsets.symmetric(vertical: 16),
              //           shrinkWrap: true,
              //           children: [
              //             'Delete',
              //           ]
              //               .map(
              //                 (e) => InkWell(
              //                     child: Container(
              //                       padding: const EdgeInsets.symmetric(
              //                           vertical: 12, horizontal: 16),
              //                       child: Text(e),
              //                     ),
              //                     onTap: () {
              //                       sl.get<FirestoreRepositories>().deletePost(
              //                           userId: user.userId,
              //                           postId: post.postId);
              //                       // remove the dialog box
              //                       Navigator.of(context).pop();
              //                     }),
              //               )
              //               .toList()),
              //     );
              //   },
              // );
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
  }
}
