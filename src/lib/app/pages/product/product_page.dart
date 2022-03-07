import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/interfaces/product_repository_interface.dart';
import '../../core/models/product_list_model.dart';
import '../../helpers/scroll_behavior_without_glow.dart';
import 'blocs/product_bloc/product_bloc.dart';
import 'blocs/product_bloc/product_bloc.event.dart';
import 'blocs/product_bloc/product_bloc_state.dart';
import 'blocs/product_form_bloc/product_form_bloc.dart';
import 'widgets/product_body_form.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(
            context.read<IProductRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => ProductFormBloc(),
        )
      ],
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
      resizeToAvoidBottomInset: false,
      body: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            ProductHeaderSliverBar(
              image: product.image,
              productId: product.id,
            ),
          ],
          body: Column(
            children: [
              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<ProductBloc, ProductBlocState>(
                  bloc: context.read<ProductBloc>(),
                  builder: (context, state) {
                    if (state is ProductInitialState) {
                      context
                          .read<ProductBloc>()
                          .add(LoadProductEvent(id: product.id));
                      return Container();
                    } else if (state is ProductLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoadedState) {
                      return ProductBodyForm(product: state.product);
                    } else {
                      return Center(
                        child: Text(
                          (state as ProductErrorState).message,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
