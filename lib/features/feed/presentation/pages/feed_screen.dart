import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/auth/presentation/widgets/instagram_logo.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/feed/presentation/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/feed/presentation/widgets/post_card.dart';
import 'package:ionicons/ionicons.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<QuerySnapshot> posts = ref.watch(postStreamProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const InstagramLogo(height: 32),
        actions: [
          IconButton(
            icon: Icon(
              Ionicons.heart_outline,
              size: 28,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: posts.when(
          data: (value) => ListView.builder(
                itemCount: value.docs.length,
                itemBuilder: (ctx, index) => PostCard(
                  postData: PostModel.fromDocument(value.docs[index]),
                ),
              ),
          loading: () => const LoadingWidget(),
          error: (error, stack) => FailedWidget(error: error.toString())),
    );
  }
}
