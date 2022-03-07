import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_text_input.dart';
import '../../blocs/product_form_bloc/product_form_bloc.dart';
import '../../blocs/product_form_bloc/product_form_event.dart';
import '../../blocs/product_form_bloc/product_form_state.dart';

class ProductDescriptionField extends StatelessWidget {
  final String initialValue;

  const ProductDescriptionField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.description != current.description,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => CustomTextInput(
        initialValue: initialValue,
        textInputType: TextInputType.multiline,
        isMultiline: true,
        hintText: 'Description',
        onTextChanged: (String description) {
          context.read<ProductFormBloc>().add(DescriptionProductChangeEvent(description));
        },
      ),
    );
  }
}
