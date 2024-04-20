import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/profile/presentation/riverpod/profile_provider.dart';

class CurrentUserPosts extends ConsumerWidget {
  const CurrentUserPosts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPosts = ref.watch(userProvider);

    return userPosts.when(
        data: (posts) => GridView.builder(
              shrinkWrap: true,
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 1.5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: Image(
                    image: NetworkImage(posts[index].postUrl),
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
        loading: () => const LoadingWidget(),
        error: (error, stack) => FailedWidget(error: error.toString()));
  }
}
