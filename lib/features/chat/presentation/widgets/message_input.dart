import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:styled_widget/styled_widget.dart';

class MessageInput extends HookWidget {
  const MessageInput(this.chat, {super.key});
  final ChatEntity chat;

  @override
  Widget build(BuildContext context) {
    final user = context
        .dependOnInheritedWidgetOfExactType<HomeResources>()!
        .currentUser;
    final messageController = useTextEditingController(text: '');
    final request = useState<Future?>(null);
    final snapshot = useFuture(request.value);

    void sendMessage() {
      if (messageController.text.isNotEmpty) {
        request.value = sl
            .get<FirestoreRepositories>()
            .sendMessage(
                userImage: user.profileImage,
                senderId: user.userId,
                receiverId: chat.chatId,
                username: user.username,
                content: messageController.text)
            .then((value) => messageController.clear(),
                onError: (error) => sl
                    .get<CoreRepositories>()
                    .showSnackBar(context, message: error.toString()));
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 1, bottom: 14),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: (m) => sendMessage(),
              controller: messageController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: const InputDecoration(labelText: 'Send a message...'),
            ),
          ),
          IconButton(
            color: Theme.of(context).colorScheme.primary,
            icon: snapshot.connectionState != ConnectionState.waiting
                ? const Icon(
                    Icons.send,
                  )
                : const CircularProgressIndicator().width(25).height(25),
            onPressed: sendMessage,
          ),
        ],
      ),
    );
  }
}
