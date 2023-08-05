import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/constants/check_connectivity.dart';

class ComplaintCard extends StatelessWidget {
  final String person;
  final String notes;
  final bool solved;

  final String id;
  final Function(String)? onPressed;

  ComplaintCard(
      {super.key,
      required this.person,
      required this.notes,
      required this.solved,
      required this.id,
      required this.onPressed});

  factory ComplaintCard.fromSnapShot(data, Function(String)? onPressed) {
    return ComplaintCard(
      person: data['person'],
      notes: data['notes'],
      solved: data['solved'],
      id: data.id,
      onPressed: onPressed,
    );
  }
  final TextStyle _style =
      GoogleFonts.amiri(fontSize: 16, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'شكوي في : $person',
            style: _style,
          ),
          Text(
            'ملاحظات  : ',
            style: _style,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.teal.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              notes,
              style: _style,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  showIndicator(context);
                  final isOnline = await hasInternetConnection();
                  if (isOnline && context.mounted) {
                    onPressed!(id);
                    Navigator.pop(context);
                  } else {
                    if (context.mounted) {
                      Navigator.pop(context);
                      onConnectionError(context);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: Text(
                  'تم حلها',
                  style: _style,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
