import '../../../../core/enumerators/product_form_enum.dart';
import '../../../../core/models/product_form_field_model.dart';

class ProductFormState {
  final ProductFormFieldModel<String> title;
  final ProductFormFieldModel<String> type;
  final ProductFormFieldModel<String> price;
  final ProductFormFieldModel<String> description;
  final ProductFormFieldModel<int> rating;
  final ProductFormEnum status;

  ProductFormState({
    this.title = const ProductFormFieldModel(),
    this.type = const ProductFormFieldModel(),
    this.price = const ProductFormFieldModel(),
    this.description = const ProductFormFieldModel(),
    this.rating = const ProductFormFieldModel(),
    this.status = ProductFormEnum.notSubmitted,
  });

  ProductFormState copyWith({
    ProductFormFieldModel<String>? title,
    ProductFormFieldModel<String>? type,
    ProductFormFieldModel<String>? price,
    ProductFormFieldModel<String>? description,
    ProductFormFieldModel<int>? rating,
    ProductFormEnum? status,
  }) {
    return ProductFormState(
      title: title ?? this.title,
      type: type ?? this.type,
      price: price ?? this.price,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      status: status ?? this.status,
    );
  }
}
