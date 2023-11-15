import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/modules/profile/views/editProfileView.dart';
import 'package:productivity_tracker_app/app/widgets/appBar.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(
          'Profile',
          <Widget>[
            PopupMenuButton(
                // add icon, by default "3 dot" icon
                // icon: Icon(Icons.book)
                itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
                Get.to(const EditProfileView());
              } else if (value == 1) {
                Get.snackbar('Logout', 'Untuk Sementara Belum Bisa Logout');
              }
            }),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 41),
            Center(
              child: Stack(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    onTap: () {},
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(100), // Image radius
                        child: Image.asset('assets/image/profilePic.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 20,
                    child: Icon(Icons.camera_alt_rounded),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 41),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Jhon Smith',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xFFDADADA),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'JhonSmith@gmail.com',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        color: Color(0xFFDADADA),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'FrontEnd Developer',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xFFDADADA),
                        width: MediaQuery.of(context).size.width,
                        height: 2,
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
