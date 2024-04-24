import 'package:flutter/material.dart';
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
    return Row(
      children: <Widget>[
        LikeAnimation(
          isAnimating: post.likes.contains(currentUserId),
          smallLike: true,
          child: IconButton(
              icon: post.likes.contains(currentUserId)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
              onPressed: () => sl.get<FirestoreRepositories>().likePost(
                  postId: post.postId,
                  userId: currentUserId,
                  likes: post.likes)),
        ),
        IconButton(
          icon: const Icon(Icons.comment_outlined),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CommentsScreen(postId: post.postId),
            ),
          ),
        ),
        IconButton(icon: const Icon(Icons.send), onPressed: () {}),
        Expanded(
            child: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        ))
      ],
    );
  }
}
