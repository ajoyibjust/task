import 'package:task/features/home/data/models/products_model.dart';
import 'package:task/features/home/domain/repositories/product_repositories.dart';

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);
  Future<List<ProductsModel>> call() async {
    return await repository.getAllProducts();
  }
}
