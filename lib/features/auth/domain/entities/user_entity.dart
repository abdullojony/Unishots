import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_entity.g.dart';

abstract class UserEntity {
  String get userId;
  String get username;
  String get email;
  String get profileImage;
  String get bio;
  BuiltList<PostItem> get posts;
  BuiltSet<String> get savedPosts;
  BuiltSet<String> get followers;
  BuiltSet<String> get following;
}

abstract class PostItem implements Built<PostItem, PostItemBuilder> {
  // fields go here
  String get id;
  String get image;

  PostItem._();

  factory PostItem([Function(PostItemBuilder b) updates]) = _$PostItem;
  static Serializer<PostItem> get serializer => _$postItemSerializer;
}
