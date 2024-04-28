import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/pages/edit_post_page.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_screen.dart';
import 'package:instagram_clone/features/search/data/riverpod/search_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class PostHeader extends ConsumerWidget {
  const PostHeader(this.post, this.currentUserId, {super.key});
  final PostEntity post;
  final String currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCurrentUser = post.userId == currentUserId;
    final isSaved = post.savedBy.contains(currentUserId);

    void openProfile() {
      isCurrentUser
          ? ref
              .read(currentTabNotifierProvider.notifier)
              .update((state) => TabItem.profile)
          : Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => ProfileScreen(
                  userId: post.userId,
                  isCurrentUser: post.userId == currentUserId)));
    }

    void savePost(bool saved) {
      sl
          .get<FirestoreRepositories>()
          .savePost(postId: post.postId, userId: currentUserId, isSaved: saved)
          .then((value) => !saved
              ? sl.get<CoreRepositories>().showSnackBar(context,
                  message: 'Post saved', duration: const Duration(seconds: 1))
              : {});
    }

    void deletePost() {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title:
                    const Text('Do you want to delete the post?').fontSize(18),
                actions: [
                  TextButton(
                      child: const Text('Cancel').textColor(Colors.red),
                      onPressed: () => Navigator.of(ctx).pop()),
                  TextButton(
                      onPressed: () {
                        sl
                            .get<FirestoreRepositories>()
                            .deletePost(
                                postId: post.postId,
                                postUrl: post.postUrl,
                                userId: currentUserId)
                            .then((value) {
                          ref.invalidate(postProvider);
                          sl.get<CoreRepositories>().showSnackBar(context,
                              message: 'Post deleted',
                              duration: const Duration(seconds: 1));
                        });
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('Yes')),
                ],
              ));
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
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => isCurrentUser
                  ? [
                      PopupMenuItem<String>(
                        onTap: deletePost,
                        child: const Text('Delete'),
                      ),
                      PopupMenuItem<String>(
                        child: const Text('Edit'),
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => EditPostPage(post))),
                      ),
                    ]
                  : [
                      PopupMenuItem<String>(
                        child:
                            isSaved ? const Text('Unsave') : const Text('Save'),
                        onTap: () => savePost(isSaved),
                      ),
                    ])
        ],
      ),
    );
  }
}
