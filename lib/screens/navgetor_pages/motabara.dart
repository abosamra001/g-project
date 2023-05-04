import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '/widgets/custom_textfield.dart';
import '/widgets/custom_card.dart';

class Motabara extends StatefulWidget {
  const Motabara({Key? key}) : super(key: key);

  @override
  State<Motabara> createState() => _MotabaraState();
}

class _MotabaraState extends State<Motabara> {
  CollectionReference userData =
      FirebaseFirestore.instance.collection('userData');

  double _rating = 1.0;
  String _ratingNotes = '';

  void updateUserData(String id) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('قيم هذة العملية'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                'نحتاج هذا التقيم في معرفة ما اذا كان المتطوعين علي قدر من الكفاءة والامانة'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RatingBar.builder(
                initialRating: 2,
                itemPadding: const EdgeInsets.all(4),
                minRating: 1,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.teal,
                ),
                onRatingUpdate: (rate) {
                  _rating = rate;
                },
              ),
            ),
            CustomTextField(
              hintText: 'اضافة ملاحظة',
              onChanged: (value) {
                _ratingNotes = value;
              },
              maxLines: null,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              userData.doc(id).update(
                {
                  'done': true,
                  'rating': {
                    'ratingRatio': _rating,
                    'ratingNotes': _ratingNotes,
                  }
                },
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              'تقيم',
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextButton(
            onPressed: () {
              userData.doc(id).update({'done': true});
              Navigator.of(context).pop();
            },
            child: const Text(
              'لا اريد',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
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
                      bottonText: 'تم التبرع',
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
