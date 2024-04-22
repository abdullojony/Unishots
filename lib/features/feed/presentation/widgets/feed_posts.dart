import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/data/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:styled_widget/styled_widget.dart';

class FeedPosts extends ConsumerWidget {
  const FeedPosts({required this.following, super.key});
  final Set<String> following;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedStream = ref.watch(feedStreamProvider(following));
    return feedStream.when(
        data: (posts) {
          if (posts.docs.isEmpty) {
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Follow users to see their posts'),
                const SizedBox(height: 10),
                OutlinedButton(
                  child: const Text('Explore')
                      .textColor(Theme.of(context).primaryColorDark),
                  onPressed: () => ref
                      .read(currentTabNotifierProvider.notifier)
                      .update((state) => TabItem.search),
                ),
              ],
            ));
          }
          return ListView.builder(
            itemCount: posts.docs.length,
            itemBuilder: (ctx, index) => PostCard(
              post: PostModel.fromDocument(posts.docs[index]),
            ),
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stack) => FailedWidget(error: error.toString()));
  }
}
