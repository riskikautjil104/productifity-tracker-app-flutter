import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/project/widgets/list_text.dart';
import 'package:productivity_tracker_app/app/widgets/card_nama_task.dart';
// import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/widgets/navbarAppBar.dart';

import '../controllers/project_controller.dart';

// ignore: must_be_immutable
class DetailProjectView extends GetView<ProjectController> {
  ProjectController controller = Get.find<ProjectController>();
  // ProjectController controller = Get.put(ProjectController());

  DetailProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQuerywidth = MediaQuery.of(context).size.width;
    final appBar = GradientAppBar(
      centerText: true,
      title: Text('Project Name'),
      gradient: LinearGradient(
        colors: [
          Color(0xFF197391),
          Color(0xFF0F9EEA),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    );

    final bodyHeight = mediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: appBar,
        body: SizedBox(
          height: bodyHeight,
          width: mediaQuerywidth,
          child: Column(
            children: [
              ListText(
                bodyHeight: bodyHeight,
                mediaQuerywidth: mediaQuerywidth,
                text1: 'Added by',
                text2: 'Jason Carlos, on 2 November 2023',
              ),
              ListText(
                bodyHeight: bodyHeight,
                mediaQuerywidth: mediaQuerywidth,
                text1: 'Assigned to',
                text2: 'Jhon Smith',
              ),
              ListText(
                bodyHeight: bodyHeight,
                mediaQuerywidth: mediaQuerywidth,
                text1: 'Runs from',
                text2: 'Thu, Nov 2 - Tue, Nov 7',
              ),
              ListText(
                bodyHeight: bodyHeight,
                mediaQuerywidth: mediaQuerywidth,
                text1: 'Status',
                text2: 'On-Progres',
              ),
              SizedBox(
                height: mediaQueryHeight * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () => controller.tabIndex.value = 0,
                            child: Obx(() {
                              return Text(
                                'Target',
                                style: TextStyle(
                                  color: (controller.tabIndex.value == 0)
                                      ? Colors.blue
                                      : Colors.black,
                                ),
                              );
                            }),
                          ),
                          TextButton(
                            onPressed: () => controller.tabIndex.value = 1,
                            child: Obx(() {
                              return Text(
                                'Target',
                                style: TextStyle(
                                    color: (controller.tabIndex.value == 1)
                                        ? Colors.blue
                                        : Colors.black),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        switch (controller.tabIndex.value) {
                          case 0:
                            return Container(
                              // color: Colors.green,
                              child: Center(
                                child: Column(
                                  children: [
                                    Text(
                                      'On-Progress',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 11),
                                    CardTask(
                                      namaProject: 'Nama Task',
                                      toDos: 'toDos',
                                      date: '07 Nov 2023',
                                      progress: 'progress',
                                    ),
                                    CardTask(
                                      namaProject: 'Nama Task',
                                      toDos: 'toDos',
                                      date: '07 Nov 2023',
                                      progress: 'progress',
                                    ),
                                    CardTask(
                                      namaProject: 'Nama Task',
                                      toDos: 'toDos',
                                      date: '07 Nov 2023',
                                      progress: 'progress',
                                    ),
                                    SizedBox(height: 11),
                                    Text(
                                      'Completed',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 11),
                                    CardTask(
                                      namaProject: 'Nama Task',
                                      toDos: 'toDos',
                                      date: '07 Nov 2023',
                                      progress: 'progress',
                                    ),
                                    CardTask(
                                      namaProject: 'Nama Task',
                                      toDos: 'toDos',
                                      date: '07 Nov 2023',
                                      progress: 'progress',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          case 1:
                            return Container(
                              color: Colors.blue,
                              child: Center(
                                child: Text('Tab 2 Content'),
                              ),
                            );
                          default:
                            return Container();
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
