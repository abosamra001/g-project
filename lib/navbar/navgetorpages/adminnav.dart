import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminNav extends StatelessWidget {
  const AdminNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade50,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade100,
          centerTitle: true,
          title: Text('أدمن',
              style: GoogleFonts.amiri(fontSize: 30, color: Colors.black)),
        ),
        body: Stack(children: [
          Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white, width: 3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      children: [
                        Text('تسجيل الدخول',
                            style: GoogleFonts.amiri(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 35,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: 'البريد الالكتروني',
                                prefixIcon: Icon(Icons.email))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'الباسورد',
                                prefixIcon: Icon(Icons.password))),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan.shade50,
                              padding: const EdgeInsets.all(16.0),
                              shadowColor: Colors.black,
                              minimumSize: const Size(140, 70),
                            ),
                            child: Text("تسجيل الدخول",
                                style: GoogleFonts.amiri(
                                    fontSize: 30, color: Colors.black))),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ))),
        ]));
  }
}
