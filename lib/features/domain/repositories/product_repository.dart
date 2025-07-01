import 'package:task/features/data/models/products_model.dart';

abstract class ProductRepository {
  Future<List<ProductsModel>> getAllProducts();
}