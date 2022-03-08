import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/product_list_model.dart';
import '../../../widgets/product_list_tile.dart';
import '../../product/product_page.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_bloc_event.dart';
import '../bloc/home_bloc_state.dart';

class HomeProductsList extends StatelessWidget {
  final List<ProductListModel> products;

  const HomeProductsList({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
      bloc: context.read<HomeBloc>(),
      builder: (context, state) => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: ProductListTile(
            product: products[index],
            onEdit: () async {
              bool shouldRebuild = await Navigator.of(context).pushNamed(
                ProductPage.router,
                arguments: products[index],
              ) as bool;

              if (shouldRebuild) {
                context.read<HomeBloc>().add(GetProductsEvent());
              }
            },
            onDelete: () {},
          ),
        ),
      ),
    );
  }
}
