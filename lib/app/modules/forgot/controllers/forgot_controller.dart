import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/forgot_provider.dart';
import 'package:sp_util/sp_util.dart';

class ForgotController extends GetxController {
  TextEditingController emailController = TextEditingController();
  void sendEmail() {
    String email = emailController.text;

    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        "Harap Mengisi Email Anda",
        backgroundColor: Colors.red.shade500,
        colorText: Colors.white,
      );
    } else {
      var data = {
        'email': email,
      };

      ForgotProvider().auth(data).then((value) {
        if (value.statusCode == 200) {
          var responBody = value.body;

          var data = responBody['data'];
          var token = data['token'];
          var email = data['email'];
          SpUtil.putString('ForgotToken', token);
          SpUtil.putString('email', email);
          print(email);
          print(token);
          Get.toNamed('/otpVerification');
        } else {
          Get.snackbar(
            'Error',
            'Masukan Email Yang Terdaftar',
            backgroundColor: Colors.red.shade500,
            colorText: Colors.white,
          );
        }
      });
    }
  }
}
