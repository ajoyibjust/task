import 'package:hive_flutter/hive_flutter.dart';

abstract class FavoritesLocalDatasource {
  Future<void> addFavorite(Map<String, dynamic> product);
  Future<List<Map<String, dynamic>>> getFavorite();
  Future<void> removeFavorite(int id);
  Future<bool> isFavorite(int id);
}

class FavoritesLocalDatasourceImpl implements FavoritesLocalDatasource {
  final box = Hive.box("favorite");
  @override
  Future<void> addFavorite(Map<String, dynamic> favorite) async {
    final id = favorite['id'];
    final haveFavorite = box.values.any((e) => e['id'] == id);
    if (!haveFavorite) {
      await box.add(favorite);
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
  Future<List<Map<String, dynamic>>> getFavorite() async {
    final favorite = box.values
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
    return favorite;
  }

  @override
  Future<bool> isFavorite(int id) async {
    return box.values.any((e) => e['id'] == id);
  }
}
