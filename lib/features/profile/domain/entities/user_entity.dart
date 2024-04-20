import 'package:built_collection/built_collection.dart';

abstract class UserEntity {
  String get userId;
  String get username;
  String get email;
  String get photoUrl;
  String get bio;
  BuiltList<String> get posts;
  BuiltList<String> get followers;
  BuiltList<String> get following;
}
