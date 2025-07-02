// mana codlarim lol 
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:task/core/routes/app_router.dart';
// import 'package:task/features/data/datasources/favorites_local_datasource.dart';
// import 'package:task/features/data/datasources/product_remote_data_source.dart';
// import 'package:task/features/data/repository/favorites_repository_impl.dart';
// import 'package:task/features/data/repository/product_repository_impl.dart';
// import 'package:task/features/domain/useceses/get_all_products.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_event.dart';
// import 'package:task/features/presentation/blocs/product_bloc/product_event.dart';
// import 'package:task/features/presentation/blocs/product_bloc/products_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   await Hive.openBox("products");
//   await Hive.openBox("favorite");
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => FavoriteBloc(
//             FavoritesRepositoryImpl(local: FavoritesLocalDatasourceImpl()),
//           )..add(FavoriteGet()),
//         ),
//         BlocProvider(
//           create: (context) => ProductsBloc(
//             GetAllProducts(
//               repository: ProductRepositoryImpl(
//                 remoteDataSource: ProductRemoteDataSource(),
//               ),
//             ),
//           )..add(LoadProducts()),
//         ),
//       ],
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         routerConfig: appRouter,
//       ),
//     );
//   }
// }
// import 'package:go_router/go_router.dart';
// import 'package:task/core/routes/bottom_nav.dart';
// import 'package:task/core/routes/favorites_router.dart';
// import 'package:task/core/routes/home_router.dart';

// final GoRouter appRouter = GoRouter(
//   initialLocation: "/",
//   routes: [
//     ShellRoute(
//       builder: (context, state, child) {
//         return BottomNav(child: child);
//       },
//       routes: [
//         ...homeRoutes,
//         ...favoritesRouter,
//     ]),
//   ],
// );
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_state.dart';

// class BottomNav extends StatefulWidget {
//   final Widget child;
//   const BottomNav({super.key, required this.child});

//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   int _index(String location) {
//     if (location.startsWith("/favorites")) return 1;
//     return 0;
//   }

//   int count = 0;
//   double scale = 1;

//   _animation() async {
//     setState(() {
//       scale = 1.5;
//     });
//     await Future.delayed(Duration(milliseconds: 200));
//     setState(() {
//       scale = 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final location = GoRouterState.of(context).uri.toString();
//     final index = _index(location);
//     return Scaffold(
//       body: widget.child,
//       bottomNavigationBar: BlocListener<FavoriteBloc, FavoriteState>(
//         listener: (context, state) {
//           if (state is FavoriteLoaded) {
//             setState(() {
//               count = state.favorite.length;
//             });
//             _animation();
//           }
//         },
//         child: BottomNavigationBar(
//           backgroundColor: Colors.white,
//           currentIndex: index,
//           onTap: (idx) {
//             switch (idx) {
//               case 0:
//                 context.go('/');
//                 break;
//               case 1:
//                 context.go("/favorites");
//                 break;
//             }
//           },

//           items: [
//             BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
//             BottomNavigationBarItem(
//               icon: Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   Icon(Icons.favorite),
//                   Positioned(
//                     top: -5,
//                     right: -7,
//                     child: AnimatedScale(
//                       duration: Duration(milliseconds: 150),
//                       scale: scale,
//                       child: Container(
//                         width: 15,
//                         height: 15,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.red,
//                         ),
//                         child: Center(
//                           child: Text(
//                             count.toString(),
//                             style: TextStyle(fontSize: 11, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               label: '',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:go_router/go_router.dart';
// import 'package:task/features/presentation/screens/favorites_screen.dart';

// final favoritesRouter = [
//   GoRoute(path: "/favorites", builder: (context, state) => FavoritesScreen()),
// ];
// import 'package:go_router/go_router.dart';
// import 'package:task/features/presentation/screens/home_screen.dart';

// final homeRoutes = [
//   GoRoute(path: "/", builder: (context, state) => HomeScreen(),)
// ];
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:task/features/data/models/product_model.dart';
// import 'package:task/features/data/models/products_model.dart';

// class ProductRemoteDataSource {
//   final String baseUrl = "https://fakestoreapi.com/products";

//   Future<List<ProductsModel>> fetchAllProducts() async {
//     try {
//       final responce = await http.get(Uri.parse(baseUrl));
//       if (responce.statusCode == 200) {
//         final List data = jsonDecode(responce.body);
//         final List<ProductsModel> res = data
//             .map((e) => ProductsModel.fromJson(e))
//             .toList();
//         return res;
//       } else {
//         throw Exception("Server error: ${responce.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("fetchAllProducts: $e");
//     }
//   }

//   Future<List<ProductModel>> fetchOneProduct() async {
//     try {
//       final responce = await http.get(Uri.parse(baseUrl));
//       if (responce.statusCode == 200) {
//         final List data = jsonDecode(responce.body);
//         final List<ProductModel> res = data
//             .map((e) => ProductModel.fromJson(e))
//             .toList();
//         return res;
//       } else {
//         throw Exception("Server error: ${responce.statusCode}");
//       }
//     } catch (e) {
//       throw Exception("fetchOneProduct : $e");
//     }
//   }
// }
//   class ProductModel {
//     final int id;
//     final String title;
//     final double price;
//     final String description;
//     final String category;
//     final String image;
//     final Rating rating;

//     ProductModel({
//       required this.id,
//       required this.title,
//       required this.price,
//       required this.description,
//       required this.category,
//       required this.image,
//       required this.rating,
//     });
//     factory ProductModel.fromJson(Map<String, dynamic> json) {
//       return ProductModel(
//         id: json["id"],
//         title: json["title"],
//         price: (json["price"] as num).toDouble(),
//         description: json["description"],
//         category: json["category"],
//         image: json["image"],
//         rating: Rating.fromJson(json["rating"])
//       );
//     }
//   }

//   class Rating {
//     final double rate;
//     final int count;

//     Rating({required this.rate, required this.count});

//     factory Rating.fromJson(Map<String, dynamic> json) {
//       return Rating(rate: (json["rate"] as num).toDouble(), count: json["count"]);
//     }
//   }
//   class ProductsModel {
//     final int id;
//     final String title;
//     final double price;
//     final String category;
//     final String image;
//     final Rating rating;

//     ProductsModel({
//       required this.id,
//       required this.title,
//       required this.price,
//       required this.category,
//       required this.image,
//       required this.rating,
//     });
//     factory ProductsModel.fromJson(Map<String, dynamic> json) {
//       return ProductsModel(
//         id: json["id"],
//         title: json["title"],
//         price: (json["price"] as num).toDouble(),
//         category: json["category"],
//         image: json["image"],
//         rating: Rating.fromJson(json["rating"])
//       );
//     }

//     Map<String, dynamic> toJson(){
//       return {
//         'id': id,
//         'title': title,
//         'price': price,
//         'category': category,
//         'image': image,
//         'rating': rating.toJson()
//       };
//     }
//   }

//   class Rating {
//     final double rate;
//     final int count;

//     Rating({required this.rate, required this.count});

//     factory Rating.fromJson(Map<String, dynamic> json) {
//       return Rating(rate: (json["rate"]as num).toDouble(), count: json["count"]);
//     }

//     Map<String, dynamic> toJson(){
//       return {
//         'rate': rate,
//         'count': count,
//       };
//     }
//   }
// import 'package:task/features/data/models/products_model.dart';

// abstract class ProductRepository {
//   Future<List<ProductsModel>> getAllProducts();
// }class ProductEntity {
//   final int id;
//   final String title;
//   final double price;
//   final String category;
//   final String image;
//   final Rating rating;

//   ProductEntity({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.category,
//     required this.image,
//     required this.rating,
//   });
// }

// class Rating {
//   final double rate;
//   final int count;

//   Rating({required this.rate, required this.count});
// }

// }import 'package:task/features/data/models/products_model.dart';

// abstract class ProductRepository {
//   Future<List<ProductsModel>> getAllProducts();
// }import 'package:task/features/data/models/products_model.dart';
// import 'package:task/features/domain/repositories/product_repository.dart';

// class GetAllProducts {
//   final ProductRepository repository;

//   GetAllProducts({required this.repository});
//   Future<List<ProductsModel>> call() async {
//     return repository.getAllProducts();
//   }
// }

// abstract class ProductEvent {}

// class LoadProducts extends ProductEvent{}
// import 'package:task/features/data/models/products_model.dart';

// abstract class ProductState {}

// class ProductInitial extends ProductState {}

// class ProductLoding extends ProductState {}

// class ProductLoaded extends ProductState {
//   final List<ProductsModel> products;

//   ProductLoaded(this.products);
// }

// class ProductError extends ProductState{
//   final String message;

//   ProductError(this.message);
// }
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:task/features/data/models/products_model.dart';
// import 'package:task/features/domain/useceses/get_all_products.dart';
// import 'package:task/features/presentation/blocs/product_bloc/product_event.dart';
// import 'package:task/features/presentation/blocs/product_bloc/product_state.dart';

// class ProductsBloc extends Bloc<ProductEvent, ProductState> {
//   final GetAllProducts getAllProducts;

//   ProductsBloc(this.getAllProducts) : super(ProductInitial()) {
//     on<LoadProducts>(_getAllProducts);
//   }

//   Future _getAllProducts(LoadProducts event, Emitter<ProductState> emit) async {
//     emit(ProductLoding());
//     try {
//       final products = await getAllProducts();
//       final box = Hive.box("products");
//       await box.clear();
//       for (var e in products) {
//         await box.add(e.toJson());
//       }

//       final localData = box.values
//           .map((e) => ProductsModel.fromJson(Map<String, dynamic>.from(e)))
//           .toList();
//       emit(ProductLoaded(localData));
//     } catch (e) {
//       emit(ProductError(e.toString()));
//     }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_state.dart';
// import 'package:task/features/presentation/widgets/favoride_widget/favorites_body_grid.dart';

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Favorites"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),

//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: SafeArea(
//           child: Column(
//             children: [
//               BlocBuilder<FavoriteBloc, FavoriteState>(
//                 builder: (context, state) {
//                   if (state is FavoriteLoading) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state is FavoriteLoaded) {
//                     return FavoriteBodyGrid(state: state.favorite);
//                   }
//                   return Center(child: Text("Kutulmagan Xatolik"));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/features/presentation/blocs/product_bloc/product_state.dart';
// import 'package:task/features/presentation/blocs/product_bloc/products_bloc.dart';
// import 'package:task/features/presentation/widgets/home_widget/home_body_grid.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Home"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: SafeArea(
//           child: Column(
//             children: [
//               BlocBuilder<ProductsBloc, ProductState>(
//                 builder: (context, state) {
//                   if (state is ProductLoding) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state is ProductError) {
//                     return Center(child: Text(state.message));
//                   } else if (state is ProductLoaded) {
//                     return HomeBodyGrid(state: state.products);
//                   }
//                   return Center(child: Text("Kutulmagan Xatolik"));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/features/data/models/products_model.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_bloc.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_event.dart';
// import 'package:task/features/presentation/blocs/favorite_bloc/favorite_state.dart';

// class HomeBodyGridContainer extends StatelessWidget {
//   final ProductsModel data;
//   const HomeBodyGridContainer({super.key, required this.data});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.blueGrey.shade50,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         spacing: 5,
//         children: [
//           Stack(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 height: 150,
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                   ),
//                   child: Center(child: Image.network(data.image, width: 80)),
//                 ),
//               ),
//               Positioned(
//                 top: -5,
//                 right: -5,
//                 child: BlocBuilder<FavoriteBloc, FavoriteState>(
//                   builder: (context, state) {
//                     bool isFav = false;
//                     if (state is FavoriteLoaded) {
//                       isFav = state.favorite.any((e) => e.id == data.id);
//                     }
//                     return IconButton(
//                       icon: Icon(
//                         Icons.favorite,
//                         color: isFav ? Colors.red : null,
//                       ),
//                       onPressed: () {
//                         context.read<FavoriteBloc>().add(
//                           isFav
//                               ? FavoriteRemove(data.id)
//                               : FavoriteAdd(
//                                   ProductsModel(
//                                     id: data.id,
//                                     title: data.title,
//                                     price: data.price,
//                                     category: data.category,
//                                     image: data.image,
//                                     rating: data.rating,
//                                   ),
//                                 ),
//                         );
//                         context.read<FavoriteBloc>().add(
//                           FavoriteCheck(data.id),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),

//           Text(data.title, maxLines: 1),
//           Row(
//             children: [
//               Text(data.price.toString()),
//               Spacer(),
//               Icon(Icons.star_rate_rounded, color: Colors.amber),
//               Text(data.rating.rate.toString()),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:task/features/data/models/products_model.dart';
// import 'package:task/features/presentation/widgets/home_widget/home_body_grid_container.dart';

// class HomeBodyGrid extends StatelessWidget {
//   final List<ProductsModel> state;
//   const HomeBodyGrid({super.key, required this.state});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         mainAxisExtent: 230,
//         crossAxisSpacing: 15,
//         mainAxisSpacing: 15,
//       ),
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: state.length,
//       itemBuilder: (context, index) {
//         final data = state[index];
//         return HomeBodyGridContainer(data: data,);
//       },
//     );
//   }
// }
