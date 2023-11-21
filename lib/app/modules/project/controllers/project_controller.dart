// import 'dart:convert';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
// import 'package:productivity_tracker_app/app/data/providers/project_provider.dart';
// import 'package:sp_util/sp_util.dart';

class CrewProjectController extends GetxController {
  final ProjectProvider _apiService = ProjectProvider();
  final project = Project(code: 0, data: []).obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchDataFromApi();
    super.onInit();
  }

  void fetchDataFromApi() async {
    // print(isLoading);
    // print(project.value);
    try {
      final data = await _apiService.fetchData();
      project.value = data;
      // if (data.data.length == 0) {
      //   print('data kosong');
      // } else {
      //   print('data ada');
      // }
      // print(data.code);
      isLoading = false.obs;
    } catch (e) {
      // Handle error
      print(e.toString());
    } finally {
      isLoading = false.obs;
    }
    // print(isLoading);
  }
}
