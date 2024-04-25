import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/empty_page.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/user_list_item.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowingPage extends ConsumerWidget {
  const FollowingPage(this.following, {super.key});
  final Set<String> following;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingUsers = ref.watch(followingUsersProvider(following));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Following').fontSize(18).fontWeight(FontWeight.bold),
      ),
      body: followingUsers.when(
          data: (users) => users != null
              ? ListView.builder(
                  itemCount: users.docs.length,
                  itemBuilder: (context, index) =>
                      UserListItem(UserModel.fromDocument(users.docs[index])))
              : const EmptyPage('Follow users to see them here'),
          error: (error, stack) => FailedWidget(error: error.toString()),
          loading: () => const LoadingWidget()),
    );
  }
}
