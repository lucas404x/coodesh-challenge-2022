import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/interfaces/product_repository_interface.dart';
import '../../core/models/product_list_model.dart';
import 'bloc/product_bloc.dart';
import 'widgets/product_header_sliver_bar.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  static const String router = '/product';

  @override
  Widget build(BuildContext context) {
    final _product =
        ModalRoute.of(context)!.settings.arguments as ProductListModel;

    return BlocProvider(
      create: (context) => ProductBloc(context.read<IProductRepository>()),
      child: _ProductPage(product: _product),
    );
  }
}

class _ProductPage extends StatelessWidget {
  final ProductListModel product;

  const _ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                ProductHeaderSliverBar(product: product),
              ],
          body: Container()),
    );
  }
}
