import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

/// Notifier that holds the current tab.
@riverpod
class CurrentTabNotifier extends _$CurrentTabNotifier {
  /// Constructor for default state.
  @override
  TabItem build() => TabItem.feed;

  /// Function to update the state.
  @override
  set state(TabItem newState) => super.state = newState;
  TabItem update(TabItem Function(TabItem state) cb) => state = cb(state);
}

@riverpod
class CurrentUser extends _$CurrentUser {
  @override
  Future<UserEntity?> build() async {
    final user = sl.get<FirebaseAuth>().currentUser;
    if (user == null) {
      return null;
    }

    final doc = await sl
        .get<FirebaseFirestore>()
        .collection('users')
        .doc(user.uid)
        .get();

    if (doc.data() == null) {
      return null;
    }

    return UserModel.fromDocument(doc);
  }

  void signup(UserEntity user) => state = AsyncData(user);

  void signout() => state = const AsyncData(null);
}
