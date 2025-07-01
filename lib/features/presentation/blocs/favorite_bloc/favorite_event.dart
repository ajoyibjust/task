abstract class FavoriteEvent {}

class FavoriteAdd extends FavoriteEvent {
  final Map<String, dynamic> product;
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
