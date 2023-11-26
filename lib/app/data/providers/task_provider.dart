// import 'package:get/get.dart';
// import 'package:productivity_tracker_app/app/data/models/task_models.dart';
// import 'package:sp_util/sp_util.dart';

// class TaskProvider extends GetConnect{
//   var token = SpUtil.getString('jwtToken');
//   var name = SpUtil.getString('username');

//   Future<List<TaskModel>> fetchData1() async {
//     final response = await get(
//       'https://protracker.azurewebsites.net/api/task/:$name/get-all-task?projectId=$token',
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Accept': 'application/json',
//         'Content-Type': 'application/json',
//       },
//     );

//     print("data data nya ${response.status.isOk}");
//     if (response.status.isOk) {
//       // Map<String, dynamic> responseData = response.body;
//       // List<dynamic> data = responseData['data'];
//       // print("ini adalah ${data}");

//       return data.map((json) => TaskModel.fromJson(json)).toList();
//       // List<dynamic> data = response.body;
//       // return data.map((json) => Project1.fromJson(json)).toList();
//     } else {
//       throw Exception('Gagal mengambil data\nHarap muat ulang');
//     }
//   }

  
  
// }