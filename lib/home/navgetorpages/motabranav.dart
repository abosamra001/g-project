import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Motabra extends StatelessWidget {
  const Motabra({Key? key}) : super(key: key);

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
        body: Stack(
          children: [
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
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'السن', prefixIcon: Icon(Icons.add))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                hintText: 'الرقم القومي',
                                prefixIcon:
                                    Icon(Icons.recent_actors_outlined))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'عدد أفراد الأسرة',
                                prefixIcon: Icon(Icons.family_restroom))),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'سبب التقديم',
                            )),
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
                            decoration: const InputDecoration(
                                hintText: 'العنوان (كامل)',
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
