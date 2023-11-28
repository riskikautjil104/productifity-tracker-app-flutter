import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:productivity_tracker_app/app/modules/login/controllers/login_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sp_util/sp_util.dart';

import '../controllers/home_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

// import '../widget/namaTask_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

// import '../widget/buttonNavigator.dart';

import '../../../widgets/navbarAppBar.dart';

// import '../models/project.dart';
import '../widget/cart_project.dart';

import '../widget/cart_nama_task.dart';

// import '../../../widgets/button_navigatorBar.dart';

// import '../../../data/providers/project_api_random.dart';

// import '../models/project1.dart';
import '../../../data/providers/home_provider.dart';
import '../../../data/models/home_model.dart';

import 'package:lottie/lottie.dart';

class HomeViewCrew extends GetView<HomeController> {
  final LoginController loginController = Get.put(LoginController());
  final ApiServices apiService = ApiServices();
  final CarouselController _carouselController = CarouselController();
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
      body: SmartRefresher(
        controller: controller.refreshController,
        enablePullDown: true,
        header: ClassicHeader(
          refreshingText: 'Memuat...',
          completeText: 'Selesai',
          failedText: 'Gagal',
          idleText: 'Tarik ke bawah untuk refresh',
        ),
        onRefresh: () async {
          await controller.loadData();
          // await apiService.fetchData1();
        },
        child: FutureBuilder<List<ProjectHomeCrew>?>(
          future: apiService.fetchDataHome(),
          // future: controller.loadData(),
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
              List<ProjectHomeCrew> projects = snapshot.data!;

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
                            percent: projects.isEmpty
                                ? 0.0
                                : (projects.first.productivity * 100.0)
                                    .clamp(0.0, 1.0),
                            centerText:
                                "${(projects.first.productivity).toStringAsFixed(0)}00%",
                            // centerText: "70%",
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
                            percent: projects.isEmpty
                                ? 0.0
                                : (projects.first.contribution / 100.0)
                                    .clamp(0.0, 1.0),
                            center: Text(
                              "${(projects.first.contribution / 100).toStringAsFixed(0)}%",
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
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      height: 400.0,
                      viewportFraction: 1.0,
                      autoPlay: projects.length > 1,
                      autoPlayAnimationDuration: Duration(seconds: 5),
                    ),
                    items: projects.map(
                      (project) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         DetailPage(project: project),
                                //   ),
                                // );
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
                                          namaProject:
                                              project.name, // Ganti properti
                                          date: DateFormat('yyyy-MM-dd').format(
                                              project
                                                  .endDate), // Konversi DateTime ke String
                                          progress:
                                              '${project.progress}%', // Ganti properti
                                          percent: project.progress /
                                              100, // Ganti properti
                                          leadingIcon: Icons.arrow_back_ios,
                                          leadingIconOnPressed: () {
                                            _carouselController.previousPage();
                                          },
                                          trailingIcon: Icons.arrow_forward_ios,
                                          tarilingIconOnPressed: () {
                                            _carouselController.nextPage();
                                          },
                                          onTap: () {},
                                        ),
                                        SizedBox(
                                          height: 22,
                                        ),

                                        Column(
                                          children: [
                                            // Bagian "New Task"
                                            Text("Task 🚀👨‍💻"),
                                            if ((project.tasks ?? [])
                                                .isNotEmpty)
                                              for (var task in project.tasks!)
                                                CartNamaTask(
                                                  namaProject: project.name,
                                                  toDos: task.name,
                                                  date: DateFormat('yyyy-MM-dd')
                                                      .format(task
                                                          .createdAt), // Sesuaikan dengan tanggal tugas
                                                  progress: task.status
                                                      .toString(), // Sesuaikan dengan progress tugas
                                                ),
                                            if ((project.tasks ?? []).isEmpty)
                                              SizedBox(height: 10),
                                            // Bagian "New Task" kosong
                                            if ((project.tasks ?? []).isEmpty)
                                              Container(
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 223, 223, 223),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Center(
                                                  child: Container(
                                                    height: 70,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              223,
                                                              223,
                                                              223),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Lottie.asset(
                                                        'assets/lottie/notfound.json'),
                                                    // child: Text("New Task Kosong"),
                                                  ),
                                                ),
                                              ),
                                            SizedBox(height: 8),
                                            // Bagian "Completed"
                                            if ((project.tasks ?? [])
                                                .isNotEmpty)
                                              ListView(
                                                shrinkWrap: true,
                                                physics:
                                                    ClampingScrollPhysics(),
                                                children: [
                                                  Center(
                                                    child:
                                                        Text("Task Completed✅"),
                                                  ),
                                                  for (var task
                                                      in project.tasks!)
                                                    CartNamaTask(
                                                      namaProject: project.name,
                                                      toDos: task.name,
                                                      date: DateFormat(
                                                              'yyyy-MM-dd')
                                                          .format(task
                                                              .createdAt), // Sesuaikan dengan tanggal tugas
                                                      progress: task.status
                                                          .toString(), // Sesuaikan dengan progress tugas
                                                    ),
                                                ],
                                              ),
                                            // Bagian "Completed" kosong
                                            if ((project.tasks ?? []).isEmpty)
                                              Center(
                                                child: Text(
                                                    "Task Completed Kosong"),
                                              ),
                                            Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 223, 223, 223),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: LottieBuilder.asset(
                                                  'assets/lottie/notfound.json'),
                                            ),
                                          ],
                                        ),

                                        // Container(
                                        //   height: 70,
                                        // decoration: BoxDecoration(
                                        //   color: const Color.fromARGB(
                                        //       255, 223, 223, 223),
                                        //   borderRadius:
                                        //       BorderRadius.circular(10),
                                        // ),
                                        // width:
                                        //     MediaQuery.of(context).size.width,
                                        // child: Lottie.asset(
                                        //     'assets/lottie/notfound.json'),
                                        // ),
                                        // Animation - 1700913385823.json
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

// class DetailPage extends StatelessWidget {
//   // final Project project; // Mengganti tipe data menjadi Project

//   // Mengganti parameter konstruktor dan menambahkan this.project
//   DetailPage({required this.project});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Detail Page for Project:'),
//             SizedBox(height: 10),
//             Text('Project Name: ${project.namaProject}'),
//             Text('Project Date: ${project.date}'),
//             Text('Project Progress: ${project.percend}'),
//             // Tambahan informasi proyek lainnya
//           ],
//         ),
//       ),
//     );
//   }
// }
