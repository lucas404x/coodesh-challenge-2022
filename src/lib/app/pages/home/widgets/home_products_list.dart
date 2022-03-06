import 'package:flutter/material.dart';

import '../../../core/models/product_list_model.dart';
import '../../../widgets/product_list_tile.dart';

class HomeProductsList extends StatelessWidget {
  final List<ProductListModel> products;

  const HomeProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 24.0),
        child: ProductListTile(
          product: products[index],
        ),
      ),
    );
  }
}
