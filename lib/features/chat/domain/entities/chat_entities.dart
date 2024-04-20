import 'package:built_collection/built_collection.dart';

abstract class ChatEntity {
  String get chatId;
  String get username;
  String get profileImageUrl;
  BuiltList<MessageEntity> get comments;
}

abstract class MessageEntity {
  String get messageId;
  String get sourceUserId;
  String get destinationUserId;
  String get content;
  String get created;
}
