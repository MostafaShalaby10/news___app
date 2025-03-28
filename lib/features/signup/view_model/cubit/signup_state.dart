part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class ChangePasswordVisibility extends SignupState {}

final class LoadingCreateUserAccountUsingEmailAndPassword extends SignupState {}

final class SuccessfullyCreateUserAccountUsingEmailAndPassword
    extends SignupState {}

final class ErrorCreateUserAccountUsingEmailAndPassword extends SignupState {
  final String error;

  ErrorCreateUserAccountUsingEmailAndPassword(this.error); 
}

final class LoadingCreateUserAccountUsingGoogle extends SignupState {}

final class SuccessfullyCreateUserAccountUsingGoogle
    extends SignupState {}

final class ErrorCreateUserAccountUsingGoogle extends SignupState {
  final String error;

  ErrorCreateUserAccountUsingGoogle(this.error); 
}