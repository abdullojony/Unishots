import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/home/data/riverpod/home_provider.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/following_list.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowingPage extends ConsumerWidget {
  const FollowingPage(this.userId, {super.key});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userStreamProvider(userId));
    return userStream.when(
        data: (users) {
          final following = users.docs.first['following'];
          if (following.isNotEmpty) {
            return FollowingList(Set<String>.from(following));
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Following')
                    .fontSize(18)
                    .fontWeight(FontWeight.bold),
              ),
              body: Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Follow users to see them here'),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    child: const Text('Explore')
                        .textColor(Theme.of(context).primaryColorDark),
                    onPressed: () => ref
                        .read(currentTabNotifierProvider.notifier)
                        .update((state) => TabItem.search),
                  ),
                ],
              )),
            );
          }
        },
        loading: () => const LoadingWidget(),
        error: (error, s) => FailedWidget(error: error.toString()));
  }
}
