import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/custom_Button.dart';
import '/widgets/custom_textfield.dart';

class Montafa extends StatefulWidget {
  Montafa({Key? key}) : super(key: key);

  @override
  State<Montafa> createState() => _MontafaState();
}

class _MontafaState extends State<Montafa> {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text(
          "المٌنتفع",
          style: GoogleFonts.amiri(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const CustomTextField(
                  hintText: 'الاسم',
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
                const CustomTextField(
                  hintText: 'السن',
                  prefixIcon: Icon(
                    Icons.add,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'الرقم القومي',
                  prefixIcon: Icon(
                    Icons.recent_actors_outlined,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'عدد افراد الاسرة',
                  prefixIcon: Icon(
                    Icons.family_restroom,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'رقم الهاتف',
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  keyboardType: TextInputType.number,
                ),
                const CustomTextField(
                  hintText: 'العنوان (كامل)',
                  prefixIcon: Icon(
                    Icons.home,
                  ),
                ),
                const CustomTextField(
                  hintText: 'سبب التقديم',
                  prefixIcon: Icon(
                    Icons.question_mark,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                const CustomTextField(
                  hintText: 'الملاحظات',
                  prefixIcon: Icon(
                    Icons.note_add,
                  ),
                ),
                CustomButton(
                  onPressed: () {},
                  childText: 'حفظ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
