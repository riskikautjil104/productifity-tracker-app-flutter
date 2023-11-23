import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

import '../../../data/providers/project_api_random.dart';
import '../controllers/home_controller.dart';

// import '../widget/listNamaProject_widget.dart';

// import '../widget/buttonNavigator.dart';

import '../../../widgets/navbarAppBar.dart';

import '../models/project1.dart';

import '../widget/cart_project.dart';

import '../../../modules/project/controllers/project_controller.dart';

class HomePm extends GetView<HomeController> {
  final ApiServices apiService = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navbar
      appBar: GradientAppBar(
        title: Text(
          SpUtil.getString('username').toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF197391),
            Color(0xFF0F9EEA),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            // Navigasi ke halaman detail profil
            Get.toNamed('/profile');
          },
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 28.48,
              width: 29.69,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset("assets/image/logoRadya.png"),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          SizedBox(width: 13),
          IconButton(
            onPressed: () {
              // controller.goToNotification();
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          // await apiService.fetchData();
        },
        child: FutureBuilder<List<Project1>?>(
          future: apiService.fetchData1(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Color(0XFF0F9EEA),
              ));
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error1: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Tidak ada data'),
              );
            } else {
              List<Project1> projects = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 27,
                      ),
                      child: Text(
                        "List Project",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      height: 540,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          Project1 project = projects[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: CartProject(
                              onTap: () =>
                                  controller.fetchDetailProjectData(project.id),
                              namaProject: project.name, // Ganti properti
                              date: DateFormat('yyyy-MM-dd').format(project
                                  .endDate), // Konversi DateTime ke String
                              progress:
                                  '${project.progress}%', // Ganti properti
                              percent: project.progress / 100, // Ganti properti
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
