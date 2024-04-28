import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/user_list_item.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowersPage extends ConsumerWidget {
  const FollowersPage(this.followers, {super.key});
  final Set<String> followers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followerUsers = ref.watch(followerUsersProvider(followers));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Followers').fontSize(18).fontWeight(FontWeight.bold),
      ),
      body: followerUsers.when(
          data: (users) => users == null || users.docs.isEmpty
              ? const Center(child: Text('No followers yet'))
              : ListView.builder(
                  itemCount: users.docs.length,
                  itemBuilder: (context, index) =>
                      UserListItem(users.docs[index])),
          error: (error, stack) => FailedWidget(error: error.toString()),
          loading: () => const LoadingWidget()),
    );
  }
}
