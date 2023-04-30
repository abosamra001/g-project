import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/widgets/custom_card.dart';

class AdminBanel extends StatefulWidget {
  const AdminBanel({super.key});

  @override
  State<AdminBanel> createState() => _AdminBanelState();
}

class _AdminBanelState extends State<AdminBanel> {
  CollectionReference userData =
      FirebaseFirestore.instance.collection('userData');

  void updateUserData(String id) {
    userData.doc(id).update({'conformed': true});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: userData.orderBy('createdAt').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<AdminCustomCard> notComformed = [];
              for (var d in snapshot.data!.docs) {
                if (d['conformed'] == false) {
                  notComformed
                      .add(AdminCustomCard.fromSnapshot(d, updateUserData));
                }
              }
              return ListView.builder(
                itemBuilder: (context, i) => notComformed[i],
                itemCount: notComformed.length,
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
