import 'package:bloc/bloc.dart';

import '../../../core/interfaces/product_repository_interface.dart';
import '../../../core/models/product_list_model.dart';
import 'home_bloc_event.dart';
import 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final IProductRepository _productRepository;
  List<ProductListModel> _productsList = [];

  HomeBloc(this._productRepository) : super(HomeInitialState()) {
    on<GetProductsEvent>(_loadAllProducts);
    on<DeleteProductEvent>(_deleteProduct);
  }

  _loadAllProducts(
    GetProductsEvent event,
    Emitter<HomeBlocState> emitter,
  ) async {
    emitter(HomeProductsLoadingState());
    try {
      final products = await _productRepository.getAllProducts();
      _productsList = products
          .map((product) => ProductListModel.fromProductModel(product))
          .toList();
      emitter(HomeProductsLoadedState(_productsList));
    } catch (exception) {
      emitter(HomeProductsErrorState(exception.toString()));
    }
  }

  _deleteProduct(
    DeleteProductEvent event,
    Emitter<HomeBlocState> emitter,
  ) async {
    try {
      await _productRepository.deleteProduct(_productsList[event.index].id);
    } catch (exception) {
      emitter(HomeProductsErrorState(exception.toString()));
    }
    _productsList.removeAt(event.index);
    emitter(HomeProductsLoadedState(_productsList));
  }
}
