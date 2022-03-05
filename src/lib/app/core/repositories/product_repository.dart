import 'package:cloud_firestore/cloud_firestore.dart';

import '../interfaces/product_repository_interface.dart';
import '../models/product_model.dart';

class ProductRepository implements IProductRepositry {
  static const String _collectionPath = 'Products';

  late final CollectionReference<ProductModel> _collectionReference;
  final FirebaseFirestore _db;

  ProductRepository(this._db) {
    _setup();
  }

  _setup() {
    _collectionReference =
        _db.collection(_collectionPath).withConverter<ProductModel>(
              fromFirestore: (snapshot, _) => ProductModel.fromMap(
                snapshot.id,
                snapshot.data(),
              ),
              toFirestore: (snapshot, _) => snapshot.toMap(),
            );
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final snapshot = await _collectionReference.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<bool> saveProduct(ProductModel product) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteProduct(String id) {
    throw UnimplementedError();
  }
}