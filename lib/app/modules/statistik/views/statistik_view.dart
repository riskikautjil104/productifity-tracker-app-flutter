import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// import '../controllers/statistik_controller.dart';

import '../../../data/models/statistik_models.dart';
import '../../../data/providers/statistik_provider.dart';
import '../controllers/statistik_controller.dart';
import '../widget/statistik_circular.dart';

import '../../../widgets/navbarAppBar.dart';

class StatistikView extends GetView<StatistikController> {
  const StatistikView({Key? key});

  @override
  Widget build(BuildContext context) {
    final ApiServicess apiServicess = ApiServicess();
    final TextEditingController contributionController =
        TextEditingController();

    void sendData() async {
      // Dapatkan nilai dari TextField
      int contribution = int.tryParse(contributionController.text) ?? 0;

      // Panggil metode postData dari ApiService
      var response = await apiServicess.postData(contribution);

      if (response.statusCode == 200) {
        print('Berhasil terhubung: ${response.body}');
        Get.snackbar('Berhasil', '${response.body}',
            backgroundColor: Colors.green[200]);
      } else {
        Get.snackbar('error', 'Error: Add working time between 1 to 8 hours.',
            backgroundColor: Colors.red[200]);
        print('Gagal terhubung. Status code: ${response.statusCode}');
      }
    }

    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Statistik',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
      body: FutureBuilder<List<StatistikDataDay>?>(
        future: apiServicess.fetchDataStatistikDay(),
        // future: controller.loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0XFF0F9EEA),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error1: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          } else {
            List<StatistikDataDay> dataMonth = snapshot.data!;

            // Ambil nilai dari data pertama (anda mungkin perlu mengatur logika sesuai kebutuhan anda)
            double productivityPercentage =
                dataMonth.first.productivity.toDouble();
            double contributionPercentage =
                dataMonth.first.contribution.toDouble();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 50,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            TombolStatistik(
                              textButton: "Day",
                              isSelected: true,
                              // onPress: () {
                              //   Get.to(() => StatistikView());
                              // },
                            ),
                            TombolStatistik(
                              textButton: "Last Week",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => LastWeek());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Last Month",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => LastMonth());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Quarter",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => Quarter());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ... widget lainnya
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 200,
                    child: ListView(
                      children: [
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              productivityPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(productivityPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF197492),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Productivity",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF197492),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: contributionController,
                      keyboardType: TextInputType.number,
                      // decoration: InputDecoration(labelText: 'Input (int)'),
                      decoration: InputDecoration(
                        labelText: 'Masukkan Contribution',
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: sendData,
                      child: Text('Kirim Data'),
                    ),
                  ),
                  // ... widget lainnya
                ],
              ),
            );
          }
        },
      ),

      // SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           vertical: 35,
      //           horizontal: 10,
      //         ),
      //         child: Container(
      //           height: 50,
      //           child: Center(
      //             child: ListView(
      //               scrollDirection: Axis.horizontal,
      //               children: [
      //                 TombolStatistik(
      //                   textButton: "Day",
      //                   isSelected: true,
      //                 ),
      //                 TombolStatistik(
      //                   textButton: "Last Week",
      //                   isSelected: false,
      //                   onPress: () {
      //                     Get.to(() => LastWeek());
      //                   },
      //                 ),
      //                 TombolStatistik(
      //                   textButton: "Last Month",
      //                   isSelected: false,
      //                   onPress: () {
      //                     Get.to(() => LastMonth());
      //                   },
      //                 ),
      //                 TombolStatistik(
      //                   textButton: "Quarter",
      //                   isSelected: false,
      //                   onPress: () {
      //                     Get.to(() => Quarter());
      //                   },
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: EdgeInsets.symmetric(horizontal: 5.0),
      //         height: 200,
      //         // color: Colors.amber,
      //         child: ListView(
      //           children: [
      //             CIrcularStatistik(
      //               radius: 60.0,
      //               lineWidth: 15.0,
      //               animation: true,
      //               animationDuration: 5000,
      //               percent: 0.1,
      //               centerText: "30%",
      //               centerTextColor: Color(0XFFF197492),
      //               centerTextFontWeight: FontWeight.bold,
      //               centerTextFontSize: 20.0,
      //               footerText: "Productifity",
      //               footerTextFontSize: 15.0,
      //               progressColor: Color(0xFFF197492),
      //             ),
      //           ],
      //         ),
      //         // akhir listview
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(10.0),
      //         child: TextField(
      //           controller: null,
      //           keyboardType: TextInputType.number,
      //           // decoration: InputDecoration(labelText: 'Input (int)'),
      //           decoration: InputDecoration(
      //             labelText: 'Masukkan Contribution',
      //           ),
      //         ),
      //       ),
      //       Center(
      //         child: ElevatedButton(
      //           onPressed: () {},
      //           child: Text('Kirim Data'),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class LastWeek extends GetView<StatistikController> {
  @override
  Widget build(BuildContext context) {
    final ApiServicess apiServicess = ApiServicess();
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Statistik',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
      body: FutureBuilder<List<StatistikDataLastWeek>?>(
        future: apiServicess.fetchDataStatistikLastWeek(),
        // future: controller.loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0XFF0F9EEA),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error1: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          } else {
            List<StatistikDataLastWeek> dataMonth = snapshot.data!;

            // Ambil nilai dari data pertama (anda mungkin perlu mengatur logika sesuai kebutuhan anda)
            double productivityPercentage =
                dataMonth.first.productivity.toDouble();
            double contributionPercentage =
                dataMonth.first.contribution.toDouble();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 50,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            TombolStatistik(
                              textButton: "Day",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => StatistikView());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Last Week",
                              isSelected: true,
                            ),
                            TombolStatistik(
                              textButton: "Last Month",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => LastMonth());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Quarter",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => Quarter());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ... widget lainnya
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 540,
                    child: ListView(
                      children: [
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              productivityPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(productivityPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF197492),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Productivity",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF197492),
                        ),
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              contributionPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(contributionPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF2699FB),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Contribution",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF2699FB),
                        ),
                      ],
                    ),
                  ),

                  // ... widget lainnya
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class LastMonth extends GetView<StatistikController> {
  @override
  Widget build(BuildContext context) {
    final ApiServicess apiServicess = ApiServicess();
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Statistik',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
      body:
          // SmartRefresher(
          //   controller: controller.refreshController,
          //   enablePullDown: true,
          //   header: ClassicHeader(
          //     refreshingText: 'Memuat...',
          //     completeText: 'Selesai',
          //     failedText: 'Gagal',
          //     idleText: 'Tarik ke bawah untuk refresh',
          //   ),
          //   onRefresh: () async {
          //     await controller.loadData();
          //     // await apiService.fetchData1();
          //   },
          FutureBuilder<List<StatistikDataMonth>?>(
        future: apiServicess.fetchDataStatistikMonthDay(),
        // future: controller.loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0XFF0F9EEA),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error1: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          } else {
            List<StatistikDataMonth> dataMonth = snapshot.data!;

            // Ambil nilai dari data pertama (anda mungkin perlu mengatur logika sesuai kebutuhan anda)
            double productivityPercentage =
                dataMonth.first.productivity.toDouble();
            double contributionPercentage =
                dataMonth.first.contribution.toDouble();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 50,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            TombolStatistik(
                              textButton: "Day",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => StatistikView());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Last Week",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => LastWeek());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Last Month",
                              isSelected: true,
                            ),
                            TombolStatistik(
                              textButton: "Quarter",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => Quarter());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ... widget lainnya
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 540,
                    child: ListView(
                      children: [
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              productivityPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(productivityPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF197492),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Productivity",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF197492),
                        ),
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              contributionPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(contributionPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF2699FB),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Contribution",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF2699FB),
                        ),
                      ],
                    ),
                  ),

                  // ... widget lainnya
                ],
              ),
            );
          }
        },
      ),
      // ),

      // SingleChildScrollView(
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      // padding: const EdgeInsets.symmetric(
      //   vertical: 35,
      //   horizontal: 10,
      // ),
      //       child: Container(
      //         height: 50,
      //         child: Center(
      //           child: ListView(
      //             scrollDirection: Axis.horizontal,
      // children: [
      //   TombolStatistik(
      //     textButton: "Day",
      //     isSelected: false,
      //     onPress: () {
      //       Get.to(() => StatistikView());
      //     },
      //   ),
      //   TombolStatistik(
      //     textButton: "Last Week",
      //     isSelected: false,
      //     onPress: () {
      //       Get.to(() => LastWeek());
      //     },
      //   ),
      //   TombolStatistik(
      //     textButton: "Last Month",
      //     isSelected: true,
      //     // onPress: () {
      //     //   Get.to(() => LastWeek());
      //     // },
      //   ),
      //   TombolStatistik(
      //     textButton: "Quarter",
      //     isSelected: false,
      //     onPress: () {
      //       Get.to(() => Quarter());
      //     },
      //   ),
      // ],
      //           ),
      //           ),
      //         ),
      //       ),
      // Container(
      //   width: MediaQuery.of(context).size.width,
      //   margin: EdgeInsets.symmetric(horizontal: 5.0),
      //   height: 540,
      //   // color: Colors.amber,
      //   child: ListView(
      //     children: [
      //       CIrcularStatistik(
      //         radius: 60.0,
      //         lineWidth: 15.0,
      //         animation: true,
      //         animationDuration: 5000,
      //         percent: 0.1,
      //         centerText: "30%",
      //         centerTextColor: Color(0XFFF197492),
      //         centerTextFontWeight: FontWeight.bold,
      //         centerTextFontSize: 20.0,
      //         footerText: "Productifity",
      //         footerTextFontSize: 15.0,
      //         progressColor: Color(0xFFF197492),
      //       ),
      //       CIrcularStatistik(
      //         radius: 60.0,
      //         lineWidth: 15.0,
      //         animation: true,
      //         animationDuration: 5000,
      //         percent: 0.1,
      //         centerText: "30%",
      //         centerTextColor: Color(0XFFF2699FB),
      //         centerTextFontWeight: FontWeight.bold,
      //         centerTextFontSize: 20.0,
      //         footerText: "Contribution",
      //         footerTextFontSize: 15.0,
      //         progressColor: Color(0xFFF2699FB),
      //       ),
      //     ],
      //   ),
      //   // akhir listview
      // ),
      //     ],
      //   ),
      // ),
    );
  }
}

