import 'package:get/get.dart';

import '../../modules/home/models/project1.dart';
// import '../../modules/home/models/project.dart';

import 'package:sp_util/sp_util.dart';

import '../models/statistik_models.dart';
import '../models/task_models.dart';

class ApiServices extends GetConnect {
  var token = SpUtil.getString('jwtToken');
  var name = SpUtil.getString('username');
  var ids = SpUtil.getString('projectId');
  // var projectId = SpUtil.getString('projectId');

  // Future<List<Project1>> fetchData1() async {
  //   final response = await get(
  //     'https://protracker.azurewebsites.net/api/project/$name/get-all-project',
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   print('nama ${name}');
  //   print('token ${token}');
  //   print("data data nya heits ${response.body}");
  //   if (response.status.isOk) {
  //     Map<String, dynamic> responseData = response.body;
  //     List<dynamic> data = responseData['data'];
  //     print("ini adalah ${data}");

  //     return data.map((json) => Project1.fromJson(json)).toList();
  //     // List<dynamic> data = response.body;
  //     // return data.map((json) => Project1.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Gagal mengambil data\nHarap muat ulang');
  //   }
  // }
  // Future<List<Project1>> fetchData1() async {
  //   // var token = SpUtil.getString('jwtToken');
  //   // var name = SpUtil.getString('username');

  //   final response = await get(
  //     'https://protracker.azurewebsites.net/api/project/$name/get-all-project',
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   print('nama ids $ids');
  //   print('nama $name');
  //   print('token $token');
  //   print("data data nya heits ${response.body}");

  //   if (response.status.isOk) {
  //     Map<String, dynamic> responseData = response.body;
  //     List<dynamic> data = responseData['data'];
  //     print("ini adalah $data");

  //     // Ambil id proyek pertama
  //     String? firstProjectId;
  //     if (data.isNotEmpty) {
  //       firstProjectId = data[0]['id'].toString();
  //     }

  //     // Simpan id proyek pertama ke spUtil dengan kunci unik
  //     if (firstProjectId != null && firstProjectId.isNotEmpty) {
  //       // Ganti 'projectId' dengan kunci unik untuk menyimpan ID proyek
  //       SpUtil.putString('projectId', firstProjectId);
  //     }

  //     // Jika Anda ingin menyimpan ID proyek untuk semua proyek
  //     // Simpan semua ID proyek ke spUtil
  //     List<String> projectIds =
  //         data.map((json) => json['id'].toString()).toList();
  //     SpUtil.putStringList('projectIds', projectIds);

  //     // Konversi data JSON menjadi objek Project1
  //     return data.map((json) => Project1.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Gagal mengambil data\nHarap muat ulang');
  //   }
  // }

  // Method untuk mendapatkan daftar proyek
  Future<List<Project1>> fetchData1() async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');

    final response = await get(
      'https://protracker.azurewebsites.net/api/project/$name/get-all-project',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.status.isOk) {
      Map<String, dynamic> responseData = response.body;
      List<dynamic> data = responseData['data'];

      // Konversi data JSON menjadi objek Project1
      return data.map((json) => Project1.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
    }
  }

  // Method untuk mendapatkan daftar tugas berdasarkan ID proyek
  Future<List<TaskData>> fetchTasks(String projectId) async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');

    final response = await get(
      'https://protracker.azurewebsites.net/api/task/$name/get-all-task?projectId=$projectId',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.status.isOk) {
      Map<String, dynamic> responseData = response.body;
      List<dynamic> data = responseData['data'];

      print('data datanya aku sedang ${data}');

      // Konversi data JSON menjadi objek TaskData
      return data.map((json) => TaskData.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data tugas\nHarap muat ulang');
    }
  }

  Future<List<StatistikData>> statistik() async {
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

      return data.map((json) => StatistikData.fromJson(json)).toList();
      // List<dynamic> data = response.body;
      // return data.map((json) => Project1.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data\nHarap muat ulang');
    }
  }
}
