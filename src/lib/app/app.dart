import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/interfaces/product_repository_interface.dart';
import 'core/repositories/product_repository.dart';
import 'pages/home/bloc/home_bloc.dart';
import 'pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  final ProductRepository productRepository;

  const MyApp({
    Key? key,
    required this.productRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coodesh Challenge',
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IProductRepository>.value(
            value: productRepository,
          ),
        ],
        child: BlocProvider(
          create: (context) => HomeBloc(productRepository),
          child: const HomePage(),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
    );
  }
}
