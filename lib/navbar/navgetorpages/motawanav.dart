import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Montataw extends StatelessWidget {
  const Montataw({Key? key}) : super(key: key);

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
        body: Stack(
          children: [
            // Container(
            //   decoration: BoxDecoration(image: DecorationImage(
            //     image: AssetImage('images/motataw.jpg'),
            //     fit: BoxFit.fitWidth)),),
            Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'الاسم',
                                prefixIcon: Icon(Icons.person))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'المؤهل',
                                prefixIcon: Icon(Icons.school))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'السن', prefixIcon: Icon(Icons.add))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'رقم الهاتف',
                                prefixIcon: Icon(Icons.phone))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'رقم الوتساب',
                                prefixIcon: Icon(Icons.numbers))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'العنوان(المدينة ، المحافظة)',
                                prefixIcon: Icon(Icons.home))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'الملاحظات',
                                prefixIcon: Icon(Icons.note_add))),
                        const SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.cyan.shade50,
                                padding: const EdgeInsets.all(16.0),
                                shadowColor: Colors.black,
                                minimumSize: const Size(140, 70)),
                            child: Text("حفظ",
                                style: GoogleFonts.amiri(
                                    fontSize: 30, color: Colors.black))),
                      ],
                    )))
          ],
        ));
  }
}
