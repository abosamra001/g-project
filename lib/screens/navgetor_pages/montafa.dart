import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '/constants/check_connectivity.dart';
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
  final _user = UserDataModel();

  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  CollectionReference userData =
      FirebaseFirestore.instance.collection(kUserDataCollection);
  Future<void> addUser() {
    return userData.add({
      'name': _user.name,
      'age': _user.age,
      'nationalId': _user.nationalId,
      'familyMembers': _user.familyMembers,
      'phone': _user.phone,
      'address': _user.address,
      'applyReason': _user.applyReason,
      'notes': _user.notes,
      'createdAt': DateTime.now(),
      'confirmed': false,
      'done': false,
    }).then((value) => Navigator.pop(context));
  }

  @override
  void dispose() {
    _user.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final screenOrientation = MediaQuery.orientationOf(context);
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
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: Column(
                children: [
                  if (screenOrientation == Orientation.portrait || kIsWeb)
                    portraitMode(_user)
                  else
                    landScapeMode(_user),
                  CustomButton(
                    childText: 'حفظ',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        showIndicator(context);
                        bool isOnline = await hasInternetConnection();

                        if (isOnline && mounted) {
                          await addUser();
                          if (!mounted) return;
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
                        } else {
                          Navigator.pop(context);
                          onConnectionError(context);
                        }
                      } else {
                        _autovalidateMode = AutovalidateMode.onUserInteraction;
                      }
                    },
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

Widget portraitMode(UserDataModel user) {
  return Column(
    children: [
      CustomTextField(
        controller: user.nameController,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          user.name = value;
        },
        hintText: 'الاسم',
        prefixIcon: Icons.person,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s'))
        ],
        validator: (value) {
          if (value!.isEmpty) {
            return 'اِمْلَأْ هذة الخانة';
          }
          return null;
        },
      ),
      CustomTextField(
        controller: user.ageController,
        textInputAction: TextInputAction.next,
        onChanged: (value) {
          if (int.tryParse(value) != null) {
            user.age = int.parse(value);
          }
        },
        hintText: 'السن',
        prefixIcon: Icons.person_add,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
        textInputAction: TextInputAction.next,
        controller: user.nationalIdController,
        onChanged: (value) {
          user.nationalId = value;
        },
        hintText: 'الرقم القومي',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          value = value!.trim();

          if (value.isEmpty) {
            return 'اِمْلَأْ هذة الخانة';
          } else if ((value.length != 14) ||
              (value[0] != '3' && value[0] != '2')) {
            return 'ادخل رقم قومي صحيح';
          }
          return null;
        },
        prefixIcon: Icons.recent_actors_outlined,
        keyboardType: TextInputType.number,
      ),
      CustomTextField(
        textInputAction: TextInputAction.next,
        controller: user.familyMembersController,
        onChanged: (value) {
          if (int.tryParse(value) != null) {
            user.familyMembers = int.parse(value);
          }
        },
        hintText: 'عدد افراد الاسرة',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
      ), // عدد افراد الاسرة
      CustomTextField(
        textInputAction: TextInputAction.next,
        controller: user.phoneController,
        onChanged: (value) {
          user.phone = value;
        },
        hintText: 'رقم الهاتف',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        validator: (value) {
          if (value!.isEmpty) {
            return 'اِمْلَأْ هذة الخانة';
          } else if (!RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
            return 'ادخل رقم صحيح';
          }
          return null;
        },
        prefixIcon: Icons.phone,
        keyboardType: TextInputType.number,
      ),
      CustomTextField(
        textInputAction: TextInputAction.next,
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
        textInputAction: TextInputAction.next,
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
        textInputAction: TextInputAction.done,
        controller: user.notesController,
        onChanged: (value) {
          user.notes = value;
        },
        hintText: 'الملاحظات',
        prefixIcon: Icons.note_add,
      ),
    ],
  );
}

Widget landScapeMode(UserDataModel user) {
  return Column(
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
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]+|\s'))
              ],
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                value = value!.trim();
                if (value.isEmpty) {
                  return 'اِمْلَأْ هذة الخانة';
                } else if ((value[0] != '3' && value[0] != '2') ||
                    (value.length != 14)) {
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value!.isEmpty) {
                  return 'اِمْلَأْ هذة الخانة';
                } else if (!RegExp(r"^\+?0[0-9]{10}$").hasMatch(value)) {
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
  );
}
