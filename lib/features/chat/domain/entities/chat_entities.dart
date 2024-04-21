abstract class ChatEntity {
  String get chatId;
  String get username;
  String get profileImageUrl;
}

abstract class MessageEntity {
  String get messageId;
  String get senderId;
  String get receiverId;
  String get content;
  String get userImage;
  String get username;
  String get created;
}
