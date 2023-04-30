import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gproject/models/user_data_model.dart';
import '/widgets/custom_Button.dart';
import '/widgets/custom_textfield.dart';

class Montafa extends StatefulWidget {
  Montafa({Key? key}) : super(key: key);

  @override
  State<Montafa> createState() => _MontafaState();
}

class _MontafaState extends State<Montafa> {
  final user = UserDataModel();
  final GlobalKey<FormState> formKey = GlobalKey();

  CollectionReference userData =
      FirebaseFirestore.instance.collection('userData');
  Future<void> addUser() {
    return userData.add({
      'name': user.name,
      'age': user.age,
      'nationalId': user.nationalId,
      'familyMembers': user.familyMembers,
      'phone': user.phone,
      'address': user.address,
      'applyReason': user.applyReason,
      'notes': user.notes,
      'createdAt': DateTime.now(),
      'conformed': false,
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
          "المٌنتفع",
          style: GoogleFonts.amiri(fontSize: 30, color: Colors.black),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(50),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          // reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: user.nameController,
                  onChanged: (value) {
                    user.name = value;
                  },
                  hintText: 'الاسم',
                  prefixIcon: const Icon(Icons.person),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: user.ageController,
                  onChanged: (value) {
                    if (int.tryParse(value) != null) {
                      user.age = int.parse(value);
                    }
                  },
                  hintText: 'السن',
                  prefixIcon: const Icon(
                    Icons.add,
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if (int.tryParse(value) == null) {
                      return 'ادخل رقم صحيح';
                    } else if (int.parse(value) < 16) {
                      return 'يجب ان تكون فوق ال 16 عاما';
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  controller: user.nationalIdController,
                  onChanged: (value) {
                    user.nationalId = value;
                  },
                  hintText: 'الرقم القومي',
                  validator: (value) {
                    value = value!.trim();

                    if (value.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if ((value[0] != '3' && value[0] != '2') ||
                        (value.length != 14) ||
                        (value.contains(' ')) ||
                        value.contains('-')) {
                      return 'ادخل رقم قومي صحيح';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.recent_actors_outlined,
                  ),
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  controller: user.familyMembersController,
                  onChanged: (value) {
                    if (int.tryParse(value) != null) {
                      user.familyMembers = int.parse(value);
                    }
                  },
                  hintText: 'عدد افراد الاسرة',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if (int.tryParse(value) == null) {
                      return 'ادخل رقم صحيح';
                    } else if (int.parse(value) < 0 || int.parse(value) > 6) {
                      return 'عذرا لا نقدر علي مساعدة هذا العدد من الافراد';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.family_restroom,
                  ),
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  controller: user.phoneController,
                  onChanged: (value) {
                    user.phone = value;
                  },
                  hintText: 'رقم الهاتف',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    } else if (value.length != 11 ||
                        value.contains('-') ||
                        value.contains(' ')) {
                      return 'ادخل رقم صحيح';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.phone,
                  ),
                  keyboardType: TextInputType.number,
                ),
                CustomTextField(
                  controller: user.addressController,
                  onChanged: (value) {
                    user.address = value;
                  },
                  hintText: 'العنوان (كامل)',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.home,
                  ),
                ),
                CustomTextField(
                  controller: user.applyReasonController,
                  onChanged: (value) {
                    user.applyReason = value;
                  },
                  hintText: 'سبب التقديم',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'اِمْلَأْ هذة الخانة';
                    }
                    return null;
                  },
                  prefixIcon: const Icon(
                    Icons.question_mark,
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                CustomTextField(
                  controller: user.notesController,
                  onChanged: (value) {
                    user.notes = value;
                  },
                  hintText: 'الملاحظات',
                  prefixIcon: const Icon(
                    Icons.note_add,
                  ),
                ),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      addUser();
                      // user.clearAllTextFields();

                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 161, 236, 246),
                              content: Text(
                                'شكرا لك طلبك قيد التنفيذ',
                                style: GoogleFonts.amiri(
                                  fontSize: 22,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'حسناً',
                                    style: GoogleFonts.amiri(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              ],
                              actionsAlignment: MainAxisAlignment.center);
                        },
                      );
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(
                      //     content: Text(
                      //       'شكرا لك طلبك قيد التنفيذ',
                      //       style: GoogleFonts.amiri(
                      //         fontSize: 24,
                      //         color: Colors.black,
                      //       ),
                      //     ),
                      //     duration: Duration(seconds: 5),
                      //     backgroundColor: Color.fromARGB(255, 161, 236, 246),
                      //     padding: EdgeInsets.all(16),
                      //   ),
                      // );
                    }
                  },
                  childText: 'حفظ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
