import 'package:built_collection/built_collection.dart';

abstract class PostEntity {
  String get userId;
  String get postId;
  String get username;
  String get profileImageUrl;
  String get postUrl;
  String get description;
  String get publishedDate;
  int get comments;
  BuiltSet<String> get likes;
  BuiltSet<String> get savedBy;
}
