import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:instagram_clone/core/repositories/core_repositories.dart';
import 'package:instagram_clone/core/repositories/core_repositories_impl.dart';
import 'package:instagram_clone/core/storage/storage_repositories.dart';
import 'package:instagram_clone/core/storage/storage_repositories_impl.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories.dart';
import 'package:instagram_clone/features/auth/repositories/auth_repositories_impl.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton(FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseStorage.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<AuthRepositories>(() => AuthRepositoriesImpl());
  sl.registerLazySingleton<StorageRepositories>(
      () => StorageRepositoriesImpl());
  sl.registerLazySingleton<CoreRepositories>(() => CoreRepositoriesImpl());
}
