import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/interfaces/product_image_repository_interface.dart';
import 'core/interfaces/product_repository_interface.dart';
import 'pages/home/home_page.dart';
import 'pages/product/product_page.dart';

class MyApp extends StatelessWidget {
  final IProductRepository productRepository;
  final IProductImageRepository productImageRepository;

  const MyApp({
    Key? key,
    required this.productRepository,
    required this.productImageRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: productRepository),
          RepositoryProvider.value(value: productImageRepository)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Coodesh Challenge',
          routes: {
            HomePage.router: (context) => const HomePage(),
            ProductPage.router: (context) => const ProductPage()
          },
          initialRoute: HomePage.router,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            backgroundColor: const Color(0xFFF9F8F9),
            scaffoldBackgroundColor: const Color(0xFFF9F8F9),
            textTheme: GoogleFonts.openSansTextTheme(),
          ),
        ),
    );
  }
}
