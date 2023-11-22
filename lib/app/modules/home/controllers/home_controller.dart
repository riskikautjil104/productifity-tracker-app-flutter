import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

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
    print(SpUtil.getString('jwtToken'));
  }

  void changePagePm(int index) {
    currentIndex.value = index;
  }
}
