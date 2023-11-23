import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:productivity_tracker_app/app/modules/project/widgets/list_text.dart';
import 'package:productivity_tracker_app/app/widgets/card_nama_task.dart';
// import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/widgets/navbarAppBar.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/project_controller.dart';

// ignore: must_be_immutable
class DetailProjectView extends GetView<ProjectController> {
  // ProjectController detailProjectcontroller = Get.find<ProjectController>();
  ProjectController dcontroller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQuerywidth = MediaQuery.of(context).size.width;
    final appBar = GradientAppBar(
      centerText: true,
      title: Text(controller.detailProject.value.data.name),
      gradient: LinearGradient(
        colors: [
          Color(0xFF197391),
          Color(0xFF0F9EEA),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      actions: (SpUtil.getString('userType') == 'Crew')
          ? []
          : <Widget>[
              PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                  itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  // Get.to(const EditProfileView());
                } else if (value == 1) {
                  Get.dialog(
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(20.0),
                        width: mediaQuerywidth * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('This project will be permanently deleted'),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.back(); // Menutup modal
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Accept',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }),
            ],
    );

    final bodyHeight = mediaQueryHeight -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 31),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: bodyHeight,
            width: mediaQuerywidth,
            child: Column(
              children: [
                ListText(
                  bodyHeight: bodyHeight,
                  mediaQuerywidth: mediaQuerywidth,
                  text1: 'Added by',
                  text2: controller.detailProject.value.data.pmName,
                ),
                ListText(
                  bodyHeight: bodyHeight,
                  mediaQuerywidth: mediaQuerywidth,
                  text1: 'Assigned to',
                  text2: "${SpUtil.getString('username')}",
                ),
                ListText(
                  bodyHeight: bodyHeight,
                  mediaQuerywidth: mediaQuerywidth,
                  text1: 'Runs from',
                  text2:
                      "${DateFormat('yyyy-MM-dd').format(controller.detailProject.value.data.startDate)} - ${DateFormat('yyyy-MM-dd').format(controller.detailProject.value.data.endDate)}",
                ),
                ListText(
                  bodyHeight: bodyHeight,
                  mediaQuerywidth: mediaQuerywidth,
                  text1: 'Status',
                  text2: (controller.detailProject.value.data.status == false)
                      ? 'On-Progress'
                      : 'Finish',
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
                                    ],
                                  ),
                                ),
                              );
                            case 1:
                              return Container(
                                child: Center(
                                  child: Text('Target View'),
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
          ),
        ));
  }
}
