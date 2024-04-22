import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/unishots_logo.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/feed_posts.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:ionicons/ionicons.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({required this.userId, super.key});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userStreamProvider(userId));

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
      body: userStream.when(
          data: (users) {
            final set = Set<String>.from(users.docs.first['following']);
            set.add(userId);
            return FeedPosts(following: set);
          },
          loading: () => const LoadingWidget(),
          error: (error, stack) => FailedWidget(error: error.toString())),
    );
  }
}
