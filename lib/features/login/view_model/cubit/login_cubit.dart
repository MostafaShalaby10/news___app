import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
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
          emit(SuccessfullyLoginWithEmailAndPassword());
        })
        .catchError((error) {
          emit(ErrorLoginWithEmailAndPassword(error.toString()));
        });
  }

  Future loginWithGoogle() async {
    emit(LoadingLoginWithGoogle());
    loginRepoInterface
        .loginUsingGoogle()
        .then((value) {
          emit(SuccessfullyLoginWithGoogle());
        })
        .catchError((error) {
          emit(ErrorLoginWithGoogle(error.toString()));
        });
  }
}