class Quarter extends GetView<StatistikController> {
  @override
  Widget build(BuildContext context) {
    final ApiServicess apiServicess = ApiServicess();
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          'Statistik',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
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
      body: FutureBuilder<List<StatistikDataQuarter>?>(
        future: apiServicess.fetchDataStatistikQuarter(),
        // future: controller.loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0XFF0F9EEA),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error1: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          } else {
            List<StatistikDataQuarter> dataMonth = snapshot.data!;

            // Ambil nilai dari data pertama (anda mungkin perlu mengatur logika sesuai kebutuhan anda)
            double productivityPercentage =
                dataMonth.first.productivity.toDouble();
            double contributionPercentage =
                dataMonth.first.contribution.toDouble();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 35,
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 50,
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            TombolStatistik(
                              textButton: "Day",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => StatistikView());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Last Week",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => LastWeek());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Last Month",
                              isSelected: false,
                              onPress: () {
                                Get.to(() => Quarter());
                              },
                            ),
                            TombolStatistik(
                              textButton: "Quarter",
                              isSelected: true,
                              // onPress: () {
                              //   Get.to(() => Quarter());
                              // },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ... widget lainnya
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    height: 540,
                    child: ListView(
                      children: [
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              productivityPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(productivityPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF197492),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Productivity",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF197492),
                        ),
                        CIrcularStatistik(
                          radius: 60.0,
                          lineWidth: 15.0,
                          animation: true,
                          animationDuration: 5000,
                          percent:
                              contributionPercentage, // Gunakan nilai dari API
                          centerText:
                              "${(contributionPercentage * 100).toStringAsFixed(1)}%",
                          centerTextColor: Color(0XFFF2699FB),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "Contribution",
                          footerTextFontSize: 15.0,
                          progressColor: Color(0xFFF2699FB),
                        ),
                      ],
                    ),
                  ),

