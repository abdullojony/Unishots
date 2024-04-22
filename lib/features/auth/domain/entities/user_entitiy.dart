import 'package:built_collection/built_collection.dart';

abstract class UserEntity {
  String get userId;
  String get username;
  String get email;
  String get profileImage;
  String get bio;
  BuiltSet<String> get posts;
  BuiltSet<String> get followers;
  BuiltSet<String> get following;
}
