import 'package:flutter/material.dart';

import 'widgets/home_header.dart';
import 'widgets/home_products_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(height: 16.0),
              HomeHeader(),
              SizedBox(height: 32.0),
              Expanded(
                child: HomeProductsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
