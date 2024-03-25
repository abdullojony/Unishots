import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/data/models/comment_model.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:uuid/uuid.dart';

class FirestoreRepositoriesImpl implements FirestoreRepositories {
  @override
  Future<void> uploadPost(
      {required String userId,
      required String username,
      required String profileImageUrl,
      required Uint8List postImage,
      required String description}) async {
    final String postUrl = await sl
        .get<StorageRepositories>()
        .uploadImage(folderName: 'posts', image: postImage, isPost: true);

    final String postId = const Uuid().v1();
    PostModel post = PostModel((b) => b
      ..userId = userId
      ..postId = postId
      ..username = username
      ..profileImageUrl = profileImageUrl
      ..postUrl = postUrl
      ..description = description
      ..publishedDate = DateTime.now().toString()
      ..likes = ListBuilder());

    await sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .doc(postId)
        .set(post.toMap());
  }

  @override
  Future<void> likePost(
      {required String postId,
      required String userId,
      required List likes}) async {
    final fireStore = sl.get<FirebaseFirestore>();
    if (likes.contains(userId)) {
      // if the likes list contains the userId, we need to remove it
      await fireStore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([userId])
      });
    } else {
      // else we need to add userId to the likes array
      await fireStore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([userId])
      });
    }
  }

  @override
  Future<void> deletePost({required String postId}) async {
    await sl.get<FirebaseFirestore>().collection('posts').doc(postId).delete();
  }

  @override
  Future<void> postComment(
      {required String postId,
      required String commentText,
      required String userId,
      required String username,
      required String profileImageUrl}) async {
    final commentId = Uuid().v1();

    final comment = CommentModel((b) => b
      ..postId = postId
      ..userId = userId
      ..username = username
      ..profileImageUrl = profileImageUrl
      ..commentId = commentId
      ..commentText = commentText
      ..publishedDate = DateTime.now().toString()
      ..likes = ListBuilder());

    await sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .set(comment.toMap());
  }
}
