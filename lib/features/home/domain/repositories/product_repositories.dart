import 'package:task/features/home/data/models/products_model.dart';

abstract class ProductRepository {
  Future<List<ProductsModel>> getAllProducts();
}
