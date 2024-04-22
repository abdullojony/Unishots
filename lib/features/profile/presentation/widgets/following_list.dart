import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/core/widgets/user_list_item.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:styled_widget/styled_widget.dart';

class FollowingList extends ConsumerWidget {
  const FollowingList(this.following, {super.key});
  final Set<String> following;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingStream = ref.watch(followingStreamProvider(following));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Following').fontSize(18).fontWeight(FontWeight.bold),
      ),
      body: followingStream.when(
          data: (following) => ListView.builder(
              itemCount: following.docs.length,
              itemBuilder: (context, index) =>
                  UserListItem(UserModel.fromDocument(following.docs[index]))),
          error: (error, stack) => FailedWidget(error: error.toString()),
          loading: () => const LoadingWidget()),
    );
  }
}
