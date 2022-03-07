import 'package:flutter/material.dart';

class CustomTextInput extends StatefulWidget {
  final Function(String) onTextChanged;
  final String initialValue;
  final TextInputType textInputType;
  final String hintText;
  final String? prefixText;
  final bool isMultiline;

  const CustomTextInput({
    Key? key,
    required this.onTextChanged,
    required this.hintText,
    required this.initialValue,
    this.textInputType = TextInputType.text,
    this.prefixText,
    this.isMultiline = false,
  }) : super(key: key);

  @override
  State<CustomTextInput> createState() => CustomTextInputState();
}

class CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        keyboardType: widget.textInputType,
        onChanged: widget.onTextChanged,
        initialValue: widget.initialValue,
        inputFormatters: [],
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20),
          hintText: widget.hintText,
          prefixText: widget.prefixText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
