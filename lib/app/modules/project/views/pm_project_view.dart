import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/home/widget/cart_project.dart';
import 'package:productivity_tracker_app/app/widgets/navbarAppBar.dart';

import '../controllers/project_controller.dart';

class PMProjectView extends GetView<CrewProjectController> {
  // CrewProjectController controller = Get.put(CrewProjectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerText: true,
        title: Text('PM PROJECT'),
        gradient: LinearGradient(
          colors: [
            Color(0xFF197391),
            Color(0xFF0F9EEA),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              CartProject(
                namaProject: 'Nama Project',
                date: '10/10/2023',
                progress: '1/100',
                percent: 0.2,
              ),
              SizedBox(height: 11),
              CartProject(
                namaProject: 'Nama Project',
                date: '10/10/2023',
                progress: '1/100',
                percent: 0.2,
              ),
              SizedBox(height: 11),
              CartProject(
                namaProject: 'Nama Project',
                date: '10/10/2023',
                progress: '1/100',
                percent: 0.2,
              ),
              SizedBox(height: 73),
              Text(
                'Completed',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12),
              CartProject(
                namaProject: 'Nama Project',
                date: '10/10/2023',
                progress: '1/100',
                percent: 0.2,
              ),
              SizedBox(height: 11),
              CartProject(
                namaProject: 'Nama Project',
                date: '10/10/2023',
                progress: '1/100',
                percent: 0.2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
