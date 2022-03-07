import '../../../../core/models/product_model.dart';

abstract class ProductFormEvent {}

class LoadProductFields extends ProductFormEvent {
  final ProductModel product;

  LoadProductFields(this.product);
}

class TitleProductChangeEvent extends ProductFormEvent {
  final String title;

  TitleProductChangeEvent(this.title);
}

class TypeProductChangeEvent extends ProductFormEvent {
  final String type;

  TypeProductChangeEvent(this.type);
}

class PriceProductChangeEvent extends ProductFormEvent {
  final String price;

  PriceProductChangeEvent(this.price);
}

class DescriptionProductChangeEvent extends ProductFormEvent {
  final String description;

  DescriptionProductChangeEvent(this.description);
}

class RatingProductChangeEvent extends ProductFormEvent {
  final int rating;

  RatingProductChangeEvent(this.rating);
}