import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/custom_text_input.dart';
import '../../blocs/product_form_bloc/product_form_bloc.dart';
import '../../blocs/product_form_bloc/product_form_event.dart';
import '../../blocs/product_form_bloc/product_form_state.dart';

class ProductTitleField extends StatelessWidget {
  final String initialValue;

  const ProductTitleField({
    Key? key,
    required this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.title != current.title,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) => Flexible(
        child: CustomTextInput(
          initialValue: initialValue,
          labelText: 'Title',
          onTextChanged: (String title) {
            context.read<ProductFormBloc>().add(TitleProductChangeEvent(title));
          },
        ),
      ),
    );
  }
}
