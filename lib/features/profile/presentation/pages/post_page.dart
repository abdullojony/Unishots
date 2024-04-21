import 'package:flutter/material.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';

class PostPage extends StatelessWidget {
  const PostPage(this.post, {super.key});
  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        centerTitle: true,
      ),
      body: Image.network(
        post.postUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
