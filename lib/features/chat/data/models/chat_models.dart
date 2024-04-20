library chat_models;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/serializers/serializers.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';

part 'chat_models.g.dart';

abstract class ChatModel
    implements ChatEntity, Built<ChatModel, ChatModelBuilder> {
  // fields go here
  @override
  String get chatId;
  @override
  String get username;
  @override
  String get profileImageUrl;
  @override
  BuiltList<MessageEntity> get comments;

  ChatModel._();

  factory ChatModel([Function(ChatModelBuilder b) updates]) = _$ChatModel;

  Map<String, dynamic> toMap() {
    return serializers.serializeWith(ChatModel.serializer, this)
        as Map<String, dynamic>;
  }

  static ChatEntity fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return serializers.deserializeWith(ChatModel.serializer, data)!;
  }

  static Serializer<ChatModel> get serializer => _$chatModelSerializer;
}
