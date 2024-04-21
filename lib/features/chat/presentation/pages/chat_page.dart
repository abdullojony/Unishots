import 'package:flutter/material.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/chat_messages.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/message_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage(this.chat, {super.key});
  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              chat.profileImageUrl,
            ),
            radius: 14,
          ),
          const SizedBox(width: 10),
          Text(chat.username),
        ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatMessages(chat),
          ),
          MessageInput(chat),
        ],
      ),
    );
  }
}
