import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/feed/presentation/riverpod/feed_provider.dart';

class UserPosts extends ConsumerWidget {
  const UserPosts(this.userId, {super.key});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postStreamProvider);

    return posts.when(
        data: (p) {
          final userPosts = p.docs.where((e) => e['userId'] == userId);

          return GridView.builder(
            shrinkWrap: true,
            itemCount: userPosts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 1.5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return SizedBox(
                child: Image(
                  image: NetworkImage(userPosts.elementAt(index)['postUrl']),
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
        loading: () => const LoadingWidget(),
        error: (error, stack) => FailedWidget(error: error.toString()));
  }
}
