import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gproject/constants/check_connectivity.dart';

class CustomCard extends StatelessWidget {
  final String userName;
  final String userAddress;
  final int userAge;
  final int userFamilyMembers;
  final String userPhone;
  final String userApplyReason;
  final bool confirmed;
  final String id;
  final void Function(String)? onPressed;
  final String text;

  CustomCard({
    super.key,
    required this.userName,
    required this.userAddress,
    required this.userAge,
    required this.userPhone,
    required this.userFamilyMembers,
    required this.userApplyReason,
    required this.confirmed,
    required this.id,
    this.onPressed,
    required this.text,
  });

  factory CustomCard.fromSnapshot(data,
      {required String bottonText, required void Function(String) onPressed}) {
    return CustomCard(
      userName: data['name'],
      userAddress: data['address'],
      userAge: data['age'],
      userFamilyMembers: data['familyMembers'],
      userPhone: data['phone'],
      userApplyReason: data['applyReason'],
      confirmed: data['confirmed'],
      id: data.id,
      onPressed: onPressed,
      text: bottonText,
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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الاسم : $userName',
                style: _style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text('السن: $userAge', style: _style),
              Text(
                'رقم الهاتف : $userPhone',
                style: _style,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text('عدد افراد الاسرة : $userFamilyMembers', style: _style),
              Text('العنوان : $userAddress', style: _style),
              const Text('سبب التقديم : '),
              Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  userApplyReason,
                  style: _style,
                ),
              ),
            ],
          ),
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
              text,
              style: _style,
            ),
          ),
        ],
      ),
    );
  }
}
