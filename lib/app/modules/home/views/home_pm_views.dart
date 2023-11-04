import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

import '../widget/listNamaProject_widget.dart';

import '../widget/buttonNavigator.dart';

class HomeViewPm extends GetView<HomeController> {
  const HomeViewPm({Key? key}) : super(key: key);
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

      body: SingleChildScrollView(
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
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  CartProject(
                    namaProject: 'Nama Project',
                    date: '12 Nov 2023',
                    progress: '90%',
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

      bottomNavigationBar: ButtonNavigator(),
    );
  }
}


