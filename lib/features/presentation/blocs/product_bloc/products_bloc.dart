import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/core/connection_checker/connection_checker.dart';
import 'package:task/features/data/models/products_model.dart';
import 'package:task/features/domain/useceses/get_all_products.dart';
import 'package:task/features/presentation/blocs/product_bloc/product_event.dart';
import 'package:task/features/presentation/blocs/product_bloc/product_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;

  ProductsBloc(this.getAllProducts) : super(ProductInitial()) {
    on<LoadProducts>(_getAllProducts);
  }

  Future _getAllProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoding());
    try {
      final isInter = await isInternet();

      if (isInter) {
        print("internet");

        final products = await getAllProducts();
        final box = Hive.box("products");
        box.clear();
        for (var e in products) {
          await box.add(e.toJson());
        }
        emit(ProductLoaded(products));
      } else {
        print("local");

        final box = Hive.box("products");

        final localData = box.values
            .map((e) => ProductsModel.fromJson(Map<String, dynamic>.from(e)))
            .toList();

        emit(ProductLoaded(localData));
      }
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
