library user_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/serializers/serializers.dart';
import 'package:instagram_clone/features/profile/domain/entities/user_entity.dart';

part 'user_model.g.dart';

abstract class UserModel
    implements UserEntity, Built<UserModel, UserModelBuilder> {
  // fields go here
  @override
  String get email;
  @override
  String get uid;
  @override
  String get photoUrl;
  @override
  String get username;
  @override
  String get bio;
  @override
  BuiltList get followers;
  @override
  BuiltList get following;

  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;

  String toJson() {
    return json.encode(serializers.serializeWith(UserModel.serializer, this));
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(UserModel.serializer, this)
        as Map<String, dynamic>;
  }

  static UserModel fromJson(Map<String, dynamic> map) {
    return serializers.deserializeWith(UserModel.serializer, map)!;
  }

  static UserEntity fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return UserModel((b) => b
      ..email = data['email']
      ..username = data['username']
      ..photoUrl = data['photoUrl']
      ..uid = data['uid']
      ..bio = data['bio']
      ..followers = ListBuilder(data['followers'])
      ..following = ListBuilder(data['following']));
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
