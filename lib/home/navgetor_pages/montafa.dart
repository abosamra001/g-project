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

  // TextEditingController name = TextEditingController();

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
          reverse: true,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  hintText: 'الاسم',
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'السن',
                  prefixIcon: const Icon(
                    Icons.add,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if (int.parse(value) < 16) {
                      return 'يجب ان تكون فوق ال 16 عاما';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  hintText: 'الرقم القومي',
                  validator: (value) {
                    value = value!.trim();

                    if (value.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if ((value[0] != '3' && value[0] != '2') ||
                        (value.length != 14) ||
                        (value.contains(' ')) ||
                        value.contains('-')) {
                      return 'ادخل رقم قومي صحيح';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.recent_actors_outlined,
                  ),
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  hintText: 'عدد افراد الاسرة',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if (int.parse(value) < 0 || int.parse(value) > 6) {
                      return 'عذرا لا نقدر علي مساعدة هذا العدد من الافراد';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.family_restroom,
                  ),
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  hintText: 'رقم الهاتف',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if (value.length != 11 ||
                        value.contains('-') ||
                        value.contains(' ')) {
                      return 'ادخل رقم صحيح';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.phone,
                  ),
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  hintText: 'العنوان (كامل)',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.home,
                  ),
                ),
                CustomTextField(
                  hintText: 'سبب التقديم',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
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
                  onPressed: () {
                    formKey.currentState!.validate();
                  },
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
