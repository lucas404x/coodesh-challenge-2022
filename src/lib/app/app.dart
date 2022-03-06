import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/app_colors.dart';
import 'core/interfaces/product_repository_interface.dart';
import 'pages/home/home_page.dart';
import 'pages/product/product_page.dart';

class MyApp extends StatelessWidget {
  final IProductRepository productRepository;

  const MyApp({
    Key? key,
    required this.productRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coodesh Challenge',
      routes: {
        HomePage.router: (context) => RepositoryProvider.value(
              value: productRepository,
              child: const HomePage(),
            ),
        ProductPage.router: (context) => RepositoryProvider.value(
              value: productRepository,
              child: const ProductPage(),
            )
      },
      initialRoute: HomePage.router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: AppColors.backgroundColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
    );
  }
}
