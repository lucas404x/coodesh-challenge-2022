class ProductFormFieldModel<T> {
  final T? value;
  final bool valid;

  const ProductFormFieldModel({
    this.value,
    this.valid = false,
  });
}
