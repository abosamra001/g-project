import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/constants/constants.dart';
import '/widgets/custom_card.dart';

class Motabara extends StatefulWidget {
  const Motabara({required this.name, required this.phone, Key? key})
      : super(key: key);

  final String name, phone;
  @override
  State<Motabara> createState() => _MotabaraState();
}

class _MotabaraState extends State<Motabara> {
  CollectionReference userData =
      FirebaseFirestore.instance.collection(kUserDataCollection);

  void updateUserData(String id) {
    userData.doc(id).update({
      'done': true,
      'motabaraData': {'name': widget.name, 'phone': widget.phone}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
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
              List<CustomCard> conformedData = [];
              for (var d in snapshot.data!.docs) {
                if (d['confirmed'] && !d['done']) {
                  conformedData.add(
                    CustomCard.fromSnapshot(
                      d,
                      bottonText: 'تبرع',
                      onPressed: updateUserData,
                    ),
                  );
                }
              }
              return conformedData.isEmpty
                  ? const Center(
                      child: Text('لا يوجد طلبات حاليا'),
                    )
                  : ListView.builder(
                      itemBuilder: (context, i) {
                        return conformedData[i];
                      },
                      itemCount: conformedData.length,
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }
          }),
    );
  }
}
