import '../../../core/models/product_model.dart';

abstract class HomeBlocState {}

class HomeInitialState extends HomeBlocState {}

class HomeProductsLoadingState extends HomeBlocState {}

class HomeProductsLoadedState extends HomeBlocState {
  final List<ProductModel> products;

  HomeProductsLoadedState(this.products);
}

class HomeProductsErrorState extends HomeBlocState {
  final String message;

  HomeProductsErrorState(this.message);
}
