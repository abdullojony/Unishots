import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/chat/data/models/chat_models.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/message_bubble.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';

class ChatMessages extends ConsumerWidget {
  const ChatMessages(this.chat, {super.key});
  final ChatEntity chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user =
        context.dependOnInheritedWidgetOfExactType<HomeResources>()!.user;
    final messageStream =
        ref.watch(MessageStreamProvider(user.userId, chat.chatId));

    return messageStream.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => FailedWidget(error: error.toString()),
      data: (messages) => ListView.builder(
        padding: const EdgeInsets.only(
          bottom: 40,
          left: 13,
          right: 13,
        ),
        reverse: true,
        itemCount: messages.docs.length,
        itemBuilder: (ctx, index) {
          final message = MessageModel.fromDocument(messages.docs[index]);
          final nextChatMessage = index + 1 < messages.docs.length
              ? messages.docs[index + 1].data()
              : null;
          final nextMessageUserId =
              nextChatMessage != null ? nextChatMessage['senderId'] : null;
          final nextUserIsSame = nextMessageUserId == message.senderId;

          if (nextUserIsSame) {
            return MessageBubble.next(
              message: message.content,
              isMe: message.senderId == user.userId,
            );
          } else {
            return MessageBubble.first(
              userImage: message.userImage,
              username: message.username,
              message: message.content,
              isMe: message.senderId == user.userId,
            );
          }
        },
      ),
    );
  }
}
