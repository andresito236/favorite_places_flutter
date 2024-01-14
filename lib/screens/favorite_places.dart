import 'package:favorite_places_7/providers/favorite_places_provider.dart';
import 'package:favorite_places_7/screens/new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/favorite_place.dart';

class FavoritePlacesList extends ConsumerStatefulWidget {
  const FavoritePlacesList({super.key});

  @override
  ConsumerState<FavoritePlacesList> createState() => _FavoritePlacesListState();
}

class _FavoritePlacesListState extends ConsumerState<FavoritePlacesList> {

  void _addPlace() async {
    final favoritePlace = await Navigator.of(context).push<FavoritePlace>(
      MaterialPageRoute(builder: (ctx) => const NewPlace())
    );

    if (favoritePlace == null) return;

    ref.read(favoritePlacesProvider.notifier).addFavoritePlace(favoritePlace);
  }

  @override
  Widget build(BuildContext context) {
    final favoritePlaces = ref.watch(favoritePlacesProvider);
    Widget content = const Center(
      child: Text(
        'No places added yet!',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );

    if (favoritePlaces.isNotEmpty) {
      content = ListView.builder(
          itemCount: favoritePlaces.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(favoritePlaces[index].name),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _addPlace,
            icon: const Icon(Icons.add),
          )
        ],
        title: const Text('Favorite Places'),
      ),
      body: content,
    );
  }
}
