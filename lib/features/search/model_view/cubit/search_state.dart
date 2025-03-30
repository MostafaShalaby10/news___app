part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class LodaingSearchForItems extends SearchState {}
final class SuccessfullySearchForItems extends SearchState {}
