import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/login/controllers/login_controller.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/home_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

// import '../widget/namaTask_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

// import '../widget/buttonNavigator.dart';

import '../../../widgets/navbarAppBar.dart';

import '../models/project.dart';
import '../widget/cart_project.dart';

import '../widget/cart_nama_task.dart';

// import '../../../widgets/button_navigatorBar.dart';

import '../../../data/providers/project_api_random.dart';

class HomeViewCrew extends GetView<HomeController> {
  final LoginController loginController = Get.put(LoginController());
  final ApiServices apiService = ApiServices();
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      // navbar
      appBar: GradientAppBar(
        title: Text(
          SpUtil.getString('username').toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
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
              controller.goToNotification();
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Project>>(
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

            return Column(
              children: [
                // Bagian atas
                Container(
                  width: 375,
                  height: 185,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CIrcularStatistik(
                          radius: 45.0,
                          lineWidth: 13.0,
                          animation: true,
                          animationDuration: 5000,
                          percent: 0.7,
                          centerText: "70%",
                          centerTextColor: Color(0XFF197492),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Productivity",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0XFF197492),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 113,
                          width: 1,
                          color: Color(0XFFB1B1B1),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 13.0,
                          animation: true,
                          animationDuration: 5000,
                          percent: 0.3,
                          center: Text(
                            "30%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Color(0XFF0F9EEA)),
                          ),
                          footer: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Contribution",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: Color(0XFF2699FB),
                        ),
                      ],
                    ),
                  ),
                ),

                // CarouselSlider

                CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(seconds: 5),
                  ),
                  items: projects.map((project) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(project: project),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: ListView(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              children: [
                                Column(
                                  children: [
                                    CartProject(
                                      date: project.date
                                          .toRadixString(DateTime.daysPerWeek),
                                      progress:
                                          project.percend.toString() + '%',
                                      namaProject: project.namaProject,
                                      leadingIcon: Icons.arrow_back_ios,
                                      trailingIcon: Icons.arrow_forward_ios,
                                      percent: project.percend / 100,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage(project: project),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Text(
                                      "New Task",
                                      style: TextStyle(
                                        color: Color(0XFF898989),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    CartNamaTask(
                                      namaProject: project.namaTask,
                                      toDos: 'design halaman home',
                                      date: '06 Nov 2023',
                                      progress: '30%',
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Completed",
                                      style: TextStyle(
                                        color: Color(0XFF898989),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    ListView(
                                      shrinkWrap: true,
                                      physics: ClampingScrollPhysics(),
                                      children: [
                                        CartNamaTask(
                                          namaProject: 'Nama Task 1',
                                          toDos: 'To-Dos 1',
                                          date: '05 Nov 2023',
                                          progress: '100%',
                                        ),
                                        CartNamaTask(
                                          namaProject: 'Nama Task 2',
                                          toDos: 'To-Dos 1',
                                          date: '05 Nov 2023',
                                          progress: '100%',
                                        ),
                                        CartNamaTask(
                                          namaProject: 'Nama Task 2',
                                          toDos: 'To-Dos 1',
                                          date: '05 Nov 2023',
                                          progress: '100%',
                                        ),
                                        CartNamaTask(
                                          namaProject: 'Nama Task 2',
                                          toDos: 'To-Dos 1',
                                          date: '05 Nov 2023',
                                          progress: '100%',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }, 
                  ).toList(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class CIrcularStatistik extends StatelessWidget {
  final double radius;
  final double lineWidth;
  final bool animation;
  final int animationDuration;
  final double percent;
  final String centerText;
  final Color centerTextColor;
  final FontWeight centerTextFontWeight;
  final double centerTextFontSize;
  final String footerText;
  final double footerTextFontSize;
  final Color progressColor;

  const CIrcularStatistik({
    Key? key,
    required this.radius,
    required this.lineWidth,
    required this.animation,
    required this.animationDuration,
    required this.percent,
    required this.centerText,
    required this.centerTextColor,
    required this.centerTextFontWeight,
    required this.centerTextFontSize,
    required this.footerText,
    required this.footerTextFontSize,
    required this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: lineWidth,
      animation: animation,
      animationDuration: animationDuration,
      percent: percent,
      center: Text(
        centerText,
        style: TextStyle(
          fontWeight: centerTextFontWeight,
          fontSize: centerTextFontSize,
          color: centerTextColor,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          footerText,
          style: TextStyle(
            fontSize: footerTextFontSize,
          ),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: progressColor,
    );
  }
}

class DetailPage extends StatelessWidget {
  final Project project; // Mengganti tipe data menjadi Project

  // Mengganti parameter konstruktor dan menambahkan this.project
  DetailPage({required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detail Page for Project:'),
            SizedBox(height: 10),
            Text('Project Name: ${project.namaProject}'),
            Text('Project Date: ${project.date}'),
            Text('Project Progress: ${project.percend}'),
            // Tambahan informasi proyek lainnya
          ],
        ),
      ),
    );
  }
}
