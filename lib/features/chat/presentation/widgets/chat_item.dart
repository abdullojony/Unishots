import 'package:flutter/material.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/chat/presentation/pages/chat_page.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(this.chat, {super.key});
  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ChatPage(chat))),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          chat.profileImageUrl,
        ),
        radius: 16,
      ),
      title: Text(
        chat.username,
      ),
    );
  }
}
