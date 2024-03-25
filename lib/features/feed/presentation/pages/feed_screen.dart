import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/instagram_logo.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:ionicons/ionicons.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const InstagramLogo(height: 32),
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.chatbubble_ellipses_outline,
              size: 28,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder(
        stream: sl.get<FirebaseFirestore>().collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => PostCard(
              postData: PostModel.fromDocument(snapshot.data!.docs[index]),
            ),
          );
        },
      ),
    );
  }
}
