import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/feed/presentation/riverpod/feed_provider.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_page.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<QuerySnapshot> posts = ref.watch(postStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          readOnly: true,
          canRequestFocus: false,
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SearchPage())),
          decoration: const InputDecoration(labelText: 'Search for a user...'),
        ),
      ),
      body: posts.when(
          data: (value) => MasonryGridView.count(
                crossAxisCount: 3,
                itemCount: value.docs.length,
                itemBuilder: (context, index) => Image.network(
                  value.docs[index]['postUrl'],
                  fit: BoxFit.cover,
                ),
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
          loading: () => const LoadingWidget(),
          error: (error, stack) => FailedWidget(error: error.toString())),
    );
  }
}
