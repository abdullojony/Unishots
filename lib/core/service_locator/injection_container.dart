import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/firestore_repositories.dart';
import 'package:instagram_clone/core/repositories_impl/core_repositories_impl.dart';
import 'package:instagram_clone/core/repositories/storage_repositories.dart';
import 'package:instagram_clone/core/repositories_impl/firestore_repositories_impl.dart';
import 'package:instagram_clone/core/repositories_impl/storage_repositories_impl.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // heavy objects
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerSingleton(FirebaseStorage.instance);
  sl.registerSingleton(FirebaseFirestore.instance);

  // repositories
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl());
  sl.registerLazySingleton<CoreRepositories>(() => CoreRepositoriesImpl());
  sl.registerLazySingleton<FirestoreRepositories>(
      () => FirestoreRepositoriesImpl());
  sl.registerLazySingleton<StorageRepositories>(
      () => StorageRepositoriesImpl());
}
