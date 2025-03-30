import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/Utils/shared_prefrences.dart';
import 'package:news_app/features/login/model/repos/login_repo_interface.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepoInterface loginRepoInterface;
  LoginCubit(this.loginRepoInterface) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibility());
  }

  Future loginUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginWithEmailAndPassword());
    loginRepoInterface
        .loginUsingEmailAndPassword(email: email, password: password)
        .then((value) {
          // SharedPrefs.saveData(key: "user", value: true);
          // log(SharedPrefs.getData(key: "user"));
          emit(SuccessfullyLoginWithEmailAndPassword());
        })
        .catchError((error) {
          log(error.toString() );
          emit(ErrorLoginWithEmailAndPassword(error.toString()));
        });
  }

  Future loginWithGoogle() async {
    emit(LoadingLoginWithGoogle());
    loginRepoInterface
        .loginUsingGoogle()
        .then((value) {
          SharedPrefs.saveData(key: "user", value: true);
          emit(SuccessfullyLoginWithGoogle());
        })
        .catchError((error) {
          emit(ErrorLoginWithGoogle(error.toString()));
        });
  }
}
