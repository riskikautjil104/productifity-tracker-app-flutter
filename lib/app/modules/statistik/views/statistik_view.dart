import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:productivity_tracker_app/app/modules/home/views/home_view.dart';
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
      print("contibusi ${contribution}");

      // Panggil metode postData dari ApiService
      var response = await apiServicess.postData(contribution.toInt());
      print("ini ini ini ${response.body}");
      print("ini ini status ${response.statusCode}");

      if (response.statusCode == 200) {
        print('Berhasil terhubung: ${response.body}');
        Get.snackbar('Berhasil', "${response.body['data']}",
            //  'Ditambahkan jam kerja anda',
            backgroundColor: Colors.green[200]);
        Get.offAll(HomeView());
      } else {
        Get.snackbar(
          'Gagal',
          "${response.body['Errors']}",
          backgroundColor: Colors.red[200],
          duration: Duration(seconds: 5),
        );
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
              child: Column(
                children: [
                  SizedBox(
                      width:
                          10), // Jarak antara teks dan animasi, sesuaikan sesuai kebutuhan
                  Lottie.asset(
                    'assets/lottie/Animation-cat-serevr.json',
                    width: 200, // Sesuaikan ukuran animasi sesuai kebutuhan
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${snapshot.error}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                children: [
                  SizedBox(width: 10),
                  Lottie.network(
                    'https://lottie.host/21f699d1-5f97-405e-b338-e31d1a80cb9d/07uDzn6POU.json',
                    width: 200, // Sesuaikan ukuran animasi sesuai kebutuhan
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'No Data',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          } else {
            List<StatistikDataDay> dataMonth = snapshot.data!;

            double productivityPercentage =
                dataMonth.first.productivity.toDouble();

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
                              "${(productivityPercentage * 100).toStringAsFixed(0)}%",
                          centerTextColor: Color(0XFFF197492),
                          centerTextFontWeight: FontWeight.bold,
                          centerTextFontSize: 20.0,
                          footerText: "\tProductivity\nHari Kemarin",
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
                        labelText: 'Masukkan Jam Kerja Hari ini 1-8 Jam',
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
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
              child: Column(
                children: [
                  SizedBox(
                      width:
                          10), // Jarak antara teks dan animasi, sesuaikan sesuai kebutuhan
                  Lottie.asset(
                    'assets/lottie/Animation-cat-serevr.json',
                    width: 200, // Sesuaikan ukuran animasi sesuai kebutuhan
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${snapshot.error}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
                              "${(productivityPercentage * 100).toStringAsFixed(0)}%",
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
                              "${(contributionPercentage * 100).toStringAsFixed(0)}%",
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body:
          
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
              child: Column(
                children: [
                  SizedBox(
                      width:
                          10), // Jarak antara teks dan animasi, sesuaikan sesuai kebutuhan
                  Lottie.asset(
                    'assets/lottie/Animation-cat-serevr.json',
                    width: 200, // Sesuaikan ukuran animasi sesuai kebutuhan
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${snapshot.error}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          } else {
            List<StatistikDataMonth> dataMonth = snapshot.data!;
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
                              "${(productivityPercentage * 100).toStringAsFixed(0)}%",
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
                              "${(contributionPercentage * 100).toStringAsFixed(0)}%",
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
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
              child: Column(
                children: [
                  SizedBox(
                      width:
                          10), // Jarak antara teks dan animasi, sesuaikan sesuai kebutuhan
                  Lottie.asset(
                    'assets/lottie/Animation-cat-serevr.json',
                    width: 200, // Sesuaikan ukuran animasi sesuai kebutuhan
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '${snapshot.error}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Tidak ada data'),
            );
          } else {
            List<StatistikDataQuarter> dataMonth = snapshot.data!;
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
                                Get.to(() => LastMonth());
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
                              "${(productivityPercentage * 100).toStringAsFixed(0)}%",
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
                              "${(contributionPercentage * 100).toStringAsFixed(0)}%",
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
              width: 70,
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
