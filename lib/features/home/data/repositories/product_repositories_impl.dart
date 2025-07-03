import 'package:task/core/utils/connection_checker.dart';
import 'package:task/features/home/data/datasources/product_local_data_source.dart';
import 'package:task/features/home/data/datasources/product_remote_data_source.dart';
import 'package:task/features/home/data/models/products_model.dart';
import 'package:task/features/home/domain/repositories/product_repositories.dart';

class ProductRepositoriesImpl implements ProductRepository {
  final ProductRemoteDataSource remote;
  final ProductLocalDataSource local;

  ProductRepositoriesImpl({required this.remote, required this.local});

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    bool isCon = await isConnected();
      if (isCon) {
        final remoteProducts = await remote.fetchAllProducts();
        await local.cacheProducts(remoteProducts);
        return remoteProducts;
      } else {
        final localProducts = local.getCacheProducts();
        if (localProducts.isNotEmpty) {
          return localProducts;
        } else {
          throw Exception("Hech narsa topilmadi");
        }
      }
  }
}
