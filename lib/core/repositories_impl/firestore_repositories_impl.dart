import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/feed/data/models/comment_model.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:uuid/uuid.dart';

class FirestoreRepositoriesImpl implements FirestoreRepositories {
  @override
  Future<PostEntity> uploadPost(
      {required String userId,
      required String username,
      required String profileImageUrl,
      required Uint8List postImage,
      required String description}) async {
    // upload post image to storage
    final String postUrl = await sl
        .get<StorageRepositories>()
        .uploadImage(folderName: 'posts', image: postImage, isPost: true);

    // generate id for post
    final String postId = const Uuid().v1();

    // create post model
    PostModel post = PostModel((b) => b
      ..userId = userId
      ..postId = postId
      ..username = username
      ..profileImageUrl = profileImageUrl
      ..postUrl = postUrl
      ..description = description
      ..publishedDate = DateTime.now().toString()
      ..comments = ListBuilder()
      ..likes = ListBuilder());

    // add post to firestore
    await sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .doc(postId)
        .set(post.toMap());

    // add post id to user posts
    await sl.get<FirebaseFirestore>().collection('users').doc(userId).update({
      'posts': FieldValue.arrayUnion([postId])
    });

    return post;
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
  Future<String> deletePost(
      {required String postId, required String userId}) async {
    await sl.get<FirebaseFirestore>().collection('posts').doc(postId).delete();
    await sl.get<FirebaseFirestore>().collection('users').doc(userId).update({
      'posts': FieldValue.arrayRemove([postId])
    });
    return postId;
  }

  @override
  Future<void> postComment(
      {required String postId,
      required String commentText,
      required String userId,
      required String username,
      required String profileImageUrl}) async {
    // create unique id for comment
    final commentId = const Uuid().v1();

    // create comment model
    final comment = CommentModel((b) => b
      ..postId = postId
      ..userId = userId
      ..username = username
      ..profileImageUrl = profileImageUrl
      ..commentId = commentId
      ..commentText = commentText
      ..publishedDate = DateTime.now().toString()
      ..likes = ListBuilder());

    // add comment to post comments
    await sl.get<FirebaseFirestore>().collection('posts').doc(postId).update({
      'comments': FieldValue.arrayUnion([commentId])
    });

    // upload comment to firestore
    await sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .set(comment.toMap());
  }

  @override
  Future<void> followUser(
      {required String userId, required String followId}) async {
    final fireStore = sl.get<FirebaseFirestore>();
    final snapshot = await fireStore.collection('users').doc(userId).get();
    final List following = snapshot.data()!['following'];

    if (following.contains(followId)) {
      await fireStore.collection('users').doc(userId).update({
        'following': FieldValue.arrayRemove([followId])
      });
      await fireStore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayRemove([userId])
      });
    } else {
      await fireStore.collection('users').doc(userId).update({
        'following': FieldValue.arrayUnion([followId])
      });
      await fireStore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayUnion([userId])
      });
    }
  }
}
