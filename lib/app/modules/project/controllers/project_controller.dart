// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
import 'package:intl/intl.dart';
// import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
// import 'package:sp_util/sp_util.dart';

class ProjectController extends GetxController {
  TextEditingController projectName = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController emails = TextEditingController();

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

  void post() {
    // List<String> x = emails.text.split(' ');
    // print('Slicing by space: $splittedBySpace');
    List<String> x = emails.text.split(RegExp(r'\s|,| \s'));
    // Memotong string berdasarkan koma
    // List<String> x = emails.text.split(',');
    // print('Slicing by comma: $splittedByComma');
    print(x);
  }
  // create project
  // void post() {
  //   if (projectName.text.isEmpty) {
  //     Get.snackbar(
  //       'Failed',
  //       'Username cannot be empty',
  //       backgroundColor: Colors.red.shade500,
  //       colorText: Colors.white,
  //     );
  //   } else if (emails.text.isEmpty) {
  //     Get.snackbar(
  //       'Failed',
  //       'Email cannot be empty',
  //       backgroundColor: Colors.red.shade500,
  //       colorText: Colors.white,
  //     );
  //   } else if (startDate.text.isEmpty) {
  //     Get.snackbar(
  //       'Failed',
  //       'Password cannot be empty',
  //       backgroundColor: Colors.red.shade500,
  //       colorText: Colors.white,
  //     );
  //   } else if (endDate.text.isEmpty) {
  //     Get.snackbar(
  //       'Failed',
  //       'Confrim Password cannot be empty',
  //       backgroundColor: Colors.red.shade500,
  //       colorText: Colors.white,
  //     );
  //   } else if (description.text.isEmpty) {
  //     Get.snackbar(
  //       'Failed',
  //       'Confrim Password cannot be empty',
  //       backgroundColor: Colors.red.shade500,
  //       colorText: Colors.white,
  //     );
  //   } else {
  //     EasyLoading.show(status: 'loading...');
  //     var data = {
  //       "name": projectName.text,
  //       "description": description.text,
  //       "startDate": startDate,
  //       "endDate": endDate,
  //       "emails": emails.text,
  //     };

  //     ProjectProvider().createProject(data).then((value) {
  //       // final data = jsonDecode(value.body) as Map<String, dynamic>;
  //       // print(value.body);
  //       if (value.statusCode == 200) {
  //         Get.snackbar('Successful',
  //             'Your account has been successfully registered Please Login',
  //             backgroundColor: Colors.green.shade500,
  //             colorText: Colors.white,
  //             duration: Duration(seconds: 4));
  //         // username.clear();
  //         // email.clear();
  //         // password.clear();
  //         // confirmPassword.clear();
  //         Get.toNamed('/login');
  //         EasyLoading.dismiss();
  //       } else if (value.statusCode == 400) {
  //         print(value.body['Errors']);
  //         EasyLoading.dismiss();
  //         Get.snackbar(
  //           'Failed',
  //           value.body['Errors'],
  //           backgroundColor: Colors.red.shade500,
  //           colorText: Colors.white,
  //         );
  //       }
  //     });
  //     // EasyLoading.dismiss();
  //   }
  // }
}

// {
//   "name": "Create Project 3",
//   "description": "Tes Create Project 3",
//   "startDate": "2023-11-22T10:48:37.399Z",
//   "endDate": "2023-11-22T10:48:37.399Z",
//   "emails": [
//     "haidilisnaini@gmail.com"
//   ]
// }
