import 'package:flutter/material.dart';

const _products = [
  {
    'name': 'example_1',
    'price': 10.3,
  },
  {
    'name': 'example_1',
    'price': 10.3,
  },
  {
    'name': 'example_1',
    'price': 10.3,
  },
  {
    'name': 'example_1',
    'price': 10.3,
  }
];

class HomeProductsList extends StatelessWidget {
  const HomeProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(_products[index]['name'].toString()),
        subtitle: Text(_products[index]['price'].toString()),
      ),
    );
  }
}
