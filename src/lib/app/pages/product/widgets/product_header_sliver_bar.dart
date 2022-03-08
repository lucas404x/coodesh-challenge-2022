import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_assets.dart';

import '../blocs/product_form_bloc/product_form_state.dart';
import '../blocs/product_form_bloc/product_form_bloc.dart';

class ProductHeaderSliverBar extends StatelessWidget {
  final String productId;
  final String image;

  const ProductHeaderSliverBar({
    Key? key,
    required this.productId,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.title != current.title,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => SliverOverlapAbsorber(
        sliver: SliverSafeArea(
          top: false,
          sliver: SliverAppBar(
            elevation: 0,
            expandedHeight: _size.height * .5,
            title: Text(state.title.value ?? ''),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Hero(
                tag: productId,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      ),
    );
  }
}
