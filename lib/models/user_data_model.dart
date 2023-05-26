import 'package:flutter/material.dart';

class UserDataModel {
  String? name, nationalId, phone, address, applyReason, notes;
  int? age, familyMembers;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController applyReasonController = TextEditingController();
  TextEditingController familyMembersController = TextEditingController();

  UserDataModel({
    this.name,
    this.age,
    this.nationalId,
    this.familyMembers,
    this.phone,
    this.address,
    this.applyReason,
    this.notes = 'none',
  });

  void clearAllTextFields() {
    nameController.clear();
    ageController.clear();
    nationalIdController.clear();
    phoneController.clear();
    addressController.clear();
    notesController.clear();
    applyReasonController.clear();
    familyMembersController.clear();
  }

  void disposeControllers() {
    nameController.dispose();
    ageController.dispose();
    nationalIdController.dispose();
    phoneController.dispose();
    addressController.dispose();
    notesController.dispose();
    applyReasonController.dispose();
    familyMembersController.dispose();
  }
}
