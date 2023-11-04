import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
          onPressed: () {},
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
            color: Colors.amber,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                  )
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
                                    child: Center(
                                      child: Text(
                                        'Nama Project $i',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
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
    );
  }
}

class CartNamaTask extends StatelessWidget {
  final String namaProject;
  final String toDos;
  final String date;
  final String progress;

  const CartNamaTask({
    Key? key,
    required this.namaProject,
    required this.toDos,
    required this.date,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
      ),
      color: Color(0XFFD6D6D6),
      child: SizedBox(
        height: 73,
        width: 344,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaProject,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    toDos,
                    style: TextStyle(
                      fontSize: 10.68,
                      color: Color(0XFF737373),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              SizedBox(
                width: 150,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0XFFB1B1B1),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    progress,
                    style: TextStyle(
                      fontSize: 9.06,
                      color: Color(0XFFB1B1B1),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
