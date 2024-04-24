import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';

abstract class FirestoreRepositories {
  Future<PostEntity> uploadPost(
      {required String userId,
      required String username,
      required String profileImageUrl,
      required Uint8List postImage,
      required String description});

  Future<void> likePost(
      {required String postId,
      required String userId,
      required BuiltSet likes});

  Future<String> deletePost({required String postId, required String userId});

  Future<void> postComment(
      {required String postId,
      required String commentText,
      required String userId,
      required String username,
      required String profileImageUrl});

  Future<ChatEntity> createChat({
    required String userId,
    required String chatId,
    required String username,
    required String profileImageUrl,
  });

  Future<void> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
    required String userImage,
    required String username,
  });

  Future<void> followUser(
      {required String userId,
      required String followId,
      required bool isFollowing});

  Future<void> updateInfo(
      {required String userId,
      required String username,
      required bool usernameChanged,
      required String bio,
      required String profileImageUrl,
      Uint8List? profileImage});
}
