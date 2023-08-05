import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/constants/check_connectivity.dart';
import 'package:gproject/screens/navgetor_pages/admin_screen.dart';

import '/widgets/custom_button.dart';
import '/widgets/custom_textfield.dart';

class AdminNav extends StatefulWidget {
  const AdminNav({Key? key}) : super(key: key);

  @override
  State<AdminNav> createState() => _AdminNavState();
}

class _AdminNavState extends State<AdminNav> {
  String? _email, _password;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  Future<void> logIn() async {
    showIndicator(context);
    bool isOnline = await hasInternetConnection();
    if (isOnline) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email!, password: _password!)
            .then((_) {
          Navigator.pop(context);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AdminBanel()))
              .then((_) {
            FirebaseAuth.instance.signOut();
          });
        });
        _emailController.clear();
        _passController.clear();
      } on FirebaseAuthException catch (e) {
        if (!mounted) return;
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.code,
              textAlign: TextAlign.end,
            ),
            backgroundColor: Colors.teal,
          ),
        );
      }
    } else {
      if (!mounted) return;
      Navigator.pop(context);
      onConnectionError(context);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenOrientation = MediaQuery.orientationOf(context);
    // print(screenOrientation);
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
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.all(20),
          width: min(600, screenSize.width),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(30),
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
                  if (screenOrientation == Orientation.portrait || kIsWeb)
                    Column(
                      children: [
                        const SizedBox(height: 35),
                        CustomTextField(
                          controller: _emailController,
                          onChanged: (value) => _email = value,
                          validator: (valid) {
                            if (valid!.isEmpty) {
                              return 'اِمْلَأْ هذة الخانة';
                            }
                            return null;
                          },
                          hintText: 'البريد الالكتروني',
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                        ),
                        CustomTextField(
                          controller: _passController,
                          onChanged: (value) => _password = value,
                          validator: (valid) {
                            if (valid!.isEmpty) {
                              return 'اِمْلَأْ هذة الخانة';
                            }
                            return null;
                          },
                          hintText: 'الرقم السري',
                          prefixIcon: Icons.email,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            controller: _emailController,
                            onChanged: (value) => _email = value,
                            validator: (valid) {
                              if (valid!.isEmpty) {
                                return 'اِمْلَأْ هذة الخانة';
                              }

                              return null;
                            },
                            hintText: 'البريد الالكتروني',
                            prefixIcon: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: CustomTextField(
                            controller: _passController,
                            onChanged: (value) => _password = value,
                            validator: (valid) {
                              if (valid!.isEmpty) {
                                return 'اِمْلَأْ هذة الخانة';
                              }
                              return null;
                            },
                            hintText: 'الرقم السري',
                            prefixIcon: Icons.email,
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  CustomButton(
                    needConnection: true,
                    onPressed: () async {
                      await logIn();
                    },
                    childText: 'تسجيل الدخول',
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
