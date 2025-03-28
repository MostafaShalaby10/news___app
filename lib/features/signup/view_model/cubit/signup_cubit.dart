import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/features/signup/model/repos/signup_repo_interface.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepoInterface signupRepoInterface;
  SignupCubit(this.signupRepoInterface) : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);
  bool isPassword = true;
  bool isConfirmPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(ChangePasswordVisibility());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    emit(ChangePasswordVisibility());
  }

  Future createUserAccountUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoadingCreateUserAccountUsingEmailAndPassword());
    signupRepoInterface
        .createAccountUsingEmailAndPassword(email: email, password: password)
        .then((value) {
          emit(SuccessfullyCreateUserAccountUsingEmailAndPassword());
        })
        .catchError((error) {
          emit(ErrorCreateUserAccountUsingEmailAndPassword(error.toString()));
        });
  }

  Future createUserAccountUsingGoogle() async {
    emit(LoadingCreateUserAccountUsingGoogle());
    signupRepoInterface
        .createAccountUsingGoogle()
        .then((value) {
          emit(SuccessfullyCreateUserAccountUsingGoogle());
        })
        .catchError((error) {
          emit(ErrorCreateUserAccountUsingGoogle(error.toString()));
        });
  }
}
