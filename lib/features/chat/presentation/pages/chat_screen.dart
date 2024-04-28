import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/chat/data/models/chat_models.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:instagram_clone/features/chat/presentation/pages/chat_page.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/chat_item.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_page.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  Future<int> countUnreadMessages(List<QueryDocumentSnapshot> docs) async {
    num n = 0;
    for (int i = 0; i < docs.length; i++) {
      n += docs[i]['unreadCount'];
    }
    return n.toInt();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goToFirst =
        context.dependOnInheritedWidgetOfExactType<HomeResources>()!.goToFirst;

    final chatStream = ref.watch(chatStreamProvider);

    void openChat(ChatEntity chat) {
      goToFirst(TabItem.chats);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ChatPage(chat)));
    }

    void updateUnreadMessages(List<QueryDocumentSnapshot> docs) async {
      final count = await countUnreadMessages(docs);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(unreadMessagesProvider.notifier).update((state) => count);
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Chats').fontWeight(FontWeight.bold),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const SearchPage())),
          ),
        ],
      ),
      body: chatStream.when(
          data: (chats) {
            if (ref.read(openChatProvider) == null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(openChatProvider.notifier).update((state) => openChat);
              });
            }

            final docs = chats.docs;

            updateUnreadMessages(docs);

            return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) =>
                    ChatItem(ChatModel.fromDocument(docs[index])));
          },
          error: (error, stack) => FailedWidget(error: error.toString()),
          loading: () => const LoadingWidget()),
    );
  }
}
