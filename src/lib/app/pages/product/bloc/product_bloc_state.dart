import 'package:flutter_challenge_202106/app/core/models/product_model.dart';

abstract class ProductBlocState {}

class ProductInitialState extends ProductBlocState {}

class ProductLoadingState extends ProductBlocState {}

class ProductLoadedState extends ProductBlocState {
  final ProductModel product;

  ProductLoadedState({required this.product});
}

class ProductErrorState extends ProductBlocState {
  final String message;
  
  ProductErrorState({required this.message});
}