import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/product_model.dart';
import '../../../widgets/custom_rating_bar.dart';
import '../blocs/product_form_bloc/product_form_bloc.dart';
import '../blocs/product_form_bloc/product_form_event.dart';
import '../blocs/product_form_bloc/product_form_state.dart';
import 'product_title_field.dart';

class ProductBodyForm extends StatelessWidget {
  final ProductModel product;

  const ProductBodyForm({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      bloc: context.read<ProductFormBloc>(),
      buildWhen: (_, __) => false,
      builder: (context, state) {
        context.read<ProductFormBloc>().add(LoadProductFields(product));
        return _ProductBodyForm(product: product);
      },
    );
  }
}

class _ProductBodyForm extends StatelessWidget {
  final ProductModel product;

  const _ProductBodyForm({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            ProductTitleField(initialValue: product.title),
            CustomRatingBar(
              itemSize: 35.0,
              initialRating: product.rating.toDouble(),
              ignoreGestures: false,
              onRatingChange: (_) {},
            )
          ],
        ),
      ),
    );
  }
}
