import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 96.0,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
