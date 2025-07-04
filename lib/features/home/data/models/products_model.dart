class ProductsModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final Rating rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json["id"],
      title: json["title"],
      price: (json["price"] as num).toDouble(),
      category: json["category"],
      image: json["image"],
      rating: Rating.fromJson(Map<String, dynamic>.from(json["rating"])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(rate: (json["rate"] as num).toDouble(), count: json["count"]);
  }

  Map<String, dynamic> toJson() {
    return {'rate': rate, 'count': count};
  }
}
