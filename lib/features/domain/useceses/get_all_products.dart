import 'package:task/features/data/models/products_model.dart';
import 'package:task/features/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts({required this.repository});
  Future<List<ProductsModel>> call() async {
    return repository.getAllProducts();
  }
}