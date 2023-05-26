import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/screens/navgetor_pages/motabara.dart';
import '/widgets/custom_button.dart';
import '/widgets/custom_textfield.dart';
import '/constants/check_connectivity.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  String? name, phone;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'سجل معنا',
                style: GoogleFonts.amiri(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 35),
              CustomTextField(
                onChanged: (value) => name = value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'اِمْلَأْ هذة الخانة';
                  }
                  return null;
                },
                hintText: 'الاسم',
                prefixIcon: Icons.person,
              ),
              CustomTextField(
                onChanged: (value) => phone = value,
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
                hintText: 'رقم الهاتف',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.number,
              ),
              CustomButton(
                childText: 'دخول',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    bool connection = await checkConnectivity();
                    if (connection && context.mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Motabara(name: name!, phone: phone!),
                        ),
                      ).then((value) => Navigator.of(context).pop());
                    } else {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('لا يوجد اتصال بالإنترنت حاول في وقت اخر'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
