import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/auth/data/models/user_model.dart';
import 'package:instagram_clone/features/auth/domain/entities/user_entitiy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Future<UserEntity> userData(UserDataRef ref, String userId) async {
  final snapshot =
      await sl.get<FirebaseFirestore>().collection('users').doc(userId).get();

  return UserModel.fromDocument(snapshot);
}

@riverpod
class Follows extends _$Follows {
  @override
  Set<String> build() => {};

  void add(String follower) {
    state = {...state, follower};
  }

  void remove(String follower) {
    final prev = state;
    prev.remove(follower);
    state = {...prev};
  }

  @override
  set state(Set<String> newState) => super.state = newState;
  Set<String> update(Set<String> Function(Set<String> state) cb) =>
      state = cb(state);
}

@riverpod
class PostCounter extends _$PostCounter {
  @override
  int build() => 0;

  void add() => state++;
  void remove() => state--;

  @override
  set state(int newState) => super.state = newState;
  int update(int Function(int state) cb) => state = cb(state);
}

@riverpod
Stream<QuerySnapshot<Map<String, dynamic>>> userPostStream(
    UserPostStreamRef ref, String userId) {
  return sl
      .get<FirebaseFirestore>()
      .collection('posts')
      .where('userId', isEqualTo: userId)
      .snapshots();
}
