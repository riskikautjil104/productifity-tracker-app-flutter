// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
import 'package:intl/intl.dart';
// import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
// import 'package:sp_util/sp_util.dart';

class ProjectController extends GetxController {
  final ProjectProvider _apiService = ProjectProvider();
  final project = Project(code: 0, data: []).obs;
  RxBool isLoading = true.obs;
  RxInt tabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  Future fetchDataFromApi() async {
    print(isLoading);
    try {
      final data = await _apiService.fetchData();
      project.value = data;
      print(project.value.data.length);
      // if (data.data.length == 0) {
      //   print('data kosong');
      // } else {
      //   print('data ada');
      // }
      isLoading = false.obs;
      print(isLoading);
    } catch (e) {
      // Handle error
      print(e.toString());
    } finally {
      isLoading = false.obs;
    }
    // print(isLoading);
  }

//  task
  var taskIsChecked = false.obs;

  void taskToggleCheckbox(var value) {
    taskIsChecked.value = value;
  }

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
      selectedEndDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
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
      selectedEndDate.value = DateFormat('dd-mm-yyyy').format(pickedDate);
      // print(pickedDate);
    }
  }
}
