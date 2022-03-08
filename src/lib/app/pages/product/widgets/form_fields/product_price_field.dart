import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_text_input.dart';
import '../../blocs/product_form_bloc/product_form_bloc.dart';
import '../../blocs/product_form_bloc/product_form_event.dart';
import '../../blocs/product_form_bloc/product_form_state.dart';

class ProductPriceField extends StatelessWidget {
  final String initialValue;

  const ProductPriceField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.price != current.price,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => Flexible(
        child: CustomTextInput(
          initialValue: initialValue,
          errorText:
              state.price.valid ? null : 'An invalid price was provided.',
          labelText: 'Price',
          prefixText: 'R\$',
          inputFormatters: [CurrencyTextInputFormatter(
            locale: 'pt-BR',
            name: ''
          )],
          onTextChanged: (String price) {
            context.read<ProductFormBloc>().add(PriceProductChangeEvent(price));
          },
        ),
      ),
    );
  }
}
