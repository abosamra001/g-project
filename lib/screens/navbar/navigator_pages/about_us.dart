import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade50,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade100,
          centerTitle: true,
          title: Text(
            'About Us',
            style: GoogleFonts.amiri(
              fontSize: 30,
              color: Colors.black,
            ),
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
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "نحن مجموعة من المبرمجين الذين يؤمنون بأهمية استخدام التكنولوجيا للمساعدة في تحسين حياة الناس. لذا، قمنا بتطوير برنامج يهدف إلى توفير الدعم المالي للفقراء والمحتاجين وتسهيل عملية التبرع لهم.\n\n"
                      "بحيث يتيح للمتبرعين والمحتاجين التواصل مباشرةً دون الحاجة إلى وسيط بينهم. يتميز البرنامج بواجهة سهلة الاستخدام ويوفر للمستخدمين طريقة آمنة وشفافة للتبرع بالأموال وتحديد المحتاجين في منطقتهم.\n\n"
                      "نحن نؤمن بأن التكنولوجيا يمكن أن تكون قوة إيجابية في تحسين حياة الأشخاص الذين يعانون من الفقر والحاجة. ونحن فخورون بأننا قمنا بتطوير برنامج يلبي احتياجات المجتمع ويعزز الشفافية والمساواة في جميع أنحاء العالم.\n\n"
                      "بشكل عام، يمكن اعتبار البرنامج الذي قمنا بتطويره إحدى الأدوات الرئيسية لتحسين حياة الفقراء والمحتاجين وتحقيق العدالة الاجتماعية. ونحن نأمل أن يستفيد من البرنامج المزيد من الناس وأن يساعد في تحسين حياتهم.\n",
                      style: GoogleFonts.amiri(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )));
  }
}
