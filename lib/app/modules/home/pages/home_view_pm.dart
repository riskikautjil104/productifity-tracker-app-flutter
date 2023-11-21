import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import '../../../data/providers/project_api_random.dart';
import '../controllers/home_controller.dart';

// import '../widget/listNamaProject_widget.dart';

// import '../widget/buttonNavigator.dart';

import '../../../widgets/navbarAppBar.dart';

import '../models/project.dart';
import '../widget/cart_project.dart';

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
          await apiService.fetchData();
        },
        child: FutureBuilder<List<Project>>(
          future: apiService.fetchData(),
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
              List<Project> projects = snapshot.data!;

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
                          Project project = projects[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: CartProject(
                              namaProject: project.namaProject,
                              date: project.date.toString(),
                              progress: project.percend.toString() + "%",
                              percent: project.percend / 100,
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

      // SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           horizontal: 15,
      //           vertical: 27,
      //         ),
      //         child: Text(
      //           "List Project",
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //           textAlign: TextAlign.left,
      //         ),
      //       ),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: EdgeInsets.symmetric(horizontal: 5.0),
      //         height: 540,
      //         child: ListView(
      //           shrinkWrap: true,
      //           physics: ClampingScrollPhysics(),
      //           children: [
      //             CartProject(
      //               namaProject:
      //                   'Nama Project sangat panjang sekali sumbah deh gak ada lawan',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //             CartProject(
      //               namaProject: 'Nama Project',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //             CartProject(
      //               namaProject: 'Nama Project',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //             CartProject(
      //               namaProject: 'Nama Project',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //             CartProject(
      //               namaProject: 'Nama Project',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //             CartProject(
      //               namaProject: 'Nama Project',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //             CartProject(
      //               namaProject: 'Nama Project',
      //               date: '12 Nov 2023',
      //               progress: '90%',
      //               percent: 0.9,
      //             ),
      //             SizedBox(
      //               height: 9,
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
