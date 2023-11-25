import 'package:get/get.dart';

import '../../modules/home/models/project1.dart';
// import '../../modules/home/models/project.dart';

import 'package:sp_util/sp_util.dart';

class ApiServices extends GetConnect {
  var token = SpUtil.getString('jwtToken');
  var name = SpUtil.getString('username');
  Future<List<Project1>> fetchData1() async {
    final response = await get(
      'https://protracker.azurewebsites.net/api/project/$name/get-all-project',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("data data nya ${response.status.isOk}");
    if (response.status.isOk) {
      Map<String, dynamic> responseData = response.body;
      List<dynamic> data = responseData['data'];
      print("ini adalah ${data}");

      return data.map((json) => Project1.fromJson(json)).toList();
      // List<dynamic> data = response.body;
      // return data.map((json) => Project1.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data\nHarap muat ulang');
    }
  }

  // Future<List<Project>> fetchData() async {
  //   final response = await get(
  //     'https://651b06ce340309952f0e2bf7.mockapi.io/productifity',
  //   );

  //   print("data data nya ${response.body}");
  //   if (response.status.isOk) {
  //     List<dynamic> data = response.body;
  //     return data.map((json) => Project.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Gagal mengambil data\nHarap muat ulang');
  //   }
  // }
}
