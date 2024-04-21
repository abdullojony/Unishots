import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/unishots_logo.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/data/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:ionicons/ionicons.dart';
import 'package:styled_widget/styled_widget.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final follows = ref.watch(followsProvider);
    AsyncValue<QuerySnapshot> postStream = ref.watch(postStreamProvider);

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
            onPressed: () {},
          ),
        ],
      ),
      body: postStream.when(
          data: (posts) {
            final filteredPosts =
                posts.docs.where((post) => follows.contains(post['userId']));
            if (filteredPosts.isEmpty) {
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
              itemCount: filteredPosts.length,
              itemBuilder: (ctx, index) => PostCard(
                postData:
                    PostModel.fromDocument(filteredPosts.elementAt(index)),
              ),
            );
          },
          loading: () => const LoadingWidget(),
          error: (error, stack) => FailedWidget(error: error.toString())),
    );
  }
}
