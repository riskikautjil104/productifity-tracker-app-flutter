import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/home_model.dart';
import 'package:sp_util/sp_util.dart';

class ApiServices extends GetConnect {
  Future<List<ProjectHomeCrew>> fetchDataHome() async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');

    final response = await get(
      'https://protracker.azurewebsites.net/api/home/$name',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    // print("ini adalah token ${token}");
    if (response.status.isOk) {
      Map<String, dynamic> responseData = response.body;
      List<dynamic> data = responseData['data'];

      // Konversi data JSON menjadi objek Project1
      return data.map((json) => ProjectHomeCrew.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
    }
  }
}
