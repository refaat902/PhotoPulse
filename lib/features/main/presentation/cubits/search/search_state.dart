part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class GetSearchResultLoadingState extends SearchState {}
final class GetSearchResultErrorState extends SearchState {}
final class GetSearchResultSuccessState extends SearchState {}
