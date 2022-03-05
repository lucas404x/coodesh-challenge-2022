import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/core/repositories/product_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _productRepository = ProductRepository(FirebaseFirestore.instance);
  runApp(
    MyApp(productRepository: _productRepository),
  );
}
