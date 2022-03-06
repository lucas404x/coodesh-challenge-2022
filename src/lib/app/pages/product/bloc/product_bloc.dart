import 'package:bloc/bloc.dart';
import '../../../core/models/product_model.dart';

import '../../../core/interfaces/product_repository_interface.dart';
import 'product_bloc.event.dart';
import 'product_bloc_state.dart';

class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  final IProductRepository _productRepository;
  
  ProductBloc(this._productRepository) : super(ProductInitialState()) {
    on<LoadProductEvent>(_loadProduct);
  }

  _loadProduct(
    LoadProductEvent event,
    Emitter<ProductBlocState> emitter,
  ) async {
    emitter(ProductLoadingState());

    try {
      ProductModel product = await _productRepository.getProduct(event.id);
      emitter(ProductLoadedState(product: product));
    } catch (exception) {
      emitter(ProductErrorState(message: exception.toString()));
    }
  }
}
