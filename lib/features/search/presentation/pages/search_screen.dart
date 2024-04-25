import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/core/widgets/failed_widget.dart';
import 'package:instagram_clone/core/widgets/loading_widget.dart';
import 'package:instagram_clone/features/profile/presentation/pages/post_page.dart';
import 'package:instagram_clone/features/search/data/riverpod/search_provider.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_page.dart';
import 'package:styled_widget/styled_widget.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: TextFormField(
          readOnly: true,
          canRequestFocus: false,
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const SearchPage())),
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(0),
              labelText: '  Search for a user...',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder()),
        ).height(40),
      ),
      body: posts.when(
          data: (value) => RefreshIndicator(
                onRefresh: () => ref.refresh(postProvider.future),
                child: MasonryGridView.count(
                  crossAxisCount: 3,
                  itemCount: value.docs.length,
                  itemBuilder: (context, index) {
                    final post = value.docs[index];
                    return Image.network(
                      post['postUrl'],
                      fit: BoxFit.cover,
                    ).gestures(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => PostPage(post['postId']))));
                  },
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                ),
              ),
          loading: () => const LoadingWidget(),
          error: (error, stack) => FailedWidget(error: error.toString())),
    );
  }
}
