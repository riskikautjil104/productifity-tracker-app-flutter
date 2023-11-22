import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/modules/project/views/add_project_view.dart';
import 'package:productivity_tracker_app/app/widgets/navbarAppBar.dart';

import '../controllers/project_controller.dart';

// ignore: must_be_immutable
class PMProjectView extends GetView<ProjectController> {
  final ProjectController controller = Get.put(ProjectController());
  // ProjectController controller = Get.find<ProjectController>();

  PMProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    // final mediaQueryHeight = MediaQuery.of(context).size.height;
    final appBar = GradientAppBar(
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
    );

    // final bodyHeight = mediaQueryHeight -
    //     appBar.preferredSize.height -
    //     MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: Obx(
        () => controller.isLoading.value == false
            ? SingleChildScrollView(
                padding: EdgeInsets.only(top: 31),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    GetBuilder<ProjectController>(
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.project.value.data.length,
                          shrinkWrap: true, // Menggunakan shrinkWrap
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Projects datum =
                                controller.project.value.data[index];
                            return Column(
                              children: [
                                (datum.status == false)
                                    ? CartProject(
                                        namaProject: datum.name.toString(),
                                        date: datum.endDate
                                            .toString()
                                            .substring(0, 10),
                                        progress:
                                            datum.progress.toString() + ' %',
                                        percent:
                                            datum.progress.toDouble() / 100,
                                        // percent: 75.5 / 100,
                                      )
                                    : Container(),
                                SizedBox(height: 11)
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 11),
                    (controller.project.value.data.length <= 0)
                        ? Text(
                            'Tidak Ada Project',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w700),
                          )
                        : Text(
                            'Completed',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w700),
                          ),
                    SizedBox(height: 11),
                    GetBuilder<ProjectController>(
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.project.value.data.length,
                          shrinkWrap: true, // Menggunakan shrinkWrap
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            Projects datum =
                                controller.project.value.data[index];
                            return Column(
                              children: [
                                (datum.status == true)
                                    ? CartProject(
                                        namaProject: datum.name.toString(),
                                        date: datum.endDate
                                            .toString()
                                            .substring(0, 10),
                                        progress:
                                            datum.progress.toString() + ' %',
                                        percent:
                                            datum.progress.toDouble() / 100,
                                        // percent: 75.5 / 100,
                                      )
                                    : Container(),
                                SizedBox(height: 11)
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddProjectView());
        },
        // foregroundColor: customizations[index].$1,
        backgroundColor: Color(0xFF0F9EEA),
        // shape: customizations[index].$3,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

// 

