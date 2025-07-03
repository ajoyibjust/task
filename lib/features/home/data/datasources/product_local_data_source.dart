import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/features/home/data/models/products_model.dart';

class ProductLocalDataSource {
  final box = Hive.box("products");

  Future<void> cacheProducts(List<ProductsModel> products) async {
    await box.clear();
    for (var e in products) {
      await box.add(e.toJson());
    }
  }

  List<ProductsModel> getCacheProducts() {
    final products = box.values.map((e) => ProductsModel.fromJson(Map<String, dynamic>.from(e))).toList();
    return products;
  }
}
