import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/like_animation.dart';

class PostImage extends HookWidget {
  const PostImage(this.post, this.currentUserId, {super.key});
  final PostEntity post;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final isLikeAnimating = useState(false);

    return GestureDetector(
      onDoubleTap: () {
        sl.get<FirestoreRepositories>().likePost(
            postId: post.postId,
            userId: currentUserId,
            isLiked: post.likes.contains(currentUserId));
        isLikeAnimating.value = true;
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(post.postUrl, fit: BoxFit.cover),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isLikeAnimating.value ? 1 : 0,
            child: LikeAnimation(
              isAnimating: isLikeAnimating.value,
              duration: const Duration(milliseconds: 400),
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
    );
  }
}
