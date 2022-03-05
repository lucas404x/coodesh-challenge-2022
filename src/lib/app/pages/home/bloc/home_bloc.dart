import 'package:bloc/bloc.dart';

import '../../../core/interfaces/product_repository_interface.dart';
import '../../../core/models/product_model.dart';
import 'home_bloc_event.dart';
import 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final IProductRepository _productRepository;
  List<ProductModel> _products = [];

  HomeBloc(this._productRepository) : super(HomeInitialState()) {
    on<GetProductsEvent>(_loadAllProducts);
  }

  _loadAllProducts(
    GetProductsEvent event,
    Emitter<HomeBlocState> emitter,
  ) async {
    emitter(HomeProductsLoadingState());
    try {
      _products = await _productRepository.getAllProducts();
      emitter(HomeProductsLoadedState(_products));
    } catch (exception) {
      emitter(HomeProductsErrorState(exception.toString()));
    }
  }
}
