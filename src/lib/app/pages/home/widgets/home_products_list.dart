import 'package:flutter/material.dart';

import '../../../core/models/product_list_model.dart';

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
      itemBuilder: (context, index) => ListTile(
        title: Text(products[index].title),
        subtitle: Text(products[index].price),
      ),
    );
  }
}
