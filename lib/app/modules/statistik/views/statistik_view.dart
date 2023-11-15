import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/statistik_controller.dart';

import '../widget/statistik_circular.dart';

import '../../../widgets/navbarAppBar.dart';

class StatistikView extends GetView<StatistikController> {
  const StatistikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
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
                // color: Colors.amber,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TombolStatistik(
                      textButton: 'Yesterday',
                    ),
                    TombolStatistik(
                      textButton: 'Last Week',
                    ),
                    TombolStatistik(
                      textButton: 'Last Month',
                    ),
                    TombolStatistik(
                      textButton: 'Quarter',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 540,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 46,
                  ),
                  CIrcularStatistik(
                    radius: 60.0,
                    lineWidth: 15.0,
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
                    height: 46,
                  ),
                  CIrcularStatistik(
                    radius: 60.0,
                    lineWidth: 15.0,
                    animation: true,
                    animationDuration: 5000,
                    percent: 0.4,
                    centerText: "40%",
                    centerTextColor: Color(0XFF2699FB),
                    centerTextFontWeight: FontWeight.bold,
                    centerTextFontSize: 20.0,
                    footerText: "Contribution",
                    footerTextFontSize: 15.0,
                    progressColor: Color(0XFF2699FB),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  SizedBox(
                    height: 9,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TombolStatistik extends StatelessWidget {
  final String textButton;
  const TombolStatistik({
    required this.textButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Aksi ketika tombol ditekan
          },
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0XFF197492),
                  Color(0XFF2699FB),
                ], // Ganti dengan warna-warna yang diinginkan
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 60, // Sesuaikan lebar dengan kebutuhan Anda
              height: 13, // Sesuaikan tinggi dengan kebutuhan Anda
              alignment: Alignment.center,
              child: Text(
                textButton,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ), // Ganti warna teks sesuai kebutuhan
              ),
            ),
          ),
        ),
      ),
    );
  }
}
