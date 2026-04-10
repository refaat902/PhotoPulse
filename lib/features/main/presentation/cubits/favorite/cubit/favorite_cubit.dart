import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:photopulse/features/main/data/models/local/favorite_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial()) {
    _loadFavorites();
  }

  static const _key = 'favorites';
  final List<FavoriteModel> favorites = [];

  Future<void> _loadFavorites() async {
    emit(FavoriteLoading());
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw != null) {
      final List decoded = jsonDecode(raw);
      favorites
        ..clear()
        ..addAll(decoded.map((e) => FavoriteModel.fromJson(e)));
    }
    emit(FavoriteUpdated(List.unmodifiable(favorites)));
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(favorites.map((e) => e.toJson()).toList()),
    );
  }

  bool isFavorite(String id) => favorites.any((f) => f.id == id);

  Future<void> toggleFavorite(String id, String imageUrl) async {
    if (isFavorite(id)) {
      favorites.removeWhere((f) => f.id == id);
    } else {
      favorites.add(FavoriteModel(id: id, imageUrl: imageUrl, isFavorite: true));
    }
    await _saveFavorites();
    emit(FavoriteUpdated(List.unmodifiable(favorites)));
  }
}