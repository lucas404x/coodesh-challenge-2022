import 'package:firebase_storage/firebase_storage.dart';

import '../interfaces/product_image_repository_interface.dart';

class ProductImageRepository implements IProductImageRepository {
  static const String _bucket = 'Images';
  final FirebaseStorage _storage;

  ProductImageRepository(this._storage);
  
  @override
  Future<String> getDownloadUrl(String filename) async {
    return await _storage.ref('$_bucket/$filename').getDownloadURL();
  }
}