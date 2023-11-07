import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forgot_controller.dart';

class ChangePasswordSuccessView extends GetView<ForgotController> {
  const ChangePasswordSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              width: 41,
              height: 41,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.amber,
                border: Border.all(color: Color(0xFFE8ECF4)),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(23),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 57),
                Center(
                  child: Column(children: [
                    Image.asset('assets/icons/Successmark.png'),
                    SizedBox(height: 30),
                    Text(
                      'Password Changed!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Your password has been changed successfully..',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8391A1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
                SizedBox(height: 51),
                InkWell(
                  onTap: () {
                    Get.toNamed('login');
                  },
                  child: Container(
                    width: 330,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(0xff2DB5F4),
                          Color(0xff197390),
                        ],
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Back to Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFFFFFFFF),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
