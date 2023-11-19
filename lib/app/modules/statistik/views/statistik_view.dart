import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/statistik_controller.dart';

import '../widget/statistik_circular.dart';

import '../../../widgets/navbarAppBar.dart';

class StatistikView extends GetView<StatistikController> {
  const StatistikView({Key? key});

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
                child: Obx(() {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TombolStatistik(
                        textButton: 'Yesterday',
                        isSelected:
                            StatistikController.to.selectedButtonType.value ==
                                'Yesterday',
                      ),
                      TombolStatistik(
                        textButton: 'Last Week',
                        isSelected:
                            StatistikController.to.selectedButtonType.value ==
                                'Last Week',
                      ),
                      TombolStatistik(
                        textButton: 'Last Month',
                        isSelected:
                            StatistikController.to.selectedButtonType.value ==
                                'Last Month',
                      ),
                      TombolStatistik(
                        textButton: 'Quarter',
                        isSelected:
                            StatistikController.to.selectedButtonType.value ==
                                'Quarter',
                      ),
                    ],
                  );
                }),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              height: 540,
              child: Obx(() {
                final selectedButtonType =
                    StatistikController.to.selectedButtonType.value;
                final productivityPercent =
                    StatistikController.to.productivityPercent.value;
                final contributionPercent =
                    StatistikController.to.contributionPercent.value;

                return ListView(
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
                      percent: selectedButtonType == 'Yesterday'
                          ? productivityPercent
                          : contributionPercent,
                      centerText:
                          "${(selectedButtonType == 'Yesterday' ? productivityPercent : contributionPercent) * 100}%",
                      centerTextColor: selectedButtonType == 'Yesterday'
                          ? Color(0XFF197492)
                          : Color(0XFF2699FB),
                      centerTextFontWeight: FontWeight.bold,
                      centerTextFontSize: 20.0,
                      footerText: selectedButtonType == 'Yesterday'
                          ? "Productivity"
                          : "Contribution",
                      footerTextFontSize: 15.0,
                      progressColor: selectedButtonType == 'Yesterday'
                          ? Color(0XFF197492)
                          : Color(0XFF2699FB),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    CIrcularStatistik(
                      radius: 60.0,
                      lineWidth: 15.0,
                      animation: true,
                      animationDuration: 5000,
                      percent: selectedButtonType == 'Yesterday'
                          ? contributionPercent
                          : productivityPercent,
                      centerText:
                          "${(selectedButtonType == 'Yesterday' ? contributionPercent : productivityPercent) * 100}%",
                      centerTextColor: selectedButtonType == 'Yesterday'
                          ? Color(0XFF2699FB)
                          : Color(0XFF197492),
                      centerTextFontWeight: FontWeight.bold,
                      centerTextFontSize: 20.0,
                      footerText: selectedButtonType == 'Yesterday'
                          ? "Contribution"
                          : "Productivity",
                      footerTextFontSize: 15.0,
                      progressColor: selectedButtonType == 'Yesterday'
                          ? Color(0XFF2699FB)
                          : Color(0XFF197492),
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
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class StatistikController extends GetxController {
  static StatistikController get to => Get.put(StatistikController());
  RxString selectedButtonType = 'Yesterday'.obs;
  RxDouble productivityPercent = 0.7.obs;
  RxDouble contributionPercent = 0.4.obs;

  void setSelectedButton(String type) {
    // Simulasi perubahan data ketika tombol ditekan
    double newProductivityPercent = 0.0;
    double newContributionPercent = 0.0;

    if (type == 'Yesterday') {
      newProductivityPercent = 0.7;
      newContributionPercent = 0.4;
    } else if (type == 'Last Week') {
      newProductivityPercent = 0.6;
      newContributionPercent = 0.3;
    } else if (type == 'Last Month') {
      newProductivityPercent = 0.8;
      newContributionPercent = 0.5;
    } else if (type == 'Quarter') {
      newProductivityPercent = 0.75;
      newContributionPercent = 0.45;
    }

    // Set Productivity terlebih dahulu
    productivityPercent.value = newProductivityPercent;
    contributionPercent.value = newContributionPercent;

    // Set Contribution setelahnya
    Future.delayed(Duration(milliseconds: 100), () {
      contributionPercent.value = newContributionPercent;
    });

    selectedButtonType.value = type;
  }
}

class TombolStatistik extends StatelessWidget {
  final String textButton;
  final bool isSelected;

  const TombolStatistik({
    required this.textButton,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            StatistikController.to.setSelectedButton(textButton);
          },
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
