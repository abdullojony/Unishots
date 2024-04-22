import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/chat/data/models/chat_models.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';
import 'package:instagram_clone/features/chat/presentation/pages/chat_page.dart';
import 'package:instagram_clone/features/chat/presentation/widgets/chat_item.dart';
import 'package:instagram_clone/features/home/presentation/pages/home_screen.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goToFirst =
        context.dependOnInheritedWidgetOfExactType<HomeResources>()!.goToFirst;
    final chatStream = ref.watch(chatStreamProvider);
    final chatNotifier = ref.watch(chatNotifierProvider);

    if (chatNotifier != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        goToFirst(TabItem.chats);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => ChatPage(chatNotifier)));
        ref.read(chatNotifierProvider.notifier).update((state) => null);
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Chats').fontWeight(FontWeight.bold),
        actions: [const Icon(Icons.add_circle_outline).padding(right: 10)],
      ),
      body: chatStream.when(
          data: (chats) => ListView.builder(
              itemCount: chats.docs.length,
              itemBuilder: (context, index) =>
                  ChatItem(ChatModel.fromDocument(chats.docs[index]))),
          error: (error, stack) => FailedWidget(error: error.toString()),
          loading: () => const LoadingWidget()),
    );
  }
}
