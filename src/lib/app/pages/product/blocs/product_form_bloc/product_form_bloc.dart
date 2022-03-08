import 'package:bloc/bloc.dart';

import '../../../../core/models/product_form_field_model.dart';
import 'product_form_event.dart';
import 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductFormBloc() : super(ProductFormState()) {
    on<LoadProductFields>(_loadProductFields);
    on<TitleProductChangeEvent>(_onTitleChanged);
    on<TypeProductChangeEvent>(_onTypeChanged);
    on<PriceProductChangeEvent>(_onPriceChanged);
    on<DescriptionProductChangeEvent>(_onDescriptionChanged);
    on<RatingProductChangeEvent>(_onRatingChanged);
  }

  _loadProductFields(
    LoadProductFields event,
    Emitter<ProductFormState> emitter,
  ) {
    emitter(
      state.copyWith(
        title: ProductFormFieldModel(value: event.product.title, valid: true),
        type: ProductFormFieldModel(value: event.product.type, valid: true),
        price: ProductFormFieldModel(value: event.product.price.toString(), valid: true),
        rating: ProductFormFieldModel(value: event.product.rating, valid: true),
        description: ProductFormFieldModel(value: event.product.description, valid: true),
      )
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
    // state.description.value = event.description;
    // state.description.valid = true;
    emitter(state);
  }

  _onRatingChanged(
    RatingProductChangeEvent event,
    Emitter<ProductFormState> emitter,
  ) {
    // state.rating.value = event.rating;
    // state.rating.valid = true;
    emitter(state);
  }
}
