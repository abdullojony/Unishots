import 'dart:typed_data';

import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/feed/domain/entities/comment_entity.dart';
import 'package:instagram_clone/features/feed/domain/entities/post_entity.dart';

abstract class FirestoreRepositories {
  Future<PostEntity> uploadPost(
      {required String userId,
      required String username,
      required String profileImageUrl,
      required Uint8List postImage,
      required String description});

  Future<void> updatePost(
      {required String postId, required String description});

  Future<void> likePost(
      {required String postId, required String userId, required bool isLiked});

  Future<void> savePost({
    required String postId,
    required String userId,
    required bool isSaved,
  });

  Future<String> deletePost(
      {required String postId,
      required String postUrl,
      required String userId});

  Future<CommentEntity> postComment(
      {required String postId,
      required String commentText,
      required String userId,
      required String username,
      required String profileImageUrl});

  Future<void> deleteComment({
    required String postId,
    required String commentId,
  });

  Future<ChatEntity> createChat({
    required String userId,
    required String chatId,
    required String username,
    required String profileImageUrl,
  });

  Future<void> deleteChat({
    required String userId,
    required ChatEntity chat,
    required bool deleteForBoth,
  });

  Future<MessageEntity> sendMessage({
    required String senderId,
    required String receiverId,
    required String content,
    required String userImage,
    required String username,
  });

  Future<void> readChat({required String chatId});

  Future<void> followUser(
      {required String userId,
      required String followId,
      required bool isFollowing});

  Future<void> updateInfo(
      {required String userId,
      required String bio,
      required String profileImageUrl,
      Uint8List? profileImage});
}
