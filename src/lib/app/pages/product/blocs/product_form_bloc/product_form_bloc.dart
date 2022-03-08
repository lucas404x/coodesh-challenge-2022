import 'package:bloc/bloc.dart';
import 'package:flutter_challenge_202106/app/utils/money_utils.dart';

import '../../../../core/enumerators/product_form_enum.dart';
import '../../../../core/interfaces/product_repository_interface.dart';
import '../../../../core/models/product_form_field_model.dart';
import '../../../../core/models/product_model.dart';
import 'product_form_event.dart';
import 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  final IProductRepository _productRepository;
  ProductModel? _product;

  ProductFormBloc(this._productRepository) : super(ProductFormState()) {
    on<LoadProductFields>(_loadProductFields);
    on<TitleProductChangeEvent>(_onTitleChanged);
    on<TypeProductChangeEvent>(_onTypeChanged);
    on<PriceProductChangeEvent>(_onPriceChanged);
    on<DescriptionProductChangeEvent>(_onDescriptionChanged);
    on<RatingProductChangeEvent>(_onRatingChanged);
    on<UpdateProductEvent>(_onUpdateProduct);
  }

  _loadProductFields(
    LoadProductFields event,
    Emitter<ProductFormState> emitter,
  ) {
    _product = event.product;

    emitter(
      state.copyWith(
        title: ProductFormFieldModel(
          value: event.product.title,
          valid: true,
        ),
        type: ProductFormFieldModel(
          value: event.product.type,
          valid: true,
        ),
        price: ProductFormFieldModel(
          value: fromNumberToPriceFormatted(event.product.price),
          valid: true,
        ),
        rating: ProductFormFieldModel(
          value: event.product.rating,
          valid: true,
        ),
        description: ProductFormFieldModel(
          value: event.product.description,
          valid: true,
        ),
      ),
    );
  }

  _onTitleChanged(
    TitleProductChangeEvent event,
    Emitter<ProductFormState> emitter,
  ) {
    emitter(
      state.copyWith(
        title: ProductFormFieldModel<String>(
          value: event.title,
          valid: event.title.isNotEmpty,
        ),
      ),
    );
  }

  _onTypeChanged(
    TypeProductChangeEvent event,
    Emitter<ProductFormState> emitter,
  ) {
    emitter(
      state.copyWith(
        type: ProductFormFieldModel<String>(
          value: event.type,
          valid: event.type.isNotEmpty,
        ),
      ),
    );
  }

  _onPriceChanged(
    PriceProductChangeEvent event,
    Emitter<ProductFormState> emitter,
  ) {
    emitter(
      state.copyWith(
        price: ProductFormFieldModel<String>(
          value: event.price,
          valid: event.price.isNotEmpty,
        ),
      ),
    );
  }

  _onDescriptionChanged(
    DescriptionProductChangeEvent event,
    Emitter<ProductFormState> emitter,
  ) {
    emitter(
      state.copyWith(
        description: ProductFormFieldModel<String>(
          value: event.description,
          valid: true,
        ),
      ),
    );
  }

  _onRatingChanged(
    RatingProductChangeEvent event,
    Emitter<ProductFormState> emitter,
  ) {
    emitter(
      state.copyWith(
        rating: ProductFormFieldModel<int>(
          value: event.rating,
          valid: true,
        ),
      ),
    );
  }

  _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<ProductFormState> emitter,
  ) async {
    emitter(state.copyWith(status: ProductFormEnum.submitting));
    if (state.title.valid && state.type.valid && state.price.valid) {
      await _productRepository.updateProduct(
        ProductModel(
          id: _product!.id,
          dateCreated: _product!.dateCreated,
          title: state.title.value!,
          type: state.type.value!,
          description: state.description.value!,
          filename: _product!.filename,
          height: _product!.height,
          width: _product!.width,
          price: fromPriceFormattedToNumber(state.price.value!),
          rating: state.rating.value!,
        ),
      );

      emitter(state.copyWith(status: ProductFormEnum.submitted));
    } else {
      emitter(state.copyWith(status: ProductFormEnum.notSubmitted));
    }
  }
}
