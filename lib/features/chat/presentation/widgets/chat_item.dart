import 'package:flutter/material.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/chat/presentation/pages/chat_page.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/delete_chat_dialog.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(this.chat, {super.key});
  final ChatEntity chat;

  void deleteChat(BuildContext context) {
    final currentUserId = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser
        .userId;
    showDialog(
        context: context,
        builder: (ctx) => DeleteChatDialog(chat, currentUserId));
  }

  void showPopupMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;

    final Offset buttonPosition = button.localToGlobal(Offset.zero);
    final Size buttonSize = button.size;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double dy = buttonPosition.dy + buttonSize.height;
    final double dx = buttonPosition.dx;

    final RelativeRect position = RelativeRect.fromLTRB(
      dx,
      dy,
      MediaQuery.of(context).size.width,
      screenHeight,
    );

    await showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          onTap: () => deleteChat(context),
          child: const Text('Delete'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => showPopupMenu(context),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ChatPage(chat)));
        if (chat.unreadCount != 0) {
          sl.get<FirestoreRepositories>().readChat(chatId: chat.chatId);
        }
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          chat.profileImageUrl,
        ),
        radius: 16,
      ),
      title: Text(
        chat.username,
      ),
      trailing: chat.unreadCount > 0
          ? Badge(label: Text('${chat.unreadCount}'))
          : null,
    );
  }
}
