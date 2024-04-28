import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/post_grid.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/profile_header.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/profile_tabbar.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/saved_posts_grid.dart';
import 'package:styled_widget/styled_widget.dart';

class CurrentProfilePage extends ConsumerWidget {
  const CurrentProfilePage(this.user, {super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedPosts = ref.watch(savedPostsProvider(user.savedPosts));

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username).fontWeight(FontWeight.bold),
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ProfileHeader(user, true)),
            const ProfileTabbar(),
            SliverFillRemaining(
                child: TabBarView(
              children: [
                // User posts tab
                PostGrid(user.posts),

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
          ],
        ),
      ),
    );
  }
}
