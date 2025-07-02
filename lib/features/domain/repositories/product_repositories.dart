import 'package:task/features/data/models/products_model.dart';

abstract class ProductRepositories {
  Future<List<ProductsModel>> getAllProducts();
}
