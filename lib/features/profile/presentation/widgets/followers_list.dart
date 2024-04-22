import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/user_list_item.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowersList extends ConsumerWidget {
  const FollowersList(this.followers, {super.key});
  final Set<String> followers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followerStream = ref.watch(followerStreamProvider(followers));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Followers').fontSize(18).fontWeight(FontWeight.bold),
      ),
      body: followerStream.when(
          data: (followers) => ListView.builder(
              itemCount: followers.docs.length,
              itemBuilder: (context, index) =>
                  UserListItem(UserModel.fromDocument(followers.docs[index]))),
          error: (error, stack) => FailedWidget(error: error.toString()),
          loading: () => const LoadingWidget()),
    );
  }
}
