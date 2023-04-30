import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gproject/screens/navgetor_pages/admin_screen.dart';
import '/widgets/custom_button.dart';
import '/widgets/custom_textfield.dart';

class AdminNav extends StatefulWidget {
  AdminNav({Key? key}) : super(key: key);

  @override
  State<AdminNav> createState() => _AdminNavState();
}

class _AdminNavState extends State<AdminNav> {
  String? _email, _password;

  final GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  Future<void> logIn() async {
    showIndicator();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(
            MaterialPageRoute(
              builder: (context) => const AdminBanel(),
            ),
          )
          .then(
            (_) => FirebaseAuth.instance.signOut(),
          );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
  }

  void showIndicator() {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text(
          'أدمن',
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
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'تسجيل الدخول',
                    style: GoogleFonts.amiri(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 35),
                  CustomTextField(
                    controller: emailController,
                    onChanged: (value) => _email = value,
                    validator: (valid) {
                      if (valid!.isEmpty) {
                        return 'اِمْلَأْ هذة الخانة';
                      }
                      return null;
                    },
                    hintText: 'البريد الالكتروني',
                    prefixIcon: const Icon(Icons.email),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    controller: passController,
                    onChanged: (value) => _password = value,
                    validator: (valid) {
                      if (valid!.isEmpty) {
                        return 'اِمْلَأْ هذة الخانة';
                      }
                      return null;
                    },
                    hintText: 'الرقم السري',
                    prefixIcon: const Icon(Icons.email),
                    obscureText: true,
                  ),
                  CustomButton(
                    childText: 'تسجيل الدخول',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await logIn();
                        emailController.clear();
                        passController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
