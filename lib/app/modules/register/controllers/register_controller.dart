// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  // String? roleItem;
  String? selectedRoleItem;

  var isPm = false.obs; // Observable<bool> to track the obscureText state

  void isPmTrue() {
    isPm.toggle(); // Toggles the value of isObscured (true to false or vice versa)
  }

  // Future<void> register() async {
  //   try {
  //     var myHeader = {
  //       'Accept': 'application/json',
  //     };

  //     var url = Uri.parse(EndPoints.register);
  //     Map body = {
  //       "username": username.text,
  //       "email": email.text,
  //       "userType": selectedTipePengguna,
  //       "crewRole": selectedRoleItem,
  //       "password": password.text,
  //       "confirmPassword": confirmPassword.text
  //     };
  //     http.Response response =
  //         await http.post(url, body: jsonEncode(body), headers: myHeader);
  //     if (response.statusCode == 200) {
  //       final json = jsonDecode(response.body);
  //       print(json);
  //     } else {
  //       var s = response.body;
  //       print(s);
  //     }
  //   } catch (e) {}
  // }

  void register() {
    // var data = {
    //   "username": username.text,
    //   "email": email.text,
    //   "userType": selectedTipePengguna,
    //   "crewRole": selectedRoleItem,
    //   "password": 'Tes12345sd',
    //   "confirmPassword": 'Tes12345sd'
    // };
    if (selectedTipePengguna == null ||
        username.text == '' ||
        email.text == '' ||
        password.text == '' ||
        confirmPassword.text == '') {
      Get.snackbar('Error', 'Fieald Tidak Boleh Kosong',
          backgroundColor: Colors.red.shade500,
          colorText: Colors.white,
          duration: Duration(seconds: 2));
    }
    if (selectedTipePengguna == 'Project Manager') {
      selectedRoleItem = null;
    } else {
      selectedRoleItem = selectedRoleItem;
    }

    var data = {
      "username": username.text,
      "email": email.text,
      "userType": selectedTipePengguna,
      "crewRole": selectedRoleItem,
      "password": password.text,
      "confirmPassword": confirmPassword.text
    };
    // print(data);

    RegisterProvider().getRegister(data).then(
      (value) {
        print(value.body);
        if (value.statusCode == 200) {
          Get.snackbar(
              'Berhasil', 'Akun Anda Berhasil di Daftarkan Silahkan Login',
              backgroundColor: Colors.green.shade500,
              colorText: Colors.white,
              duration: Duration(seconds: 4));
          Get.toNamed('/login');
        }
      },
    );
  }
}
