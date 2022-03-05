import 'package:flutter/material.dart';

import '../../../constants/app_strings.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Text(
        AppStrings.appTitle,
        style: _textTheme.headline5,
      ),
    );
  }
}
