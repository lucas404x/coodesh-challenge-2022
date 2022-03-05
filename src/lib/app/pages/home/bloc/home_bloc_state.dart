import '../../../core/models/product_list_model.dart';

abstract class HomeBlocState {}

class HomeInitialState extends HomeBlocState {}

class HomeProductsLoadingState extends HomeBlocState {}

class HomeProductsLoadedState extends HomeBlocState {
  final List<ProductListModel> products;

  HomeProductsLoadedState(this.products);
}

class HomeProductsErrorState extends HomeBlocState {
  final String message;

  HomeProductsErrorState(this.message);
}
