import 'package:flutter/material.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/pages/comments_screen.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/like_animation.dart';

class PostActions extends StatelessWidget {
  const PostActions(this.post, this.currentUserId, {super.key});
  final PostEntity post;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final isSaved = post.savedBy.contains(currentUserId);
    final isLiked = post.likes.contains(currentUserId);

    void likePost(bool liked) {
      sl
          .get<FirestoreRepositories>()
          .likePost(postId: post.postId, userId: currentUserId, isLiked: liked);
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

    return Row(
      children: <Widget>[
        LikeAnimation(
          isAnimating: post.likes.contains(currentUserId),
          smallLike: true,
          child: IconButton(
              icon: isLiked
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: () => likePost(isLiked)),
        ),
        IconButton(
          icon: const Icon(Icons.comment_outlined),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CommentsScreen(postId: post.postId),
            ),
          ),
        ),
        IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => sl.get<CoreRepositories>().showSnackBar(context,
                message: 'Not implemented yet',
                duration: const Duration(seconds: 1))),
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: isSaved
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_outline),
              onPressed: () => savePost(isSaved)),
        ))
      ],
    );
  }
}
