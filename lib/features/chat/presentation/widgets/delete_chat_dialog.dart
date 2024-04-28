import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';
import 'package:styled_widget/styled_widget.dart';

class DeleteChatDialog extends HookWidget {
  const DeleteChatDialog(this.chat, this.userId, {super.key});
  final ChatEntity chat;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final deleteForBoth = useState<bool>(false);

    return AlertDialog(
      title: const Text('Do you want to delete the chat?').fontSize(18),
      content: ListTile(
        title: Text('Also delete for ${chat.username}'),
        trailing: Checkbox(
          value: deleteForBoth.value,
          onChanged: (value) {
            deleteForBoth.value = value!;
          },
        ),
      ),
      actions: [
        TextButton(
            child: const Text('Cancel').textColor(Colors.red),
            onPressed: () => Navigator.of(context).pop()),
        TextButton(
            onPressed: () {
              sl.get<FirestoreRepositories>().deleteChat(
                    userId: userId,
                    chat: chat,
                    deleteForBoth: deleteForBoth.value,
                  );
              Navigator.of(context).pop();
            },
            child: const Text('Delete')),
      ],
    );
  }
}
