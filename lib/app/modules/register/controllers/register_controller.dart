import 'package:get/get.dart';

class RegisterController extends GetxController {
  final List<String> tipePengguna = [
    'Project Manager',
    'Crew',
  ];
  final List<String> roleItems = [
    'Project Manager',
    'Analis',
    'QA',
    'Mobile Developer',
    'Back End Developer',
    'Front End Developer',
  ];

  String? selectedValue;

  RxBool isPm = false.obs;
  //TODO: Implement RegisterController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
