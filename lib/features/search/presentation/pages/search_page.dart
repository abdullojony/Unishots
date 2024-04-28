import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/core/widgets/user_list_item.dart';
import 'package:instagram_clone/features/search/data/riverpod/search_provider.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController(text: '');
    final result = useState<QuerySnapshot?>(null);

    // Using Hooks to manage loading state
    final requestPending = useState<Future?>(null);
    final snapshot = useFuture(requestPending.value);

    // function get's the submitted search text and makes a request to the server
    void doSearch(String searchText) {
      if (searchText.isNotEmpty) {
        requestPending.value = ref
            .read(searchUsersProvider(searchText).future)
            .then((value) => result.value = value,
                onError: (e) => sl
                    .get<CoreRepositories>()
                    .showSnackBar(context, message: e.toString()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Form(
          child: TextFormField(
            autofocus: true,
            controller: searchController,
            decoration:
                const InputDecoration(labelText: 'Search for a user...'),
            onFieldSubmitted: doSearch,
            autocorrect: false,
          ),
        ),
      ),
      body: LoadingWrapper(
        isLoading: snapshot.connectionState == ConnectionState.waiting,
        child: result.value != null
            ? ListView.builder(
                itemCount: result.value!.docs.length,
                itemBuilder: (context, index) =>
                    UserListItem(result.value!.docs[index]))
            : const SizedBox(),
      ),
    );
  }
}
