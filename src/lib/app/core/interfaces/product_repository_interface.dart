import '../models/product_model.dart';

abstract class IProductRepositry {
  Future<List<ProductModel>> getAllProducts();
  Future<bool> saveProduct(ProductModel product);
  Future<bool> deleteProduct(String id);
}