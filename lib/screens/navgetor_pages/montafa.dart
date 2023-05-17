import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/constants/constants.dart';
import '/models/user_data_model.dart';
import '/widgets/custom_Button.dart';
import '/widgets/custom_textfield.dart';

class Montafa extends StatefulWidget {
  const Montafa({Key? key}) : super(key: key);

  @override
  State<Montafa> createState() => _MontafaState();
}

class _MontafaState extends State<Montafa> {
  final user = UserDataModel();
  final GlobalKey<FormState> formKey = GlobalKey();

  CollectionReference userData =
      FirebaseFirestore.instance.collection(kUserDataCollection);
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
      'confirmed': false,
      'done': false,
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenOrientation = MediaQuery.of(context).orientation;
    // print(screenSize);
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
        width: double.infinity,
        alignment: Alignment.topCenter,
        child: Container(
          width: min(600, screenSize.width),
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
                  if (screenOrientation == Orientation.portrait || kIsWeb)
                    Column(
                      children: [
                        CustomTextField(
                          controller: user.nameController,
                          onChanged: (value) {
                            user.name = value;
                          },
                          hintText: 'الاسم',
                          prefixIcon: Icons.person,
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
                          prefixIcon: Icons.call,
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
                          prefixIcon: Icons.recent_actors_outlined,
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
                            }
                            return null;
                          },
                          prefixIcon: Icons.family_restroom,
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
                          prefixIcon: Icons.phone,
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
                          prefixIcon: Icons.home,
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
                          prefixIcon: Icons.question_mark,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        CustomTextField(
                          controller: user.notesController,
                          onChanged: (value) {
                            user.notes = value;
                          },
                          hintText: 'الملاحظات',
                          prefixIcon: Icons.note_add,
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: user.nameController,
                                onChanged: (value) {
                                  user.name = value;
                                },
                                hintText: 'الاسم',
                                prefixIcon: Icons.person,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'اِمْلَأْ هذة الخانة';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextField(
                                controller: user.nationalIdController,
                                onChanged: (value) {
                                  user.nationalId = value;
                                },
                                hintText: 'الرقم القومي',
                                validator: (value) {
                                  value = value!.trim();
                                  if (value.isEmpty) {
                                    return 'اِمْلَأْ هذة الخانة';
                                  } else if ((value[0] != '3' &&
                                          value[0] != '2') ||
                                      (value.length != 14) ||
                                      (value.contains(' ')) ||
                                      value.contains('-')) {
                                    return 'ادخل رقم قومي صحيح';
                                  }
                                  return null;
                                },
                                prefixIcon: Icons.recent_actors_outlined,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                controller: user.ageController,
                                onChanged: (value) {
                                  if (int.tryParse(value) != null) {
                                    user.age = int.parse(value);
                                  }
                                },
                                hintText: 'السن',
                                prefixIcon: Icons.call,
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
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextField(
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
                                prefixIcon: Icons.phone,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
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
                                  }
                                  return null;
                                },
                                prefixIcon: Icons.family_restroom,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextField(
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
                                prefixIcon: Icons.home,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
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
                                prefixIcon: Icons.question_mark,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: CustomTextField(
                                controller: user.notesController,
                                onChanged: (value) {
                                  user.notes = value;
                                },
                                hintText: 'الملاحظات',
                                prefixIcon: Icons.note_add,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  CustomButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await addUser();
                        user.clearAllTextFields();

                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: Colors.teal.shade50,
                                content: Text(
                                  'شكرا لك طلبك قيد التنفيذ',
                                  style: GoogleFonts.amiri(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Text(
                                      'حسناً',
                                      style: GoogleFonts.amiri(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                                actionsAlignment: MainAxisAlignment.center,
                              );
                            },
                          ).then((value) => Navigator.of(context).pop());
                        }
                      }
                    },
                    childText: 'حفظ',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
