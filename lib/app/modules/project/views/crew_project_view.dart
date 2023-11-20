import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/widgets/navbarAppBar.dart';

import '../controllers/project_controller.dart';

// ignore: must_be_immutable
class CrewProjectView extends GetView<CrewProjectController> {
  CrewProjectController controller = Get.find<CrewProjectController>();

  CrewProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          centerText: true,
          title: Text('Project'),
          gradient: LinearGradient(
            colors: [
              Color(0xFF197391),
              Color(0xFF0F9EEA),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 31),
                width: 1000,
                height: 300,
                child: Obx(
                  () => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GetBuilder<CrewProjectController>(
                          builder: (controller) {
                            return ListView.builder(
                              itemCount: controller.project.value.data.length,
                              shrinkWrap: true, // Menggunakan shrinkWrap
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                Datum datum =
                                    controller.project.value.data[index];
                                return Column(
                                  children: [
                                    CartProject(
                                      namaProject: datum.name.toString(),
                                      date: datum.endDate
                                          .toString()
                                          .substring(0, 10),
                                      progress:
                                          datum.progress.toString() + ' %',
                                      percent: datum.progress.toDouble() / 100,
                                      // percent: 75.5 / 100,
                                    ),
                                    SizedBox(height: 11)
                                  ],
                                );
                              },
                            );
                          },
                        ),
                ),
              ),
              Text(
                'Completed',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              Container(
                margin: EdgeInsets.only(top: 11),
                width: 1000,
                height: 310,
                child: Obx(
                  () => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : GetBuilder<CrewProjectController>(
                          builder: (controller) {
                            return ListView.builder(
                              itemCount: controller.project.value.data.length,
                              shrinkWrap: true, // Menggunakan shrinkWrap
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                Datum datum =
                                    controller.project.value.data[index];
                                return Column(
                                  children: [
                                    CartProject(
                                      namaProject: datum.name.toString(),
                                      date: datum.endDate
                                          .toString()
                                          .substring(0, 10),
                                      progress:
                                          datum.progress.toString() + ' %',
                                      percent: datum.progress.toDouble() / 100,
                                      // percent: 75.5 / 100,
                                    ),
                                    SizedBox(height: 11)
                                  ],
                                );
                              },
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ));
  }
}