                  // ... widget lainnya
                ],
              ),
            );
          }
        },
      ),

      // SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.symmetric(
      //           vertical: 35,
      //           horizontal: 10,
      //         ),
      //         child: Container(
      //           height: 50,
      //           child: Center(
      //             child: ListView(
      //               scrollDirection: Axis.horizontal,
      //               children: [
      //                 TombolStatistik(
      //                   textButton: "Day",
      //                   isSelected: false,
      //                   onPress: () {
      //                     Get.to(() => StatistikView());
      //                   },
      //                 ),
      //                 TombolStatistik(
      //                   textButton: "Last Week",
      //                   isSelected: false,
      //                   onPress: () {
      //                     Get.to(() => LastWeek());
      //                   },
      //                 ),
      //                 TombolStatistik(
      //                   textButton: "Last Month",
      //                   isSelected: false,
      //                   onPress: () {
      //                     Get.to(() => LastMonth());
      //                   },
      //                 ),
      //                 TombolStatistik(
      //                   textButton: "Quarter",
      //                   isSelected: true,
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: EdgeInsets.symmetric(horizontal: 5.0),
      //         height: 540,
      //         // color: Colors.amber,
      //         child: ListView(
      //           children: [
      //             CIrcularStatistik(
      //               radius: 60.0,
      //               lineWidth: 15.0,
      //               animation: true,
      //               animationDuration: 5000,
      //               percent: 0.1,
      //               centerText: "30%",
      //               centerTextColor: Color(0XFFF197492),
      //               centerTextFontWeight: FontWeight.bold,
      //               centerTextFontSize: 20.0,
      //               footerText: "Productifity",
      //               footerTextFontSize: 15.0,
      //               progressColor: Color(0xFFF197492),
      //             ),
      //             CIrcularStatistik(
      //               radius: 60.0,
      //               lineWidth: 15.0,
      //               animation: true,
      //               animationDuration: 5000,
      //               percent: 0.1,
      //               centerText: "30%",
      //               centerTextColor: Color(0XFFF2699FB),
      //               centerTextFontWeight: FontWeight.bold,
      //               centerTextFontSize: 20.0,
      //               footerText: "Contribution",
      //               footerTextFontSize: 15.0,
      //               progressColor: Color(0xFFF2699FB),
      //             ),
      //           ],
      //         ),
      //         // akhir listview
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// class StatistikView extends GetView<StatistikController> {
//   const StatistikView({Key? key});

