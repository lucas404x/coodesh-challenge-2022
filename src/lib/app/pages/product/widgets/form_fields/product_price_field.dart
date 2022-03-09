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
    final _currentTextInputFormatter = CurrencyTextInputFormatter(name: '');

    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.price != current.price,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => Flexible(
        child: CustomTextInput(
          initialValue: _currentTextInputFormatter.format(initialValue),
          errorText:
              state.price.valid ? null : 'Invalid price.',
          labelText: 'Price',
          prefixText: 'R\$',
          textInputType: TextInputType.number,
          inputFormatters: [_currentTextInputFormatter],
          onTextChanged: (String price) {
            context.read<ProductFormBloc>().add(
                  PriceProductChangeEvent(
                    price.isNotEmpty
                        ? _currentTextInputFormatter.getFormattedValue()
                        : '',
                  ),
                );
          },
        ),
      ),
    );
  }
}
