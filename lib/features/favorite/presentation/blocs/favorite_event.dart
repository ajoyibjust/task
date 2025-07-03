import 'package:task/features/home/domain/entities/favorite_entity.dart';

abstract class FavoriteEvent {}

class FavoriteAdd extends FavoriteEvent {
  final FavoriteEntity product;
  FavoriteAdd(this.product);
}

class FavoriteGet extends FavoriteEvent {}

class FavoriteRemove extends FavoriteEvent {
  final int id;

  FavoriteRemove(this.id);
}

class FavoriteCheck extends FavoriteEvent {
  final int id;

  FavoriteCheck(this.id);
}
