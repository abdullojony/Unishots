import 'package:flutter/material.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:styled_widget/styled_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage(this.post, {super.key});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post').fontSize(18).fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      body: PostCard(post: post),
    );
  }
}
