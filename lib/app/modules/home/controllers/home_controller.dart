import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:productivity_tracker_app/app/modules/project/views/detail_project.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sp_util/sp_util.dart';

import '../../../data/models/detail_project.dart';
import '../../../data/providers/project_api_random.dart';
import '../../../data/providers/project_provider.dart';

import '../../../data/models/projects_model.dart';
import '../models/project1.dart';

class HomeController extends GetxController {
  final ProjectProvider _apiService = ProjectProvider();
  final project = Project(code: 0, data: []).obs;
  RxBool isRefreshing = false.obs; 
  var currentIndex = 0.obs;
  final count = 0.obs;
  RxBool isLoading = true.obs;
  // notifacis method
  void goToNotification() {
    Get.toNamed('/notification');
  }

  Future fetchDataFromApi() async {
    // print(isLoading);
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

// method button_navigator
  void changePage(int index) {
    currentIndex.value = index;
    print(SpUtil.getString('jwtToken'));
  }

  void changePagePm(int index) {
    currentIndex.value = index;
  }

  var detailProject = DetailProject(
      code: 0,
      data: DetailProjectData(
        name: '',
        description: '',
        pmName: '',
        createdAt: DateTime.now(),
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        status: false,
      )).obs;
  void fetchDetailProjectData(var id) {
    EasyLoading.show(status: 'loading...');
    ProjectProvider().detailProject(id).then((value) {
      // print(value.code);
      // print(value.data.name);
      // print(value.data.pmName);
      // print(value.data.status);
      // print(value.data.startDate);
      // print(value.data.endDate);
      // print(value.data.createdAt);
      // print(value.data.description);
      if (value.code == 200) {
        var data = {
          "code": 200,
          "data": {
            "name": value.data.name,
            "description": value.data.description,
            "pmName": value.data.pmName,
            "createdAt": DateFormat('yyyy-MM-dd').format(value.data.createdAt),
            "startDate": DateFormat('yyyy-MM-dd').format(value.data.startDate),
            "endDate": DateFormat('yyyy-MM-dd').format(value.data.endDate),
            "status": value.data.status
          }
        };
        print(data);
        DetailProject projectData = DetailProject.fromJson(data);
        detailProject.value = projectData;
        Get.to(DetailProjectView());
        EasyLoading.dismiss();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();

    // update();
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final ApiServices apiService = ApiServices();
  final RxList<Project1> projects = <Project1>[].obs;

// Metode untuk memuat data
  Future<List<Project1>> loadData() async {
    List<Project1> data = await apiService.fetchData1();
    projects.assignAll(data);
    refreshController.refreshCompleted();
    return data;
  }
}
