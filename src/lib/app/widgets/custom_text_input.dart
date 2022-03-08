import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatefulWidget {
  final Function(String) onTextChanged;
  final String initialValue;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String labelText;
  final String? prefixText;
  final bool isMultiline;

  const CustomTextInput({
    Key? key,
    required this.onTextChanged,
    required this.labelText,
    required this.initialValue,
    this.inputFormatters,
    this.errorText,
    this.prefixText,
    this.textInputType = TextInputType.text,
    this.isMultiline = false,
  }) : super(key: key);

  @override
  State<CustomTextInput> createState() => CustomTextInputState();
}

class CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isMultiline ? null : 60,
      child: TextFormField(
        keyboardType: widget.textInputType,
        onChanged: widget.onTextChanged,
        initialValue: widget.initialValue,
        maxLines: widget.isMultiline ? null : 1,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding: widget.isMultiline
              ? const EdgeInsets.all(20)
              : const EdgeInsets.only(left: 20),
          labelText: widget.labelText,
          errorText: widget.errorText,
          prefixText: widget.prefixText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
