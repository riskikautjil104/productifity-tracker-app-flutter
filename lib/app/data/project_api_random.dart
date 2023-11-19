import 'package:get/get.dart';

import '../modules/home/models/project.dart';

class ApiServices extends GetConnect {
  Future<List<Project>> fetchData() async {
    final response = await get(
        'https://651b06ce340309952f0e2bf7.mockapi.io/productifity'); 
        // Ganti URL_API_ANDA dengan URL API sesuai kebutuhan

    if (response.status.isOk) {
      List<dynamic> data = response.body;
      return data.map((json) => Project.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data\nHarap muat ulang');
    }
  }
}
