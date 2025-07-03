import 'package:task/features/home/data/models/products_model.dart';

class FavoriteEntity {
  final int id;
  final String title;
  final double price;
  final String image;
  final Rating rating;

  FavoriteEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
  });

  factory FavoriteEntity.fromJson(Map<dynamic, dynamic> json) {
    return FavoriteEntity(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      image: json["image"],
      rating: Rating.fromJson(Map<String, dynamic>.from(json["rating"])),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'image': image,
      'rating': rating.toJson(),
    };
  }

  factory FavoriteEntity.toEntity(ProductsModel model) {
    return FavoriteEntity(
      id: model.id,
      title: model.title,
      price: model.price,
      image: model.image,
      rating: model.rating,
    );
  }
}
