import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/project/controllers/project_controller.dart';

class AddProjectView extends GetView<ProjectController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Add Project',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Container(
                width: 41,
                height: 41,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.amber,
                  border: Border.all(color: Color(0xFFE8ECF4)),
                ),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  controller.post();
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(children: [
                  TextFormField(
                    controller: controller.projectName,
                    decoration: InputDecoration(
                      labelText: 'Project Name',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  TextFormField(
                    minLines: 6,
                    maxLines: 100,
                    // onTapOutside: (event) => ,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      // hintText: 'Description (opsional)',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'Description (opsional)',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                        text: controller.selectedEndDate.value),
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: () => controller.pickStartDate(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  Obx(
                    () => TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: controller.selectedStartDate.value),
                      decoration: InputDecoration(
                        labelText: 'End Date',
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_month),
                          onPressed: () => controller.pickEndDate(context),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  TextFormField(
                    controller: controller.emails,
                    minLines: 6,
                    maxLines: 100,
                    // onTapOutside: (event) => ,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      // hintText: 'Description (opsional)',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignLabelWithHint: true,
                      labelText: 'Choose who’s on the project',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  // SizedBox(height: 54),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         'Cancel',
                  //         style: TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w700,
                  //             color: Colors.black),
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         'Save',
                  //         style: TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.w700,
                  //             color: Colors.black),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ]),
              ),
            ),
          )),
    );
  }
}
