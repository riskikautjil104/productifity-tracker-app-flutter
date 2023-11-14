import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../widget/namaTask_widget.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../widget/buttonNavigator.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navbar
      appBar: AppBar(
        backgroundColor: Color(0xFFE3E3E3),
        title: const Text(
          'Nama Anda',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          onPressed: () => Get.toNamed('/profile'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 13,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Bagian atas
          Container(
            width: 375,
            height: 185,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 13.0,
                    animation: true,
                    animationDuration: 700,
                    percent: 0.7,
                    center: Text(
                      "70.0%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color(0XFF197492),
                      ),
                    ),
                    footer: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Productifity",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
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
                    animationDuration: 700,
                    percent: 0.3,
                    center: Text(
                      "30.0%",
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
              autoPlayAnimationDuration: Duration(
                seconds: 2,
              ),
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    // width: 400,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                // Menggunakan Card di dalam CarouselSlider
                                color: Color(0XFFD6D6D6),
                                child: SizedBox(
                                  height: 73,
                                  width: 344,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_back_ios_new,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "Nama Project",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 61,
                                                    ),
                                                    Text(
                                                      "01 Nov 2023",
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color:
                                                            Color(0XFFB1B1B1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 12,
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width -
                                                        (MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            208),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      color: Color(0XFFB1B1B1),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                LinearPercentIndicator(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              animation: true,
                                                              lineHeight: 7.0,
                                                              animationDuration:
                                                                  2500,
                                                              percent: 0.9,
                                                              progressColor:
                                                                  Color(
                                                                      0XFF197492),
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                            ),
                                                          ),
                                                        ),
                                                        // SizedBox(width: 8),
                                                        // Text(
                                                        //   "90%",
                                                        //   style: TextStyle(
                                                        //     color: Color(
                                                        //         0XFFB1B1B1),
                                                        //     fontSize: 8,
                                                        //   ),
                                                        // ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "90%",
                                          style: TextStyle(
                                            color: Color(0XFFB1B1B1),
                                            fontSize: 8,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                              namaProject: 'Nama Task 1',
                              toDos: 'To-Dos 1',
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
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          )
        ],
      ),
      bottomNavigationBar: ButtonNavigator(),
    );
  }
}
