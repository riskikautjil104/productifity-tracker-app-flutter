import 'package:flutter/material.dart';

import '../../../widgets/navbarAppBar.dart';

import 'package:get/get.dart';

import '../controllers/statistik_controller.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../pages/detail_statistik_pm.dart';

class Project {
  final String projectName;
  final String dateRange;
  final String completionPercentage;
  final String dateAkhir;

  Project({
    required this.projectName,
    required this.dateRange,
    required this.completionPercentage,
    required this.dateAkhir,
  });
}

class StatistikPm extends StatelessWidget {
  StatistikPm({Key? key}) : super(key: key);

  final List<Project> projects = [
    Project(
      projectName: "Productifity Tarcker app mobile",
      dateRange: "01 Nov 2023 - 20 Des 2023",
      dateAkhir: "20 Des 2023",
      completionPercentage: "30%",
    ),
    Project(
      projectName: "Nama Proyek 2",
      dateRange: "01 Dec 2023 - 25 Jan 2024",
      dateAkhir: "25 Jan 2024",
      completionPercentage: "45%",
    ),
    Project(
      projectName: "Nama Proyek 3",
      dateRange: "15 Feb 2024 - 10 Apr 2024",
      dateAkhir: "10 Apr 2024",
      completionPercentage: "60%",
    ),
    Project(
      projectName: "Nama Proyek 4",
      dateRange: "01 May 2024 - 20 Jun 2024",
      dateAkhir: "10 Apr 2024",
      completionPercentage: "75%",
    ),
    Project(
      projectName: "Nama Proyek 5",
      dateRange: "10 Jul 2024 - 05 Sep 2024",
      dateAkhir: "10 Apr 2024",
      completionPercentage: "90%",
    ),
    Project(
      projectName: "Nama Proyek 6",
      dateRange: "10 Jul 2024 - 05 Sep 2024",
      dateAkhir: "10 Apr 2024",
      completionPercentage: "90%",
    ),
    Project(
      projectName: "Nama Proyek 7",
      dateRange: "10 Jul 2024 - 05 Sep 2024",
      dateAkhir: "10 Apr 2024",
      completionPercentage: "90%",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final StatistikController controller = Get.put(StatistikController());
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Statistik',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerText: true,
        gradient: LinearGradient(
          colors: [
            Color(0xFF197391),
            Color(0xFF0F9EEA),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      body: Obx(
        () {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    Project project = projects[index];
                    return Material(
                      elevation: 0.1,
                      child: InkWell(
                        splashColor: Color(0xFF197391),
                        onTap: () {
                          Get.to(
                            () => DetailStatistikPm(
                              project: project,
                              projectName: project.projectName,
                              dateRange: project.dateRange,
                              completionPercentage:
                                  project.completionPercentage,
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 60.0,
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0XFF292D32),
                                                Color(0XFF929197),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: CircularPercentIndicator(
                                            radius: 30.0,
                                            animation: true,
                                            animationDuration: 5200,
                                            lineWidth: 5.0,
                                            percent: 0.4,
                                            center: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: Colors.white,
                                              ),
                                              child: Center(
                                                  child: Text(project
                                                      .completionPercentage)),
                                            ),
                                            circularStrokeCap:
                                                CircularStrokeCap.butt,
                                            backgroundColor: Colors.transparent,
                                            progressColor: Color(0XFF2697F7),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        project.projectName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            project.dateRange,
                                            style: TextStyle(
                                              fontSize: 9,
                                            ),
                                          ),
                                          Text(
                                            project.dateAkhir,
                                            style: TextStyle(
                                              fontSize: 9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),

      //  ListView.builder(
      //   itemCount: projects.length,
      //   itemBuilder: (context, index) {
      //     Project project = projects[index];

      //     return Material(
      //       elevation: 0.1,
      //       child: InkWell(
      //         splashColor: Color(0xFF197391),
      //         onTap: () {
      //           Get.to(
      //             () => DetailStatistikPm(
      //               project: project,
      //               projectName: project.projectName,
      //               dateRange: project.dateRange,
      //               completionPercentage: project.completionPercentage,
      //             ),
      //           );
      //         },
      //         child: Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      //           child: Container(
      //             child: Column(
      //               children: [
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Stack(
      //       children: [
      //         Container(
      //           width: 60.0,
      //           height: 60.0,
      //           decoration: BoxDecoration(
      //             gradient: LinearGradient(
      //               colors: [
      //                 Color(0XFF292D32),
      //                 Color(0XFF929197),
      //               ],
      //               begin: Alignment.topCenter,
      //               end: Alignment.bottomCenter,
      //             ),
      //             shape: BoxShape.circle,
      //           ),
      //           child: CircularPercentIndicator(
      //             radius: 30.0,
      //             animation: true,
      //             animationDuration: 5200,
      //             lineWidth: 5.0,
      //             percent: 0.4,
      //             center: Container(
      //               width: 50.0,
      //               height: 50.0,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(30.0),
      //                 color: Colors.white,
      //               ),
      //               child: Center(
      //                   child:
      //                       Text(project.completionPercentage)),
      //             ),
      //             circularStrokeCap: CircularStrokeCap.butt,
      //             backgroundColor: Colors.transparent,
      //             progressColor: Color(0XFF2697F7),
      //           ),
      //         ),
      //       ],
      //     ),
      //     SizedBox(
      //       width: 8,
      //     ),
      //     Flexible(
      //       child: Text(
      //         project.projectName,
      //         style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //         ),
      //         overflow: TextOverflow.ellipsis,
      //         softWrap: true,
      //         maxLines: 2,
      //       ),
      //     ),
      //     SizedBox(
      //       width: 20,
      //     ),
      //     Container(
      //       width: MediaQuery.of(context).size.width * 0.4,
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           Text(
      //             project.dateRange,
      //             style: TextStyle(
      //               fontSize: 9,
      //             ),
      //           ),
      //           Text(
      //             project.dateAkhir,
      //             style: TextStyle(
      //               fontSize: 9,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
