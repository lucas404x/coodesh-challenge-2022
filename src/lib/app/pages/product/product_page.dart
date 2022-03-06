import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String productId;
  final String image;

  const ProductPage({
    Key? key,
    required this.productId,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: productId,
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
