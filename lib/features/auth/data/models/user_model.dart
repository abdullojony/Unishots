library user_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/serializers/serializers.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

abstract class UserModel
    implements UserEntity, Built<UserModel, UserModelBuilder> {
  // fields go here
  @override
  String get userId;
  @override
  String get username;
  @override
  String get email;
  @override
  String get profileImage;
  @override
  String get bio;
  @override
  BuiltList<PostItem> get posts;
  @override
  BuiltSet<String> get savedPosts;
  @override
  BuiltSet<String> get followers;
  @override
  BuiltSet<String> get following;

  UserModel._();

  factory UserModel([Function(UserModelBuilder b) updates]) = _$UserModel;

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(UserModel.serializer, this)
        as Map<String, dynamic>;
  }

  static UserEntity fromDocument(DocumentSnapshot doc) {
    return serializers.deserializeWith(
        UserModel.serializer, doc.data() as Map<String, dynamic>)!;
  }

  static Serializer<UserModel> get serializer => _$userModelSerializer;
}
