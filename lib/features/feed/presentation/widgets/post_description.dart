import 'package:flutter/material.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/pages/comments_screen.dart';
import 'package:intl/intl.dart';

class PostDescription extends StatelessWidget {
  const PostDescription(this.post, this.currentUserId, {super.key});
  final PostEntity post;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultTextStyle(
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.w800),
              child: Text(
                '${post.likes.length} likes',
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Theme.of(context).primaryColorDark),
                children: [
                  TextSpan(
                    text: post.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' ${post.description}',
                  ),
                ],
              ),
            ),
          ),
          if (post.comments.isNotEmpty)
            InkWell(
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    'View all ${post.comments.length} comments',
                    style: const TextStyle(fontSize: 16),
                  )),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CommentsScreen(
                    postId: post.postId,
                  ),
                ),
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              DateFormat.yMMMd().format(DateTime.parse(post.publishedDate)),
            ),
          ),
        ],
      ),
    );
  }
}
