import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/project/controllers/project_controller.dart';
import 'package:productivity_tracker_app/app/modules/project/views/crew_projects_view.dart';
import 'package:productivity_tracker_app/app/modules/project/views/pm_projects_view.dart';
import 'package:productivity_tracker_app/app/modules/home/pages/home_view_pm.dart';
import 'package:productivity_tracker_app/app/modules/statistik/views/statistik_pm.dart';

import '../controllers/home_controller.dart';

// import '../widget/namaTask_widget.dart';

import '../../../widgets/button_navigatorBar.dart';

import '../pages/home_crew_page.dart';

import '../../statistik/views/statistik_view.dart';
import 'package:sp_util/sp_util.dart';

class HomeView extends GetView<HomeController> {
  // const HomeView({Key? key}) : super(key: key);
  final ProjectController crewProjectController = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    final HomeController homeCrewController = Get.put(HomeController());
    return Scaffold(
      body: Obx(
        () {
          switch (homeCrewController.currentIndex.value) {
            case 0:
              return (SpUtil.getString('userType') == 'Crew')
                  ? HomeViewCrew()
                  : HomePm();
            case 1:
              return (SpUtil.getString('userType') == 'Crew')
                  ? CrewProjectView()
                  : PMProjectView();
            case 2:
              return (SpUtil.getString('userType') == 'Crew')
                  ? StatistikView()
                  : StatistikPm();
            default:
              return Container(
                child: Center(
                  child: Text(
                    "Not Found 404",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
          }
        },
      ),
      bottomNavigationBar: NavigatorButton(homeController: homeCrewController),
    );
  }
}
