import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'app/app.dart';
import 'app/core/repositories/product_image_repository.dart';
import 'app/core/repositories/product_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setup intl
  await initializeDateFormatting('pt_BR', null);
  Intl.defaultLocale = 'pt_BR';

  // setup firebase
  await Firebase.initializeApp();
  final _productRepository = ProductRepository(FirebaseFirestore.instance);
  final _productImageRepository =
      ProductImageRepository(FirebaseStorage.instance);

  runApp(
    MyApp(
      productRepository: _productRepository,
      productImageRepository: _productImageRepository,
    ),
  );
}
