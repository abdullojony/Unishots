import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/profile/data/riverpod/profile_provider.dart';
import 'package:instagram_clone/features/profile/presentation/pages/post_page.dart';
import 'package:styled_widget/styled_widget.dart';

class UserPosts extends ConsumerWidget {
  const UserPosts(
      {required this.userId, required this.isCurrentUser, super.key});
  final String userId;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postStream = ref.watch(userPostStreamProvider(userId));

    return postStream.when(
        data: (userPosts) => GridView.builder(
              shrinkWrap: true,
              itemCount: userPosts.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 1.5,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  child: isCurrentUser
                      ? CachedNetworkImage(
                          imageUrl: userPosts.docs[index]['postUrl'],
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 200),
                          fadeOutDuration: const Duration(milliseconds: 200),
                        )
                      : Image.network(userPosts.docs[index]['postUrl'],
                          fit: BoxFit.cover),
                ).gestures(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => PostPage(
                            PostModel.fromDocument(userPosts.docs[index])))));
              },
            ),
        loading: () => const LoadingWidget(),
        error: (error, stack) => FailedWidget(error: error.toString()));
  }
}
