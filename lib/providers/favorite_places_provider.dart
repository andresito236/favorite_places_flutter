
import 'package:favorite_places_7/models/favorite_place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePlacesNotifier  extends StateNotifier<List<FavoritePlace>> {
  FavoritePlacesNotifier() : super([]);

  void addFavoritePlace(FavoritePlace place) {
    state = [...state, place];
  }   
}

final favoritePlacesProvider = StateNotifierProvider<FavoritePlacesNotifier, List<FavoritePlace>>((ref) {
  return FavoritePlacesNotifier();
});