part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteUpdated extends FavoriteState {
  final List<FavoriteModel> favorites;
  FavoriteUpdated(this.favorites);
}
final class FavoriteLoading extends FavoriteState {}