library post_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/serializers/serializers.dart';
import 'package:instagram_clone/features/home/domain/entities/post_entity.dart';

part 'post_model.g.dart';

abstract class PostModel
    implements PostEntity, Built<PostModel, PostModelBuilder> {
  // fields go here
  @override
  String get userId;
  @override
  String get postId;
  @override
  String get username;
  @override
  String get profileImageUrl;
  @override
  String get postUrl;
  @override
  String get description;
  @override
  String get publishedDate;
  @override
  BuiltList get likes;

  PostModel._();

  factory PostModel([Function(PostModelBuilder b) updates]) = _$PostModel;

  String toJson() {
    return json.encode(serializers.serializeWith(PostModel.serializer, this));
  }

  static PostModel fromJson(Map<String, dynamic> map) {
    return serializers.deserializeWith(PostModel.serializer, map)!;
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(PostModel.serializer, this)
        as Map<String, dynamic>;
  }

  static PostEntity fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return PostModel((b) => b
      ..userId = data['userId']
      ..postId = data['postId']
      ..username = data['username']
      ..profileImageUrl = data['profileImageUrl']
      ..postUrl = data['postUrl']
      ..description = data['description']
      ..publishedDate = data['publishedDate']
      ..likes = ListBuilder(data['likes']));
  }

  static Serializer<PostModel> get serializer => _$postModelSerializer;
}
