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
    userData.doc(id).update({'confirmed': true});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.teal.shade50,
        appBar: AppBar(
          backgroundColor: Colors.teal.shade100,
          title: const Text('Admin'),
          centerTitle: true,
          bottom: const TabBar(tabs: [
            Tab(child: Text('الطلبات', style: TextStyle(color: Colors.black))),
            Tab(child: Text('التقيمات', style: TextStyle(color: Colors.black))),
          ]),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: userData.orderBy('createdAt').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CustomCard> notComformed = [];
                    for (var d in snapshot.data!.docs) {
                      if (d['confirmed'] == false) {
                        notComformed.add(
                          CustomCard.fromSnapshot(
                            d,
                            bottonText: 'Confirm',
                            onPressed: updateUserData,
                          ),
                        );
                      }
                    }
                    return notComformed.isEmpty
                        ? const Center(
                            child: Text(
                              'no request right now',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemBuilder: (context, i) => notComformed[i],
                            itemCount: notComformed.length,
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    );
                  }
                }),
            Text('abosamra'),
          ],
        ),
      ),
    );
  }
}
