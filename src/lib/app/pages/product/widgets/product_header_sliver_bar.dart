import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../core/models/product_list_model.dart';

class ProductHeaderSliverBar extends StatelessWidget {
  final ProductListModel product;

  const ProductHeaderSliverBar({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SliverAppBar(
      elevation: 0,
      expandedHeight: _size.height * .5,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(product.title),
        background: Hero(
          tag: product.id,
          child: Image.asset(
            '${AppAssets.imagesPath}/${product.image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
