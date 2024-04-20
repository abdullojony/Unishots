import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Username').fontWeight(FontWeight.bold),
        actions: [const Icon(Icons.add_circle_outline).padding(right: 10)],
      ),
    );
  }
}
