import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  final String userName;
  final String userAddress;
  final int userAge;
  final int userFamilyMembers;
  final String userPhone;
  final String userApplyReason;
  final bool confirmed;
  final String id;
  void Function(String)? onPressed;
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
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 165,
                    child: Text(
                      'الاسم : $userName',
                      style: _style,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text('السن: $userAge', style: _style),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 165,
                    child: Text(
                      'رقم الهاتف : $userPhone',
                      style: _style,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text('عدد افراد الاسرة : $userFamilyMembers', style: _style),
                ],
              ),
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
            onPressed: () {
              onPressed!(id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            child: Text(
              text,
              style: _style,
            ),
          ),
          // confirmed == false
          //     ? ElevatedButton(
          //         onPressed: () {
          //           updateUserData!(id);
          //         },
          //         child: const Text('confirm'),
          //       )
          //     : ElevatedButton(
          //         onPressed: () {},
          //         style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.teal,
          //         ),
          //         child: Text(
          //           'تم التبرع',
          //           style: _style,
          //         ),
          //       ),
        ],
      ),
    );
  }
}

// class AdminCustomCard extends StatelessWidget {
//   final String userName;
//   final String userAddress;
//   final int userAge;
//   final int userFamilyMembers;
//   final String userPhone;
//   final String userApplyReason;
//   final String userNationalId;
//   final String userNotes;
//   final bool confirmed;
//   final String id;
//   void Function(String)? updateUserData;
// 
//   AdminCustomCard({
//     super.key,
//     required this.userName,
//     required this.userAddress,
//     required this.userAge,
//     required this.userPhone,
//     required this.userFamilyMembers,
//     required this.userApplyReason,
//     required this.userNationalId,
//     required this.userNotes,
//     required this.confirmed,
//     required this.id,
//     this.updateUserData,
//   });
// 
//   factory AdminCustomCard.fromSnapshot(data, void Function(String) update) {
//     return AdminCustomCard(
//       userName: data['name'],
//       userAddress: data['address'],
//       userAge: data['age'],
//       userFamilyMembers: data['familyMembers'],
//       userPhone: data['phone'],
//       userApplyReason: data['applyReason'],
//       userNationalId: data['nationalId'],
//       userNotes: data['notes'],
//       confirmed: data['confirmed'],
//       id: data.id,
//       updateUserData: update,
//     );
//   }
//   final TextStyle _style =
//       GoogleFonts.amiri(fontSize: 16, fontWeight: FontWeight.w600);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Colors.teal.shade50,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Column(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text('الاسم : $userName', style: _style),
//                   const SizedBox(width: 20),
//                   Text('السن: $userAge', style: _style),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     'رقم الهاتف : $userPhone',
//                     style: _style,
//                   ),
//                   const SizedBox(width: 20),
//                   Text('عدد افراد الاسرة : $userFamilyMembers', style: _style),
//                 ],
//               ),
//               Text(
//                 'الرقم القومي : $userNationalId',
//                 style: _style,
//               ),
//               Text('العنوان : $userAddress', style: _style),
//               Text('سبب التقديم : ', style: _style),
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.teal,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Text(userApplyReason),
//               ),
//               Text('ملاحظات : $userNotes'),
//             ],
//           ),
//           confirmed == false
//               ? ElevatedButton(
//                   onPressed: () {
//                     updateUserData!(id);
//                   },
//                   child: const Text('confirm'),
//                 )
//               : const SizedBox(),
//         ],
//       ),
//     );
//   }
// }
