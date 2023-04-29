import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String userName;
  final String userAddress;
  final int userAge;
  final int userFamilyMembers;

  CustomCard({
    super.key,
    required this.userName,
    required this.userAddress,
    required this.userAge,
    required this.userFamilyMembers,
  });

  factory CustomCard.fromSnapshot(data) {
    return CustomCard(
      userName: data['name'],
      userAddress: data['address'],
      userAge: data['age'],
      userFamilyMembers: data['familyMembers'],
    );
  }
  final TextStyle _style =
      GoogleFonts.amiri(fontSize: 18, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الاسم : $userName', style: _style),
          Text('السن: $userAge', style: _style),
          Text('عدد افراد الاسرة : $userFamilyMembers', style: _style),
          Text('العنوان : $userAddress', style: _style),
        ],
      ),
    );
  }
}
