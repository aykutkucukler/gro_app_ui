import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final IconButton? suffixIcon;
  final InputBorder? border;
  final String labelText;

  const CustomTextField(
      {Key? key,
        required this.controller,
        required this.validator,
        this.obscureText = true,
        this.suffixIcon,
        this.border,
        required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator:validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          border: border,
          labelText: labelText,
        ));
  }
}