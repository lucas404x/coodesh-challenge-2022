import 'package:bloc/bloc.dart';

import '../../../core/interfaces/product_image_repository_interface.dart';
import '../../../core/interfaces/product_repository_interface.dart';
import '../../../core/models/product_list_model.dart';
import '../../../core/models/product_model.dart';
import 'home_bloc_event.dart';
import 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final IProductRepository _productRepository;
  final IProductImageRepository _productImageRepository;

  final List<ProductListModel> _productsList = [];

  HomeBloc(
    this._productRepository,
    this._productImageRepository,
  ) : super(HomeInitialState()) {
    on<GetProductsEvent>(_loadAllProducts);
    on<DeleteProductEvent>(_deleteProduct);
  }

  _loadAllProducts(
    GetProductsEvent event,
    Emitter<HomeBlocState> emitter,
  ) async {
    List<ProductModel> products;

    emitter(HomeProductsLoadingState());
    _productsList.clear();

    try {
      products = await _productRepository.getAllProducts();
    } catch (exception) {
      emitter(HomeProductsErrorState(exception.toString()));
      return;
    }

    for (var product in products) {
      String imageUrl =
          await _productImageRepository.getDownloadUrl(product.filename);
      _productsList.add(ProductListModel.fromProductModel(product, imageUrl));
    }

    emitter(HomeProductsLoadedState(_productsList));
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
