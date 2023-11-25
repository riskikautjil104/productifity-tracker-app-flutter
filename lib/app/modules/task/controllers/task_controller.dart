// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TasksController extends GetxController {
  TextEditingController taskName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController emails = TextEditingController();


  // add project
  var selectedEndDate = ''.obs;
  var selectedStartDate = ''.obs;

  void pickStartDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2121),
    );

    if (pickedDate != null) {
      selectedStartDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  void pickEndDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2121),
    );

    if (pickedDate != null) {
      selectedEndDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

}
