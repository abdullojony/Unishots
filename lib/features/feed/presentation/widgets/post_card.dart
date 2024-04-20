import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/pages/comments_screen.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/like_animation.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:intl/intl.dart';

class PostCard extends HookConsumerWidget {
  const PostCard({super.key, required this.postData});
  final PostEntity postData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = context
        .dependOnInheritedWidgetOfExactType<HomeFunctions>()!
        .user
        .userId;
    final isLikeAnimating = useState(false);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          // HEADER SECTION OF THE POST
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    postData.profileImageUrl,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          postData.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      useRootNavigator: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: ListView(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shrinkWrap: true,
                              children: [
                                'Delete',
                              ]
                                  .map(
                                    (e) => InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12, horizontal: 16),
                                          child: Text(e),
                                        ),
                                        onTap: () {
                                          sl
                                              .get<FirestoreRepositories>()
                                              .deletePost(
                                                  userId: userId,
                                                  postId: postData.postId);
                                          // remove the dialog box
                                          Navigator.of(context).pop();
                                        }),
                                  )
                                  .toList()),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
          ),
          // IMAGE SECTION OF THE POST
          GestureDetector(
            onDoubleTap: () {
              sl.get<FirestoreRepositories>().likePost(
                  postId: postData.postId,
                  userId: userId,
                  likes: postData.likes.toList());
              isLikeAnimating.value = true;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Image.network(
                    postData.postUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isLikeAnimating.value ? 1 : 0,
                  child: LikeAnimation(
                    isAnimating: isLikeAnimating.value,
                    duration: const Duration(
                      milliseconds: 400,
                    ),
                    onEnd: () {
                      isLikeAnimating.value = false;
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // LIKE, COMMENT SECTION OF THE POST
          Row(
            children: <Widget>[
              LikeAnimation(
                isAnimating: postData.likes.contains(userId),
                smallLike: true,
                child: IconButton(
                    icon: postData.likes.contains(userId)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_border,
                          ),
                    onPressed: () => sl.get<FirestoreRepositories>().likePost(
                        postId: postData.postId,
                        userId: userId,
                        likes: postData.likes.toList())),
              ),
              IconButton(
                icon: const Icon(
                  Icons.comment_outlined,
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CommentsScreen(
                      postId: postData.postId,
                    ),
                  ),
                ),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.send,
                  ),
                  onPressed: () {}),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(Icons.bookmark_border), onPressed: () {}),
              ))
            ],
          ),
          //DESCRIPTION AND NUMBER OF COMMENTS
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      '${postData.likes.length} likes',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(
                      style:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                      children: [
                        TextSpan(
                          text: postData.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' ${postData.description}',
                        ),
                      ],
                    ),
                  ),
                ),
                if (postData.comments.isNotEmpty)
                  InkWell(
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'View all ${postData.comments.length} comments',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        )),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CommentsScreen(
                          postId: postData.postId,
                        ),
                      ),
                    ),
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    DateFormat.yMMMd()
                        .format(DateTime.parse(postData.publishedDate)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
