import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/features/domain/entities/favorite_entity.dart';

abstract class FavoritesLocalDatasource {
  Future<void> addFavorite(FavoriteEntity product);
  Future<List<FavoriteEntity>> getFavorite();
  Future<void> removeFavorite(int id);
  Future<bool> isFavorite(int id);
}

class FavoritesLocalDatasourceImpl implements FavoritesLocalDatasource {
  final box = Hive.box("favorite");
  @override
  Future<void> addFavorite(FavoriteEntity favorite) async {
    final haveFavorite = box.values.any((e) => e['id'] == favorite.id);
    if (!haveFavorite) {
      await box.add(favorite.toJson());
    }
  }

  @override
  Future<void> removeFavorite(int id) async {
    final index = box.values.toList().indexWhere((e) => e['id'] == id);
    if (index != -1) {
      final key = box.keyAt(index);
      await box.delete(key);
    }
  }

  @override
  Future<List<FavoriteEntity>> getFavorite() async {
    final favorite = box.values
        .map((e) => FavoriteEntity.fromJson(e))
        .toList();
    return favorite;
  }

  @override
  Future<bool> isFavorite(int id) async {
    return box.values.any((e) => e['id'] == id);
  }
}


