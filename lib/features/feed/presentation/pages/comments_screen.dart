import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/data/models/comment_model.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/comment_card.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:styled_widget/styled_widget.dart';

class CommentsScreen extends HookWidget {
  const CommentsScreen({super.key, required this.postId});
  final String postId;

  @override
  Widget build(BuildContext context) {
    final user =
        context.dependOnInheritedWidgetOfExactType<HomeResources>()!.user;
    final commentController = useTextEditingController(text: '');

    void postComment() {
      sl.get<FirestoreRepositories>().postComment(
            postId: postId,
            userId: user.userId,
            username: user.username,
            profileImageUrl: user.profileImage,
            commentText: commentController.text,
          );

      commentController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments').fontSize(18).fontWeight(FontWeight.bold),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: sl
            .get<FirebaseFirestore>()
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .orderBy('publishedDate', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => CommentCard(
              comment: CommentModel.fromDocument(snapshot.data!.docs[index]),
            ),
          );
        },
      ),
      // text input
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.profileImage),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    onSubmitted: (value) => postComment(),
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${user.username}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: postComment,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Text(
                    'Post',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
