import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/providers/home_provider.dart';
// import '../../home/views/home_view.dart';
import '../views/notification_view.dart';

class NotificationController extends GetxController {
  final ApiServices apiService = ApiServices();
  Future<void> deleteAllNotifications() async {
    try {
      await apiService.deleteAllNotifications();
      // Panggil fungsi untuk memuat ulang notifikasi
      // Get.toNamed("/");
      Get.snackbar(
        'Berhasil',
        'Anda Berhasil Menghapus Semua Notifikasi',
        backgroundColor: Color(0XFF0F9EEA),
        duration: Duration(seconds: 5),
      );
      // Perbarui UI
      update();
      Get.offAll(NotificationView());
    } catch (e) {
      // Handle error
      print('Error deleting all notifications: $e');
      Get.snackbar(
        'Gagal',
        'Error deleting all notifications: $e',
        backgroundColor: Color.fromARGB(255, 250, 1, 1),
        duration: Duration(seconds: 5),
      );
      // Tampilkan snackbar atau pesan kesalahan kepada pengguna jika perlu
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    super.onDelete;
    super.update();
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
