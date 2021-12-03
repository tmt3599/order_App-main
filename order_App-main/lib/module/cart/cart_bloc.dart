

// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:order_app/models/models.dart';

// abstract class BlocEvent{}
// abstract class BlocState {
//   BlocState([List props = const []]);
// }

// // class LoadingState extends BlocState{}
// class FailedToLoadState extends BlocState {
//   Exception error;
//   FailedToLoadState({required this.error});
// }
// class AddToCart extends BlocEvent {
//   Product product;
//   AddToCart({required this.product});
// }
// class DelFromCart extends BlocEvent {
//   Product product;
//   DelFromCart({required this.product});
// }
// class ClearCart extends BlocEvent {}
// class LoadedState extends BlocState {
//   List<Product> products;
//   LoadedState({required this.products});
// }


// class ProductBloc extends Bloc<BlocEvent, BlocState>{
  
//   List<Product> cartProducts = [];
// final Product product;

//   ProductBloc(this.product) : super(product);
//   // ProductBloc() : super(cartProducts.toList());


//   // ProductBloc(BlocState? initialState) : super(initialState!);

//   @override
//   Stream<BlocState> mapEventToState(BlocEvent event) async*{
//     // yield LoadingState();
//     try{
//       if (event is AddToCart) {
//         cartProducts.add(event.product);
//       }
//       if (event is DelFromCart) {
//         cartProducts.remove(event.product);
//       }
//       if (event is ClearCart) {
//         cartProducts = [];
//       }
//       // yield LoadedState(products: cartProducts);
//     }
//     catch(e){
//       // yield FailedToLoadState(error: e);
//     }
//   }
// }