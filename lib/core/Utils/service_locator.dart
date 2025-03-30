import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/dio_helper/api_service.dart';
import 'package:news_app/features/home/model/repos/home_repo_imp.dart';
import 'package:news_app/features/login/model/repos/login_repo_imp.dart';
import 'package:news_app/features/signup/model/repos/signup_repo_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setup() {
  final getIt = GetIt.instance;

  // Registering the ApiService
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => ApiService());
  getIt.registerLazySingleton(() => SignupRepoImp());
  getIt.registerLazySingleton(() => LoginRepoImp());
  getIt.registerLazySingleton(() => HomeRepoImp());
  getIt.registerLazySingleton(() => SharedPreferences.getInstance);
}