//   // TextEditingController inputController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController contributionInputController = TextEditingController();
//     final ApiServicess apiService = ApiServicess();

//     Future<void> _postData(int inputData) async {
//       try {
//         final response = await apiService.postData(inputData);

//         if (response.status.hasError) {
//           // Handle error response from API
//           print('Error: ${response.statusText}');
//         } else {
//           // Handle successful response from API
//           print('Response: ${response.body}');
//         }
//       } catch (e) {
//         // Handle exception
//         print('Exception: $e');
//       }
//     }

//     return Scaffold(
//       appBar: GradientAppBar(
//         title: Text(
//           'Statistik',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 20,
//           ),
//         ),
//         centerText: true,
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF197391),
//             Color(0xFF0F9EEA),
//           ],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 35,
//                 horizontal: 10,
//               ),
//               child: Container(
//                 height: 50,
//                 child: Obx(() {
//                   return Center(
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         TombolStatistik(
//                           textButton: 'Yesterday',
//                           isSelected:
//                               StatistikController.to.selectedButtonType.value ==
//                                   'Yesterday',
//                         ),
//                         TombolStatistik(
//                           textButton: 'Last Week',
//                           isSelected:
//                               StatistikController.to.selectedButtonType.value ==
//                                   'Last Week',
//                         ),
//                         TombolStatistik(
//                           textButton: 'Last Month',
//                           isSelected:
//                               StatistikController.to.selectedButtonType.value ==
//                                   'Last Month',
//                         ),
//                         TombolStatistik(
//                           textButton: 'Quarter',
//                           isSelected:
//                               StatistikController.to.selectedButtonType.value ==
//                                   'Quarter',
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               margin: EdgeInsets.symmetric(horizontal: 5.0),
//               height: 540,
//               child: Obx(() {
//                 final selectedButtonType =
//                     StatistikController.to.selectedButtonType.value;
//                 final productivityPercent =
//                     StatistikController.to.productivityPercent.value;
//                 final contributionPercent =
//                     StatistikController.to.contributionPercent.value;

//                 return ListView(
//                   shrinkWrap: true,
//                   physics: ClampingScrollPhysics(),
//                   children: [
//                     SizedBox(
//                       height: 46,
//                     ),
// CIrcularStatistik(
//   radius: 60.0,
//   lineWidth: 15.0,
//   animation: true,
//   animationDuration: 5000,
//   percent: selectedButtonType == 'Yesterday'
//       ? productivityPercent
//       : contributionPercent,
//   centerText:
//       "${(selectedButtonType == 'Yesterday' ? productivityPercent : contributionPercent) * 100}%",
//   centerTextColor: selectedButtonType == 'Yesterday'
//       ? Color(0XFF197492)
//       : Color(0XFF2699FB),
//   centerTextFontWeight: FontWeight.bold,
//   centerTextFontSize: 20.0,
//   footerText: selectedButtonType == 'Yesterday'
//       ? "Productivity"
//       : "Contribution",
//   footerTextFontSize: 15.0,
//   progressColor: selectedButtonType == 'Yesterday'
//       ? Color(0XFF197492)
//       : Color(0XFF2699FB),
// ),
//                     SizedBox(
//                       height: 9,
//                     ),
//                     CIrcularStatistik(
//                       radius: 60.0,
//                       lineWidth: 15.0,
//                       animation: true,
//                       animationDuration: 5000,
//                       percent: selectedButtonType == 'Yesterday'
//                           ? contributionPercent
//                           : productivityPercent,
//                       centerText:
//                           "${(selectedButtonType == 'Yesterday' ? contributionPercent : productivityPercent) * 100}%",
//                       centerTextColor: selectedButtonType == 'Yesterday'
//                           ? Color(0XFF2699FB)
//                           : Color(0XFF197492),
//                       centerTextFontWeight: FontWeight.bold,
//                       centerTextFontSize: 20.0,
//                       footerText: selectedButtonType == 'Yesterday'
//                           ? "Contribution"
//                           : "Productivity",
//                       footerTextFontSize: 15.0,
//                       progressColor: selectedButtonType == 'Yesterday'
//                           ? Color(0XFF2699FB)
//                           : Color(0XFF197492),
//                     ),
//                     if (selectedButtonType == 'Yesterday')
//                       Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: TextField(
//                               controller: contributionInputController,
//                               keyboardType: TextInputType.number,
//                               // decoration: InputDecoration(labelText: 'Input (int)'),
//                               decoration: InputDecoration(
//                                 labelText: 'Masukkan Contribution',
//                               ),
//                             ),
//                           ),
//                           ElevatedButton(
//                             onPressed: () async {
//                               if (contributionInputController.text.isNotEmpty) {
//                                 int inputData =
//                                     int.parse(contributionInputController.text);
//                                 await _postData(inputData);
//                               } else {
//                                 // Handle empty input
//                                 print('Input is empty');
//                               }
//                             },
//                             child: Text('Kirim Data'),
//                           ),
//                         ],
//                       ),
//                   ],
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class StatistikController extends GetxController {
//   static StatistikController get to => Get.put(StatistikController());
//   RxString selectedButtonType = 'Yesterday'.obs;
//   RxDouble productivityPercent = 0.7.obs;
//   RxDouble contributionPercent = 0.4.obs;
//   RxBool showContributionInput = false.obs;

//   void setShowContributionInput(bool value) {
//     showContributionInput.value = value;
//   }

//   void setSelectedButton(String type) {
//     // Simulasi perubahan data ketika tombol ditekan
//     double newProductivityPercent = 0.0;
//     double newContributionPercent = 0.0;

//     if (type == 'Yesterday') {
//       newProductivityPercent = 0.7;
//       newContributionPercent = 0.4;
//     } else if (type == 'Last Week') {
//       newProductivityPercent = 0.6;
//       newContributionPercent = 0.3;
//     } else if (type == 'Last Month') {
//       newProductivityPercent = 0.8;
//       newContributionPercent = 0.5;
//     } else if (type == 'Quarter') {
//       newProductivityPercent = 0.75;
//       newContributionPercent = 0.45;
//     }

//     // Set Productivity terlebih dahulu
//     productivityPercent.value = newProductivityPercent;
//     contributionPercent.value = newContributionPercent;

//     // Set Contribution setelahnya
//     Future.delayed(Duration(milliseconds: 100), () {
//       contributionPercent.value = newContributionPercent;
//     });

//     selectedButtonType.value = type;
//   }
// }

class TombolStatistik extends StatelessWidget {
  final String textButton;
  final bool isSelected;
  final VoidCallback? onPress; // Properti onPress yang opsional

  const TombolStatistik({
    required this.textButton,
    required this.isSelected,
    this.onPress, // Tandai sebagai opsional
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress, // Gunakan onPress jika tidak null
          child: Ink(
            decoration: BoxDecoration(
              border: isSelected
                  ? Border.all(color: Colors.white)
                  : Border.all(
                      color: Colors.black,
                      width: 0.1,
                    ),
              gradient: LinearGradient(
                colors: isSelected
                    ? [
                        Color(0XFF197492),
                        Color(0XFF2699FB),
                      ]
                    : [
                        Color(0XFFE3E3E3),
                        Color(0XFFE3E3E3),
                      ],
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 60,
              height: 13,
              alignment: Alignment.center,
              child: Text(
                textButton,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
