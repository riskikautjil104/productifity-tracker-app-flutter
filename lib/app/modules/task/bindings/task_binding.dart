import 'package:get/get.dart';

import '../controllers/task_controller.dart';

class CrewTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrewTaskController>(
      () => CrewTaskController(),
    );
  }
}
