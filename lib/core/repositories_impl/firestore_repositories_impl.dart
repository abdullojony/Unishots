import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/chat/data/models/chat_models.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/feed/data/models/comment_model.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';
import 'package:uuid/uuid.dart';

class FirestoreRepositoriesImpl implements FirestoreRepositories {
  final FirebaseFirestore firestore;

  FirestoreRepositoriesImpl(this.firestore);

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
      ..likes = SetBuilder());

    // add post to firestore
    await firestore.collection('posts').doc(postId).set(post.toMap());

    // add post id to user posts
    await firestore.collection('users').doc(userId).update({
      'posts': FieldValue.arrayUnion([postId])
    });

    return post;
  }

  @override
  Future<void> likePost(
      {required String postId,
      required String userId,
      required BuiltSet likes}) async {
    if (likes.contains(userId)) {
      // if the likes list contains the userId, we need to remove it
      await firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayRemove([userId])
      });
    } else {
      // else we need to add userId to the likes array
      await firestore.collection('posts').doc(postId).update({
        'likes': FieldValue.arrayUnion([userId])
      });
    }
  }

  @override
  Future<String> deletePost(
      {required String postId, required String userId}) async {
    await firestore.collection('posts').doc(postId).delete();
    await firestore.collection('users').doc(userId).update({
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
    await firestore.collection('posts').doc(postId).update({
      'comments': FieldValue.arrayUnion([commentId])
    });

    // upload comment to firestore
    await firestore
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(commentId)
        .set(comment.toMap());
  }

  @override
  Future<void> followUser(
      {required String userId,
      required String followId,
      required bool isFollowing}) async {
    if (isFollowing) {
      await firestore.collection('users').doc(userId).update({
        'following': FieldValue.arrayRemove([followId])
      });
      await firestore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayRemove([userId])
      });
    } else {
      await firestore.collection('users').doc(userId).update({
        'following': FieldValue.arrayUnion([followId])
      });
      await firestore.collection('users').doc(followId).update({
        'followers': FieldValue.arrayUnion([userId])
      });
    }
  }

  @override
  Future<ChatEntity> createChat(
      {required String userId,
      required String chatId,
      required String username,
      required String profileImageUrl}) async {
    // create a chat model
    final chat = ChatModel((b) => b
      ..chatId = chatId
      ..username = username
      ..profileImageUrl = profileImageUrl);

    // upload chat model to firestore
    await firestore
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(chatId)
        .set(chat.toMap());

    return chat;
  }

  @override
  Future<void> sendMessage(
      {required String senderId,
      required String receiverId,
      required String username,
      required String userImage,
      required String content}) async {
    // create a message id
    final id = const Uuid().v1();

    // create a message model
    final message = MessageModel((b) => b
      ..messageId = id
      ..senderId = senderId
      ..receiverId = receiverId
      ..content = content
      ..userImage = userImage
      ..username = username
      ..created = DateTime.now().toString());

    // upload message to firestore
    await firestore
        .collection('users')
        .doc(senderId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .doc(id)
        .set(message.toMap());

    final receiver = firestore
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(senderId);

    await receiver.set({
      'chatId': senderId,
      'profileImageUrl': userImage,
      'username': username
    });

    await receiver.collection('messages').doc(id).set(message.toMap());
  }

  @override
  Future<void> updateInfo(
      {required String userId,
      required String username,
      required bool usernameChanged,
      required String bio,
      required String profileImageUrl,
      Uint8List? profileImage}) async {
    if (usernameChanged) {
      // check if username exist
      final duplicates = await sl
          .get<FirebaseFirestore>()
          .collection('users')
          .where('username', isEqualTo: username)
          .get();

      if (duplicates.docs.isNotEmpty) {
        throw Exception('Username already exist');
      }
    }

    if (profileImage != null) {
      // upload profileImage to storage
      profileImageUrl = await sl.get<StorageRepositories>().uploadImage(
          folderName: 'profilePics', image: profileImage, isPost: false);
    }

    await firestore.collection('users').doc(userId).update({
      'username': username,
      'bio': bio,
      'profileImage': profileImageUrl,
    });
  }
}
