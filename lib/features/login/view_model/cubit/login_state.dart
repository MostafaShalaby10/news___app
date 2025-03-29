part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangePasswordVisibility extends LoginState {}

final class LoadingLoginWithEmailAndPassword extends LoginState {}

final class SuccessfullyLoginWithEmailAndPassword extends LoginState {}

final class ErrorLoginWithEmailAndPassword extends LoginState {
  final String error;

  ErrorLoginWithEmailAndPassword(this.error);
}

final class LoadingLoginWithGoogle extends LoginState {}

final class SuccessfullyLoginWithGoogle extends LoginState {}

final class ErrorLoginWithGoogle extends LoginState {
  final String error;

  ErrorLoginWithGoogle(this.error);
}
