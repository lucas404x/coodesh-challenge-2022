import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_text_input.dart';
import '../../blocs/product_form_bloc/product_form_bloc.dart';
import '../../blocs/product_form_bloc/product_form_event.dart';
import '../../blocs/product_form_bloc/product_form_state.dart';

class ProductTypeField extends StatelessWidget {
  final String initialValue;

  const ProductTypeField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.type != current.type,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => Flexible(
        child: CustomTextInput(
          initialValue: initialValue,
          labelText: 'Type',
          onTextChanged: (String type) {
            context.read<ProductFormBloc>().add(TypeProductChangeEvent(type));
          },
        ),
      ),
    );
  }
}
