part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingGetNews extends HomeState {}

final class SuccessfullyGetNews extends HomeState {}

final class ErrorGetNews extends HomeState {
  final String error;

  ErrorGetNews(this.error);
}

final class LoadingLogOut extends HomeState {}
final class SuccessfullyLogout extends HomeState {}
final class ErrorLogout
 extends HomeState {
  final String error;

  ErrorLogout(this.error);
  
 }
