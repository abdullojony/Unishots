import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/post_grid.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/saved_posts_grid.dart';

class UserTabs extends ConsumerWidget {
  const UserTabs(this.posts, this.savedSet, {super.key});
  final BuiltList<PostItem> posts;
  final BuiltSet<String> savedSet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedPosts = ref.watch(savedPostsProvider(savedSet));

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              indicatorColor: Theme.of(context).primaryColorDark,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 1,
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.grid_on_outlined,
                  color: Theme.of(context).primaryColorDark,
                )),
                Tab(
                    icon: Icon(
                  Icons.bookmark_outline,
                  color: Theme.of(context).primaryColorDark,
                )),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // User posts tab
              SingleChildScrollView(child: PostGrid(posts)),

              // Saved posts tab
              savedPosts.when(
                data: (posts) => posts == null || posts.docs.isEmpty
                    ? const Center(child: Text('No saved posts.'))
                    : SavedPostsGrid(posts.docs),
                loading: () => const LoadingWidget(),
                error: (error, stackTrace) =>
                    FailedWidget(error: error.toString()),
              )
            ],
          )),
    );
  }
}
