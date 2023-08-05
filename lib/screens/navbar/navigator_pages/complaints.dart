import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gproject/constants/check_connectivity.dart';

import '/constants/constants.dart';
import '/widgets/custom_Button.dart';
import '/widgets/custom_textfield.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  String? _selectedItem;
  final TextEditingController _notesController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  final List<String> _items = ['متطوع', 'مُنتفع', 'مُتبرع', 'شكوى عامة'];
  CollectionReference complaints =
      FirebaseFirestore.instance.collection(kComplaintsCollection);

  Future<void> addComplaints() {
    return complaints.add({
      'person': _selectedItem ?? 'شكوى عامة',
      'notes': _notesController.text,
      'createdAt': DateTime.now(),
      'solved': false,
    }).then((_) => Navigator.of(context).pop());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade100,
        centerTitle: true,
        title: Text(
          'شكاوي',
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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  '"ابلغنا عن أي مشاكل أو مخاوف تواجهها"',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amiri(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: DropdownButton<String>(
                    hint: const Text("اختار الشخص"),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.teal,
                    ),
                    iconSize: 32,
                    dropdownColor: Colors.teal.shade50,
                    style: GoogleFonts.amiri(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    value: _selectedItem,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    },
                    items: _items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.amiri(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: CustomTextField(
                    controller: _notesController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'اِمْلَأْ هذة الخانة';
                      }
                      return null;
                    },
                    hintText: 'الملاحظات (اضف اسم الشخص)',
                    prefixIcon: Icons.note_add,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  childText: 'حفظ',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      showIndicator(context);
                      bool isOnline = await hasInternetConnection();
                      if (isOnline) {
                        await addComplaints();
                        _notesController.clear();
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor: Colors.teal.shade50,
                                content: Text(
                                  'شكرا لك سنعمل علي حل مشكلتك',
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
                          );
                        }
                      } else {
                        if (!mounted) return;
                        Navigator.pop(context);
                        onConnectionError(context);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
