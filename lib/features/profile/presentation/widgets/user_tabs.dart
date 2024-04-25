import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/post_grid.dart';

class UserTabs extends ConsumerWidget {
  const UserTabs(this.posts, this.savedPosts, {super.key});
  final BuiltList<PostItem> posts;
  final BuiltList<PostItem> savedPosts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              PostGrid(posts, true),

              // Saved posts tab
              PostGrid(savedPosts, false),
            ],
          )),
    );
  }
}
