import 'package:get/get.dart';

class RegisterController extends GetxController {
  final List<String> tipePengguna = [
    'Project Manager',
    'Crew',
  ];
  final List<String> roleItems = [
    'Analyst',
    'QA',
    'Mobile Developer',
    'Back End Developer',
    'Front End Developer',
  ].obs;

  String? selectedValue;

  var isPm = false.obs; // Observable<bool> to track the obscureText state

  void isPmTrue() {
    isPm.toggle(); // Toggles the value of isObscured (true to false or vice versa)
  }
  //TODO: Implement RegisterController
}
