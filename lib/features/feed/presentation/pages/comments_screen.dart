import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/feed/data/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/feed/presentation/pages/comments_page.dart';
import 'package:styled_widget/styled_widget.dart';

class CommentsScreen extends ConsumerWidget {
  const CommentsScreen({super.key, required this.postId});
  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentStream = ref.watch(commentStreamProvider(postId));

    return Scaffold(
        appBar: AppBar(
          title:
              const Text('Comments').fontSize(18).fontWeight(FontWeight.bold),
          centerTitle: true,
        ),
        body: commentStream.when(
          data: (comments) => CommentsPage(postId, comments.docs),
          loading: () => const LoadingWidget(),
          error: (e, s) => FailedWidget(error: e.toString()),
        ));
  }
}
