import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// import '../widget/listNamaProject_widget.dart';

// import '../widget/buttonNavigator.dart';

import '../../../widgets/navbarAppBar.dart';

import '../widget/cart_project.dart';

class HomePm extends GetView<HomeController> {
  const HomePm({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navbar
      appBar: GradientAppBar(
        title: Text(
          'Nama Anda',
          style: TextStyle(
            color: Colors.white,
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
              // controller.goToNotification();
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
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
                    namaProject:
                        'Nama Project sangat panjang sekali sumbah deh gak ada lawan',
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
    );
  }
}
