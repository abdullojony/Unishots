import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/chat/data/riverpod/chat_provider.dart';

class ChatIcon extends ConsumerWidget {
  const ChatIcon(this.icon, {super.key});
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadMessages = ref.watch(unreadMessagesProvider);

    return unreadMessages > 0
        ? Badge(
            label: Text("$unreadMessages"),
            offset: const Offset(5, -5),
            child: Icon(icon),
          )
        : Icon(icon);
  }
}
