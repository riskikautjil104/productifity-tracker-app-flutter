import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:productivity_tracker_app/core/utils/EndPoints.dart';
// import 'package:http/http.dart' as http;
import 'package:productivity_tracker_app/app/data/register_provider.dart';

class RegisterController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userType = TextEditingController();
  TextEditingController crewRole = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final List<String> tipePengguna = [
    'Project Manager',
    'Crew',
  ];
  final List<String> roleItems = [
    "Frontend Dev",
    "Analyst",
    "Backend Dev",
    "Quality Assurance",
    "Mobile Dev",
    "UI/UX"
  ].obs;

  var isObscured = true.obs; // Observable<bool> to track the obscureText state

  void toggleObscureText() {
    isObscured
        .toggle(); // Toggles the value of isObscured (true to false or vice versa)
  }

  String? selectedTipePengguna;
  String? errTipePengguna;
  String? selectedRoleItem;

  var isPm = 'Crew'.obs; // Observable<bool> to track the obscureText state

  void register() {
    if (selectedTipePengguna == 'Project Manager') {
      selectedRoleItem = null;
    } else {
      selectedRoleItem = selectedRoleItem;
    }
    EasyLoading.show(status: 'loading...');
    var data = {
      "username": username.text,
      "email": email.text,
      "userType": selectedTipePengguna,
      "crewRole": selectedRoleItem,
      "password": password.text,
      "confirmPassword": confirmPassword.text
    };
    // print(data);

    RegisterProvider().getRegister(data).then((value) {
      final data = jsonDecode(value.body) as Map<String, dynamic>;
      print(value.body);
      if (value.statusCode == 200) {
        Get.snackbar(
            'Berhasil', 'Akun Anda Berhasil di Daftarkan Silahkan Login',
            backgroundColor: Colors.green.shade500,
            colorText: Colors.white,
            duration: Duration(seconds: 4));
        Get.toNamed('/login');
        EasyLoading.dismiss();
      } else {
        String emailError = data['errors']['Email'][0];
        String userNameError = data['errors']['Username'][0];
        String passwordError = data['errors']['Password'][0];
        String confirmPasswordError = data['errors']['ConfirmPassword'][0];

        if (selectedTipePengguna == null) {
          errTipePengguna = 'Tipe Pengguna Tidak Boleh Kosong';
        }
        Get.snackbar(
          'Error',
          "${userNameError}\n${emailError}\n${passwordError}\n${confirmPasswordError}\n${errTipePengguna}",
          backgroundColor: Colors.red.shade500,
          colorText: Colors.white,
          duration: Duration(seconds: 7),
        );
        print(emailError);
        print(userNameError);
        print(passwordError);
        print(confirmPasswordError);
        EasyLoading.dismiss();
      }
    });
  }
}
