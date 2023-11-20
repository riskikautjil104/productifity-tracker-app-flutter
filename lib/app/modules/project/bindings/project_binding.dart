import 'package:get/get.dart';

import '../controllers/project_controller.dart';

class CrewProjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrewProjectController>(
      () => CrewProjectController(),
    );
  }
}
