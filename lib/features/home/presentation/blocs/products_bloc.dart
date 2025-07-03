import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/domain/useceses/get_all_products.dart';
import 'package:task/features/home/presentation/blocs/product_event.dart';
import 'package:task/features/home/presentation/blocs/product_state.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;

  ProductsBloc(this.getAllProducts) : super(ProductInitial()) {
    on<LoadProducts>(_getAllProducts);
  }

  Future _getAllProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoding());
    try {
      final produst = await getAllProducts.call();
      emit(ProductLoaded(produst));

     
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
