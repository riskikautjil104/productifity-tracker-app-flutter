import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                //action for search icon button
              },
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 41),
            Center(
              child: Stack(
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(100), // Image radius
                      child: Image.asset('assets/image/profilePic.jpg',
                          fit: BoxFit.cover),
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
