import 'package:built_collection/built_collection.dart';

abstract class UserEntity {
  String get email;
  String get uid;
  String get photoUrl;
  String get username;
  String get bio;
  BuiltList get followers;
  BuiltList get following;
}
