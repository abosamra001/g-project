import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/custom_Button.dart';
import 'navgetor_pages/motabara.dart';
import 'navgetor_pages/montafa.dart';
import '/navbar/navbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'images/home.jpeg',
                ),
                fit: BoxFit.cover,
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
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Montafa(),
                        ),
                      );
                    },
                    childText: 'المٌنتفع',
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Motabara(),
                        ),
                      );
                    },
                    childText: 'المُتبرع',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
