import 'dart:convert';

import 'package:get/get.dart';
// import 'package:productivity_tracker_app/app/modules/statistik/views/statistik_pm.dart';
import '../models/statistik_models.dart';
import 'package:sp_util/sp_util.dart';

class ApiServicess extends GetConnect {
  var token = SpUtil.getString('jwtToken');
  var name = SpUtil.getString('username');
  Future<List<Project>> fetchData1() async {
    final response = await get(
      'https://protracker.azurewebsites.net/api/stat/$name/get-stats-project',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("ini adalah kamu ${response.body}");
    if (response.status.isOk) {
      Map<String, dynamic> responseData = response.body;
      List<dynamic> data = responseData['data'];

      // Konversi data JSON menjadi objek Project1
      return data.map((json) => Project.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
    }
  }

  // Future<List<StatistikDataMonth>> fetchDataStatistikMonthDay() async {
  //   final response = await get(
  //     'https://protracker.azurewebsites.net/api/stat/$name/get-stat-month',
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   print("ini pusing ${response.body}");
  //   if (response.status.isOk) {
  //     Map<String, dynamic> responseData = response.body;
  //     List<dynamic> data = responseData['data'];

  //     // Konversi data JSON menjadi objek Project1
  //     return data.map((json) => StatistikDataMonth.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
  //   }
  // try {
  //   final response = await get(
  //     'https://protracker.azurewebsites.net/api/stat/$name/get-stat-month',
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Accept': 'application/json',
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (response.status.isOk) {
  //     List<dynamic> data = response.body['data'];

  //     // Konversi data JSON menjadi objek StatistikDataMonth
  //     List<StatistikDataMonth> statistikDataList =
  //         data.map((json) => StatistikDataMonth.fromJson(json)).toList();

  //     return statistikDataList;
  //   } else {
  //     throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
  //   }
  // } catch (e) {
  //   // Handle exception
  //   print('Exception: $e');
  //   throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
  // }
  // }

  Future<List<StatistikDataMonth>> fetchDataStatistikMonthDay() async {
    final response = await get(
      'https://protracker.azurewebsites.net/api/stat/$name/get-stat-month',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("ini pusing ${response.body}");
    if (response.status.isOk) {
      Map<String, dynamic> data = response.body['data'];

      // Konversi data JSON menjadi objek StatistikDataMonth
      return [
        StatistikDataMonth.fromJson(data),
      ];
    } else {
      throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
    }
  }

  // lastweek
  Future<List<StatistikDataLastWeek>> fetchDataStatistikLastWeek() async {
    final response = await get(
      'https://protracker.azurewebsites.net/api/stat/$name/get-stat-week',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("ini pusing ${response.body}");
    if (response.status.isOk) {
      Map<String, dynamic> data = response.body['data'];

      // Konversi data JSON menjadi objek StatistikDataLastWeek
      return [
        StatistikDataLastWeek.fromJson(data),
      ];
    } else {
      throw Exception('Gagal mengambil data proyek\nHarap muat ulang');
    }
  }

  // day
  Future<List<StatistikDataDay>> fetchDataStatistikDay() async {
    final response = await get(
      'https://protracker.azurewebsites.net/api/stat/$name/get-stat-day',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("ini pusing ${response.body}");
    if (response.status.isOk) {
      Map<String, dynamic> data = response.body['data'];

      // Konversi data JSON menjadi objek StatistikDataLastWeek
      return [
        StatistikDataDay.fromJson(data),
      ];
    } else {
      throw Exception(
          'Gagal mengambil data proyek periksa server error 500\nHarap muat ulang');
    }
  }

  // quarter
  Future<List<StatistikDataQuarter>> fetchDataStatistikQuarter() async {
    final response = await get(
      'https://protracker.azurewebsites.net/api/stat/$name/get-stat-quarter',
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    print("ini pusing ${response.body}");
    if (response.status.isOk) {
      Map<String, dynamic> data = response.body['data'];

      // Konversi data JSON menjadi objek StatistikDataLastWeek
      return [
        StatistikDataQuarter.fromJson(data),
      ];
    } else {
      throw Exception(
          'Gagal mengambil data proyek periksa server error 500\nHarap muat ulang');
    }
  }

  // post data statistik day

  Future<Response> postData(int inputData) async {
    if (inputData < 1 || inputData > 8) {
      print('Error: Add working time between 1 to 8 hours.');

      // Return response dengan status error
        // Return response dengan status error
    return Response(
      body: jsonEncode({
        "Code": 400,
        "Data": "Add working time between 1 to 8 hours.",
      }),
      statusCode: 400,
    );
    }

    var myHeader = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    // Membuat Map untuk body permintaan
    Map<String, dynamic> jsonData = {"hour": inputData};

    final response = await post(
      'https://protracker.azurewebsites.net/api/stat/$name/add-working-time',
      jsonData,
      headers: myHeader,
    );

    print("ini adalah input ${response.body}");

    return response;
  }
}
