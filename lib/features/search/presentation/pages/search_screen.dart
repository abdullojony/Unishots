import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/search/presentation/pages/search_page.dart';

class SearchScreen extends HookWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = useState<QuerySnapshot<Map<String, dynamic>>?>(null);

    // Using Hooks to manage loading state
    final requestPending = useState<Future<dynamic>?>(sl
        .get<FirebaseFirestore>()
        .collection('posts')
        .orderBy('publishedDate')
        .get()
        .then((value) => posts.value = value,
            onError: (error) => sl
                .get<CoreRepositories>()
                .showSnackBar(context, message: error.toString())));
    final snapshot = useFuture(requestPending.value);

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
      body: RefreshIndicator(
        onRefresh: () => sl
            .get<FirebaseFirestore>()
            .collection('posts')
            .orderBy('publishedDate')
            .get()
            .then((value) => posts.value = value,
                onError: (error) => sl
                    .get<CoreRepositories>()
                    .showSnackBar(context, message: error.toString())),
        child: LoadingWrapper(
          isLoading: snapshot.connectionState == ConnectionState.waiting,
          child: posts.value != null
              ? MasonryGridView.count(
                  crossAxisCount: 3,
                  itemCount: posts.value!.docs.length,
                  itemBuilder: (context, index) => Image.network(
                    posts.value!.docs[index]['postUrl'],
                    fit: BoxFit.cover,
                  ),
                  mainAxisSpacing: 2.0,
                  crossAxisSpacing: 2.0,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
