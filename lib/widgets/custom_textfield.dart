import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.onChanged,
    this.autofocus = false,
    this.textInputAction,
    this.inputFormatters,
  });
  final String? hintText;
  final int? maxLines;
  final bool obscureText;
  final bool autofocus;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        textInputAction: textInputAction,
        textDirection: TextDirection.rtl,
        autofocus: autofocus,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.teal,
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
        ),
        onTap: () {},
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obscureText,
      ),
    );
  }
}
