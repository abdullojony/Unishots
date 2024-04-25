import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/core/widgets/loading_wrapper.dart';
import 'package:instagram_clone/features/profile/presentation/pages/profile_screen.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController(text: '');

    // Using Hooks to manage loading state
    final requestPending = useState<Future<dynamic>?>(null);
    final snapshot = useFuture(requestPending.value);

    final result = useState<QuerySnapshot<Map<String, dynamic>>?>(null);

    // function get's the submitted search text and makes a request to the server
    void doSearch(String searchText) {
      if (searchText.isNotEmpty) {
        requestPending.value = sl
            .get<FirebaseFirestore>()
            .collection('users')
            .where(
              'username',
              isGreaterThanOrEqualTo: searchController.text,
            )
            .get()
            .then((value) => result.value = value,
                onError: (error) => sl
                    .get<CoreRepositories>()
                    .showSnackBar(context, message: error.toString()));
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
                itemBuilder: (context, index) => ListTile(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ProfileScreen(
                          userId: result.value!.docs[index]['userId']))),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      result.value!.docs[index]['profileImage'],
                    ),
                    radius: 16,
                  ),
                  title: Text(
                    result.value!.docs[index]['username'],
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
