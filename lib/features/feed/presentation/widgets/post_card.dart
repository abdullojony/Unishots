import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_actions.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_description.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_header.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_image.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key, required this.post});
  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser
        .userId;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          PostHeader(post, currentUserId),
          PostImage(post, currentUserId),
          PostActions(post, currentUserId),
          PostDescription(post, currentUserId),
        ],
      ),
    );
  }
}
