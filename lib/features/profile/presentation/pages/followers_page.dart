import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/widgets/followers_list.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowersPage extends ConsumerWidget {
  const FollowersPage(this.userId, {super.key});
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = ref.watch(userStreamProvider(userId));
    return userStream.when(
        data: (users) {
          final followers = users.docs.first['followers'];
          if (followers.isNotEmpty) {
            return FollowersList(Set.from(followers));
          } else {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Followers')
                    .fontSize(18)
                    .fontWeight(FontWeight.bold),
              ),
              body: const Center(child: Text('No followers yet')),
            );
          }
        },
        loading: () => const LoadingWidget(),
        error: (error, s) => FailedWidget(error: error.toString()));
  }
}
