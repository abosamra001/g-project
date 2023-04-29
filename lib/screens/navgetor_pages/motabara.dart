import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/widgets/custom_card.dart';

class Motabara extends StatefulWidget {
  const Motabara({Key? key}) : super(key: key);

  @override
  State<Motabara> createState() => _MotabaraState();
}

class _MotabaraState extends State<Motabara> {
  CollectionReference userData =
      FirebaseFirestore.instance.collection('userData');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text(
          "المُتبرع",
          style: GoogleFonts.amiri(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: userData.orderBy('createdAt').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CustomCard> dataFromFirestore = [];
              for (var d in snapshot.data!.docs) {
                dataFromFirestore.add(
                  CustomCard.fromSnapshot(d),
                );
              }
              return ListView.builder(
                itemBuilder: (context, i) {
                  return dataFromFirestore[i];
                },
                itemCount: dataFromFirestore.length,
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
