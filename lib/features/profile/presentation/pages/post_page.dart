import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class PostPage extends ConsumerWidget {
  const PostPage(this.postId, {super.key});
  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postStream = ref.watch(singlePostStreamProvider(postId));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Post').fontSize(18).fontWeight(FontWeight.bold),
          centerTitle: true,
        ),
        body: postStream.when(
            data: (post) => PostCard(post: PostModel.fromDocument(post)),
            loading: () => const LoadingWidget(),
            error: (e, s) => FailedWidget(error: e.toString())));
  }
}
