import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_rating_bar.dart';
import '../../blocs/product_form_bloc/product_form_bloc.dart';
import '../../blocs/product_form_bloc/product_form_event.dart';
import '../../blocs/product_form_bloc/product_form_state.dart';

class ProductRatingField extends StatelessWidget {
  final int initialValue;

  const ProductRatingField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.rating != current.rating,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => CustomRatingBar(
        itemSize: 35.0,
        initialRating: initialValue.toDouble(),
        ignoreGestures: false,
        onRatingChange: (rating) {
          context
              .read<ProductFormBloc>()
              .add(RatingProductChangeEvent(rating.toInt()));
        },
      ),
    );
  }
}
