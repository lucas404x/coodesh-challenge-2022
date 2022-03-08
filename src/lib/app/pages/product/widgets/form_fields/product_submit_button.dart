import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enumerators/product_form_enum.dart';
import '../../../../widgets/custom_button.dart';
import '../../blocs/product_form_bloc/product_form_bloc.dart';
import '../../blocs/product_form_bloc/product_form_event.dart';
import '../../blocs/product_form_bloc/product_form_state.dart';

class ProductSubmitButton extends StatelessWidget {
  const ProductSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _themeColor = Theme.of(context).primaryColor;

    return BlocBuilder<ProductFormBloc, ProductFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      bloc: context.read<ProductFormBloc>(),
      builder: (context, state) {
        final Widget child;

        switch (state.status) {
          case ProductFormEnum.notSubmitted:
            child = const Text('Update');
            break;
          case ProductFormEnum.submitting:
            child = const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(),
            );
            break;
          case ProductFormEnum.submitted:
            child = Icon(
              Icons.check_circle_rounded,
              color: _themeColor,
            );
            break;
        }

        return CustomButton(
          child: child,
          onPressed: state.status == ProductFormEnum.notSubmitted
              ? () {
                  context.read<ProductFormBloc>().add(UpdateProductEvent());
                }
              : null,
        );
      },
    );
  }
}
