import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// import '../widget/namaTask_widget.dart';

import '../../../widgets/button_navigatorBar.dart';

import '../pages/home_crew_page.dart';

import '../../statistik/views/statistik_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final HomeController homeCrewController = Get.put(HomeController());
    return Scaffold(
      body: Obx(
        () {
          switch (homeCrewController.currentIndex.value) {
            case 0:
              return HomeViewCrew();
            case 1:
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
            case 2:
              return StatistikView();
            default:
              return HomeViewCrew();
          }
        },
      ),
      bottomNavigationBar: NavigatorButton(homeController: homeCrewController),
    );
  }
}
