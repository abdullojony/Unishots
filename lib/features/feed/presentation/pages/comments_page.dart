import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/data/models/comment_model.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/comment_card.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';

class CommentsPage extends HookWidget {
  const CommentsPage(this.postId, this.comments, {super.key});
  final String postId;
  final List<QueryDocumentSnapshot> comments;

  @override
  Widget build(BuildContext context) {
    final currentUser = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser;
    final commentController = useTextEditingController(text: '');

    void postComment() {
      if (commentController.text.isNotEmpty) {
        sl.get<FirestoreRepositories>().postComment(
              postId: postId,
              userId: currentUser.userId,
              username: currentUser.username,
              profileImageUrl: currentUser.profileImage,
              commentText: commentController.text,
            );
      }

      commentController.clear();
    }

    return Scaffold(
      body: comments.isNotEmpty
          ? ListView.builder(
              itemCount: comments.length,
              itemBuilder: (ctx, index) => CommentCard(
                  comment: CommentModel.fromDocument(comments[index]),
                  isCurrentuser:
                      currentUser.userId == comments[index]['userId']))
          : const Center(child: Text('No comments yet.')),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(currentUser.profileImage),
                radius: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    onSubmitted: (value) => postComment(),
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Comment as ${currentUser.username}',
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
