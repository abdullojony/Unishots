import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';
import 'package:instagram_clone/features/profile/presentation/pages/post_page.dart';
import 'package:styled_widget/styled_widget.dart';

class PostGrid extends StatelessWidget {
  const PostGrid(this.posts, this.cacheImages, {super.key});
  final BuiltList<PostItem> posts;
  final bool cacheImages;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 2),
      shrinkWrap: true,
      itemCount: posts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 1.5,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        index = posts.length - index - 1;
        return SizedBox(
          child: cacheImages
              ? CachedNetworkImage(
                  imageUrl: posts[index].image,
                  fit: BoxFit.cover,
                  fadeInDuration: const Duration(milliseconds: 200),
                  fadeOutDuration: const Duration(milliseconds: 200),
                )
              : Image.network(posts[index].image, fit: BoxFit.cover),
        ).gestures(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => PostPage(posts[index].id))));
      },
    );
  }
}
