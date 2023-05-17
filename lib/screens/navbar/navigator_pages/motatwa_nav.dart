import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/custom_button.dart';
import '/widgets/custom_textfield.dart';

final GlobalKey<FormState> formKey = GlobalKey();

class Motatawa extends StatefulWidget {
  const Motatawa({Key? key}) : super(key: key);

  @override
  State<Motatawa> createState() => _MotatawaState();
}

class _MotatawaState extends State<Motatawa> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenOrientation = MediaQuery.of(context).orientation;
    // print(screenSize);
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text(
          "متطوع",
          style: GoogleFonts.amiri(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Container(
          width: min(600, screenSize.width),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            child: Form(
              key: formKey,
              child: screenOrientation == Orientation.landscape
                  ? const LandscapeMode()
                  : const Portaitmode(),
            ),
          ),
        ),
      ),
    );
  }
}

class LandscapeMode extends StatelessWidget {
  const LandscapeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
                child: CustomTextField(
                    hintText: 'الاسم', prefixIcon: Icons.person)),
            SizedBox(width: 20),
            Expanded(
              child: CustomTextField(
                hintText: 'المؤهل',
                prefixIcon: Icons.school,
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: CustomTextField(
                hintText: 'السن',
                prefixIcon: Icons.add,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomTextField(
                hintText: 'العنوان(المدينة ، المحافظة)',
                prefixIcon: Icons.home,
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: CustomTextField(
                hintText: 'رقم الهاتف',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CustomTextField(
                hintText: 'رقم الوتساب',
                prefixIcon: Icons.numbers,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const CustomTextField(
          hintText: 'الملاحظات',
          prefixIcon: Icons.note_add,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        CustomButton(
          childText: 'حفظ',
          onPressed: () {
            formKey.currentState!.validate();
          },
        ),
      ],
    );
  }
}

class Portaitmode extends StatelessWidget {
  const Portaitmode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(hintText: 'الاسم', prefixIcon: Icons.person),
        const CustomTextField(
          hintText: 'المؤهل',
          prefixIcon: Icons.school,
        ),
        const CustomTextField(
          hintText: 'السن',
          prefixIcon: Icons.add,
          keyboardType: TextInputType.number,
        ),
        const CustomTextField(
          hintText: 'رقم الهاتف',
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.number,
        ),
        const CustomTextField(
          hintText: 'رقم الوتساب',
          prefixIcon: Icons.numbers,
          keyboardType: TextInputType.number,
        ),
        const CustomTextField(
          hintText: 'العنوان(المدينة ، المحافظة)',
          prefixIcon: Icons.home,
        ),
        const CustomTextField(
          hintText: 'الملاحظات',
          prefixIcon: Icons.note_add,
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        CustomButton(
          childText: 'حفظ',
          onPressed: () {
            formKey.currentState!.validate();
          },
        ),
      ],
    );
  }
}
