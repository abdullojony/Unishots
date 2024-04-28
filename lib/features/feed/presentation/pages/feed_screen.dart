import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/empty_page.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/unishots_logo.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/data/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:ionicons/ionicons.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedSet = ref.watch(feedSetProvider);
    final feedStream = ref.watch(feedStreamProvider(feedSet));

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const UnishotsLogo(height: 28),
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.heart_outline,
              size: 28,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () => sl
                .get<CoreRepositories>()
                .showSnackBar(context, message: 'Not implemented yet.'),
          ),
        ],
      ),
      body: feedStream.when(
          data: (posts) => posts == null || posts.docs.isEmpty
              ? const EmptyPage('Follow users to see their posts')
              : ListView.builder(
                  itemCount: posts.docs.length,
                  itemBuilder: (ctx, index) => PostCard(
                    post: PostModel.fromDocument(posts.docs[index]),
                  ),
                ),
          loading: () => const LoadingWidget(),
          error: (error, stack) => FailedWidget(error: error.toString())),
    );
  }
}
