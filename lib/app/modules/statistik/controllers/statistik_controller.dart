import 'package:get/get.dart';

class StatistikController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isDataLoaded = false.obs;

  Future<void> loadData() async {
    try {
      isLoading(true);
      // Lakukan pemanggilan data atau proses async lainnya
      // ...
    } finally {
      isLoading(false);
    }
  }

  void fetchData() async {
    try {
      isLoading(true);
      // Lakukan pemanggilan data atau proses async lainnya
      await loadData(); // Gantilah dengan pemanggilan data sebenarnya
      isDataLoaded(true);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
}
