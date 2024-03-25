import 'package:built_collection/built_collection.dart';

abstract class CommentEntity {
  String get postId;
  String get commentId;
  String get userId;
  String get username;
  String get commentText;
  String get profileImageUrl;
  String get publishedDate;
  BuiltList<String> get likes;
}
