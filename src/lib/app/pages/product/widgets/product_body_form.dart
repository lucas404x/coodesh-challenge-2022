import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enumerators/product_form_enum.dart';
import '../../../core/models/product_model.dart';
import '../blocs/product_form_bloc/product_form_bloc.dart';
import '../blocs/product_form_bloc/product_form_event.dart';
import '../blocs/product_form_bloc/product_form_state.dart';
import 'form_fields/product_description_field.dart';
import 'form_fields/product_price_field.dart';
import 'form_fields/product_rating_field.dart';
import 'form_fields/product_submit_button.dart';
import 'form_fields/product_title_field.dart';
import 'form_fields/product_type_field.dart';

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
    return BlocListener<ProductFormBloc, ProductFormState>(
      bloc: context.read<ProductFormBloc>(),
      listener: ((context, state) {
        if (state.status == ProductFormEnum.submitted) {
          ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text('${state.title.value} updated!'))
          );
        }

      }),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductTitleField(initialValue: product.title),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductTypeField(initialValue: product.type),
                  const SizedBox(width: 8),
                  ProductPriceField(initialValue: product.price.toString())
                ],
              ),
              const SizedBox(height: 16),
              ProductDescriptionField(initialValue: product.description),
              const SizedBox(height: 16),
              ProductRatingField(initialValue: product.rating),
              const SizedBox(height: 16),
              const ProductSubmitButton()
            ],
          ),
        ),
      ),
    );
  }
}
