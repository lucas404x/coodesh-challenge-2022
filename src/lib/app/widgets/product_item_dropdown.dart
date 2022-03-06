import 'package:flutter/material.dart';

import '../core/enumerators/product_list_enum.dart';

class ProductItemDropwdown extends StatelessWidget {
  final void Function() onEdit;
  final void Function() onDelete;

  const ProductItemDropwdown({
    Key? key,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<ProductListEnum>(
          isDense: true,
          icon: const Icon(Icons.more_horiz),

          items: const [
            DropdownMenuItem(
              child: Text('Edit'),
              value: ProductListEnum.edit,
            ),
            DropdownMenuItem(
              child: Text('Delete'),
              value: ProductListEnum.delete,
            ),
          ],
          onChanged: (ProductListEnum? value) {
            if (value == null) return;
            
            switch (value) {
              case ProductListEnum.edit:
                onEdit();
                break;
              case ProductListEnum.delete:
                onDelete();
                break;
            }
          },
        ),
      ),
    );
  }
}
