import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/features/profile/presentation/pages/post_page.dart';
import 'package:styled_widget/styled_widget.dart';

class SavedPostsGrid extends StatelessWidget {
  const SavedPostsGrid(this.savedPosts, {super.key});
  final List<QueryDocumentSnapshot> savedPosts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: savedPosts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 1.5,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return SizedBox(
          child: Image.network(savedPosts[index]['postUrl'], fit: BoxFit.cover),
        ).gestures(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => PostPage(savedPosts[index]['postId']))));
      },
    );
  }
}
