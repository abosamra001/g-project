import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.childText,
    required this.onPressed,
  });
  final String childText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.cyan.shade50,
          // padding: EdgeInsets.all(screenSize.height * 0.01),
          shadowColor: Colors.black,

          minimumSize: Size(
            screenSize.width * 0.25,
            screenSize.height * 0.12,
          ),
        ),
        child: Text(
          childText,
          style: GoogleFonts.amiri(
            fontSize: screenSize.height * 0.04,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
