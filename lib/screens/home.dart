import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/screens/navgetor_pages/register.dart';
import '/widgets/custom_Button.dart';
import 'navgetor_pages/montafa.dart';
import 'navbar/navbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenOrientation = MediaQuery.of(context).orientation;
    // print(screenSize);
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text(
          "تبرع",
          style: GoogleFonts.amiri(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 210, 210, 210),
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'images/home.jpeg',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'لَن تَنَالُوا۟ ٱلْبِرَّ حَتَّىٰ تُنفِقُوا۟ مِمَّا تُحِبُّونَ وَمَا تُنفِقُوا۟ مِن شَىْءٍ فَإِنَّ ٱللَّهَ بِهِۦ عَلِيمٌ \n(آل عمران) ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.amiri(
                        fontSize: min(
                          screenSize.height * 0.07,
                          min(screenSize.width * 0.07, 40),
                        ),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    if (screenOrientation == Orientation.portrait || kIsWeb)
                      Column(
                        children: [
                          CustomButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Montafa(),
                                ),
                              );
                            },
                            childText: 'مُنتفع',
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  content: RegisterUser(),
                                ),
                              );
                            },
                            childText: 'مُتبرع',
                          ),
                        ],
                      )
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Montafa(),
                                ),
                              );
                            },
                            childText: 'مُنتفع',
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>const AlertDialog(
                                  content: RegisterUser(),
                                ),
                              );
                            },
                            childText: 'مُتبرع',
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
