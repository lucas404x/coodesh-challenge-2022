import 'package:flutter/material.dart';

class DeleteProductDialog extends StatelessWidget {
  final String productName;

  const DeleteProductDialog({
    Key? key,
    required this.productName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        )
      ],
      title: Text('Delete $productName'),
      content: const Text('Are you sure that you want to delete it?'),
    );
  }
}
