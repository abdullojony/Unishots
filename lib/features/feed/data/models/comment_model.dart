library comment_model;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/serializers/serializers.dart';
import 'package:instagram_clone/features/feed/domain/entities/comment_entity.dart';

part 'comment_model.g.dart';

abstract class CommentModel
    implements CommentEntity, Built<CommentModel, CommentModelBuilder> {
  // fields go here
  @override
  String get postId;
  @override
  String get commentId;
  @override
  String get userId;
  @override
  String get username;
  @override
  String get commentText;
  @override
  String get profileImageUrl;
  @override
  String get publishedDate;
  @override
  BuiltList<String> get likes;

  CommentModel._();

  factory CommentModel([Function(CommentModelBuilder b) updates]) =
      _$CommentModel;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CommentModel.serializer, this));
  }

  static CommentModel fromJson(Map<String, dynamic> map) {
    return serializers.deserializeWith(CommentModel.serializer, map)!;
  }

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(CommentModel.serializer, this)
        as Map<String, dynamic>;
  }

  static CommentEntity fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return serializers.deserializeWith(CommentModel.serializer, data)!;
  }

  static Serializer<CommentModel> get serializer => _$commentModelSerializer;
}
