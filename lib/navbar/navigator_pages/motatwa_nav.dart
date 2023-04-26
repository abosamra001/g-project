import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/custom_button.dart';
import '/widgets/custom_textfield.dart';

class Motatawa extends StatefulWidget {
  const Motatawa({Key? key}) : super(key: key);

  @override
  State<Motatawa> createState() => _MotatawaState();
}

class _MotatawaState extends State<Motatawa> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const CustomTextField(
                    hintText: 'الاسم', prefixIcon: Icon(Icons.person)),
                const CustomTextField(
                  hintText: 'المؤهل',
                  prefixIcon: Icon(Icons.school),
                ),
                const CustomTextField(
                  hintText: 'السن',
                  prefixIcon: Icon(Icons.add),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'رقم الهاتف',
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'رقم الوتساب',
                  prefixIcon: Icon(Icons.numbers),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'العنوان(المدينة ، المحافظة)',
                  prefixIcon: Icon(Icons.home),
                ),
                const CustomTextField(
                  hintText: 'الملاحظات',
                  prefixIcon: Icon(Icons.note_add),
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
            ),
          ),
        ),
      ),
    );
  }
}
