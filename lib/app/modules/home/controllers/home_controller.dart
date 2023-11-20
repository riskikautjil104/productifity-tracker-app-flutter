import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  final count = 0.obs;

  // notifacis method
  void goToNotification() {
    Get.toNamed('/notification');
  }

// method button_navigator
  void changePage(int index) {
    currentIndex.value = index;
  }

  void changePagePm(int index) {
    currentIndex.value = index;
  }
}
