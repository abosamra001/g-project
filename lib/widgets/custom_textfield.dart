import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
    this.validator,
    this.controller,
  });
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obscureText,
      ),
    );
  }
}
