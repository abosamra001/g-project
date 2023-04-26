import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.childText, required this.onPressed});
  final String childText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan.shade50,
            padding: const EdgeInsets.all(16.0),
            shadowColor: Colors.black,
            minimumSize: const Size(140, 70)),
        child: Text(
          childText,
          style: GoogleFonts.amiri(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
