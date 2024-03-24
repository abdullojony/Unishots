import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/core/service_locator/injection_container.dart';
import 'package:instagram_clone/features/profile/data/models/user_model.dart';
import 'package:instagram_clone/features/profile/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_provider.g.dart';

@riverpod
Future<UserEntity> userData(UserDataRef ref) async {
  final User currentUser = sl.get<FirebaseAuth>().currentUser!;
  final doc = await sl
      .get<FirebaseFirestore>()
      .collection('users')
      .doc(currentUser.uid)
      .get();

  return UserModel.fromDocument(doc);
}
