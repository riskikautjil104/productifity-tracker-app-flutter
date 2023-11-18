import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/forgot_provider.dart';
import 'package:sp_util/sp_util.dart';

class ForgotController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newConfirmPassword = TextEditingController();
  void sendEmail() {
    EasyLoading.show(status: 'loading...');
    String email = emailController.text;

    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        "Harap Mengisi Email Anda",
        backgroundColor: Colors.red.shade500,
        colorText: Colors.white,
      );
      EasyLoading.dismiss();
    } else {
      var data = {
        'email': email,
      };

      ForgotProvider().forgot(data).then((value) {
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
          EasyLoading.dismiss();
        } else {
          EasyLoading.dismiss();
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

  void resetPassword() {
    String password = newPassword.text;
    String confirmPassword = newConfirmPassword.text;
    if (newPassword.text.isEmpty || newConfirmPassword.text.isEmpty) {
      Get.snackbar(
          'Error', 'Password Atau Confirm Password Tidak Boleh Kosong');
    } else {
      var data = {
        'token': SpUtil.getString('ForgotToken'),
        'email': SpUtil.getString('email'),
        'newPassword': password,
        'confirmPassword': confirmPassword,
      };
      print(data);
      ForgotProvider().createNewPassword(data).then((value) {
        if (value.statusCode == 200) {
          Get.offAllNamed('/changepasswordsuccess');
        } else if (value.statusCode == 400) {
          print(value.body);
          // Get.snackbar('Error', '');
        } else {
          if (password != confirmPassword) {
            Get.snackbar('Error', 'Sandi Tidak Cocok');
          } else {
            Get.snackbar('Error', 'Terjadi Kesalahan');
          }
        }
      });
    }
  }
}
