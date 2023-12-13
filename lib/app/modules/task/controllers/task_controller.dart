// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/Week.dart';
import 'package:productivity_tracker_app/core/utils/EndPoints.dart';
// import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
import 'package:sp_util/sp_util.dart';

class TasksController extends GetxController {
  TextEditingController taskName = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print(SpUtil.getString('idProject'));
    getWeek();
  }

  // var dropdownItems = <String>[].obs;
  // var selectedValue = ''.obs;

  // Future<void> fetchData() async {
  //   try {
  //     print(SpUtil.getString('idProject'));
  //     print(SpUtil.getString('username'));
  //     final apiService = ProjectProvider();
  //     List<String> names = await apiService.fetchNamesTargetFromApi();
  //     dropdownItems.value = names;
  //     selectedValue.value = dropdownItems.isNotEmpty ? dropdownItems.first : '';
  //     SpUtil.remove('idProject');
  //   } catch (e) {
  //     print('Terjadi kesalahan: $e');
  //   }
  // }

  var weeks = <Week>[].obs;
  var selectedWeek = Week(week: 0).obs;

  Future<void> getWeek() async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');
    try {
      final response = await GetConnect()
          .get(EndPoints.baseUrl + 'week-target/$name/get-all-target', query: {
        'projectId': SpUtil.getString('idProject')
      }, headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      });
      print(response);

      if (response.status.isOk) {
        // Mendapatkan list objek Week dari data respons JSON
        weeks.value = (response.body['data'] as List<dynamic>)
            .map((weekJson) => Week.fromJson(weekJson))
            .toList();

        // Memastikan bahwa selectedWeek ada di dalam list weeks
        if (!weeks.contains(selectedWeek.value)) {
          selectedWeek.value = weeks.isNotEmpty ? weeks.first : Week(week: 0);
        }
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
