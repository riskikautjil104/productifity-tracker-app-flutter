import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/project/views/add_target_view.dart';
import 'package:productivity_tracker_app/app/modules/task/views/add_task_view.dart';
import 'package:productivity_tracker_app/app/modules/project/widgets/card_target.dart';
import 'package:productivity_tracker_app/app/widgets/navbarAppBar.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/project_controller.dart';

// ignore: must_be_immutable
class TargetView extends GetView<ProjectController> {
  TargetView({super.key});

  @override
  Widget build(BuildContext context) {
    // ProjectController controller = Get.find<ProjectController>();
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQuerywidth = MediaQuery.of(context).size.width;

    final appBar = GradientAppBar(
      centerText: true,
      title: Text('Target'),
      gradient: LinearGradient(
        colors: [
          Color(0xFF197391),
          Color(0xFF0F9EEA),
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      actions: (SpUtil.getString('userType') == 'crew')
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
        child: Center(
          child: Column(
            children: [
              Text(
                'Jhon Smith',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Design',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFB1B1B1)),
              ),
              SizedBox(height: 33),
              CardTarget(
                  namaProject: 'Week 1',
                  toDos: 'Design',
                  date: '15 Nov 2023 - 22 Nov 2023',
                  progress: '1/8'),
              SizedBox(height: 10),
              CardTarget(
                  namaProject: 'Week 1',
                  toDos: 'Design',
                  date: '15 Nov 2023 - 22 Nov 2023',
                  progress: '1/8'),
              SizedBox(height: 10),
              CardTarget(
                  namaProject: 'Week 1',
                  toDos: 'Design',
                  date: '15 Nov 2023 - 22 Nov 2023',
                  progress: '1/8'),
              SizedBox(height: 10),
              CardTarget(
                  namaProject: 'Week 1',
                  toDos: 'Design',
                  date: '15 Nov 2023 - 22 Nov 2023',
                  progress: '1/8'),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: (SpUtil.getString('userType') == 'crew')
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                Get.to(AddTaskView());
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
