import '../models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getProduct(String id);
  Future<bool> updateProduct(ProductModel product);
  Future<bool> deleteProduct(String id);
}