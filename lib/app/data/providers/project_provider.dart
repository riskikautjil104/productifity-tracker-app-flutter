import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/tasks.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/data/models/detail_project.dart';
import 'package:productivity_tracker_app/core/utils/EndPoints.dart';
// import 'package:productivity_tracker_app/core/utils/EndPoints.dart';
import 'package:sp_util/sp_util.dart';

class ProjectProvider extends GetConnect {
  var token = SpUtil.getString('jwtToken');
  var name = SpUtil.getString('username');
  var ids = SpUtil.getString('projectId');
  Future<Project> fetchData() async {
    final response = await get(
        EndPoints.baseUrl + '/project/$name/get-all-project',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }); // Ganti 'URL_API' dengan URL API yang sesuai
    print('id task ${ids}');
    if (response.status.hasError) {
      throw Exception('Gagal Memuat Data');
    }
    // simpan project id
    SpUtil.putString('projectId', response.body['data']['id']);

    print('raspons ${response.body}');

    return Project.fromJson(response.body);
  }

  Future<Response> createProject(var data) async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');
    var myHeader = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await post(EndPoints.baseUrl + '/project/$name/create-project', data,
        headers: myHeader);
  }

  Future<Response> updateProject(var data, var id) async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');
    var myHeader = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await put(
        EndPoints.baseUrl + '/project/$name/update-project?projectId=$id', data,
        headers: myHeader);
  }

  Future<DetailProject> detailProject(var id) async {
    final response = await get(
        EndPoints.baseUrl + '/project/$name/get-project?projectId=$id',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }); // Ganti 'URL_API' dengan URL API yang sesuai
    if (response.status.hasError) {
      throw Exception('Error saat mengambil data');
    }
    return DetailProject.fromJson(response.body);
  }

  Future<List<Tasks>> getPmTasks(var id) async {
    final response = await get(
        'https://protracker.azurewebsites.net/api/task/get-all-task?projectId=$id',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }); // Ganti 'URL_API' dengan URL API yang sesuai
    // print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.body['data'];
      // print(jsonResponse);
      return jsonResponse.map((data) => Tasks.fromJson(data)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Data Tidak ada');
      // final List<dynamic> jsonResponse = response.body;
      // print(jsonResponse);
      // return jsonResponse.map((data) => Tasks.fromJson(data)).toList();
    } else {
      throw Exception();
      // final List<dynamic> jsonResponse = response.body;
      // print(jsonResponse);
      // return jsonResponse.map((data) => Tasks.fromJson(data)).toList();
    }
  }

  Future<List<Tasks>> getCrewTasks(var id) async {
    final response = await get(
        'https://protracker.azurewebsites.net/api/task/$name/get-all-task?projectId=$id',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }); // Ganti 'URL_API' dengan URL API yang sesuai
    print(response.statusCode);
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = response.body['data'];
      print(jsonResponse);
      return jsonResponse.map((data) => Tasks.fromJson(data)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('Data Tidak ada');
      // final List<dynamic> jsonResponse = response.body;
      // print(jsonResponse);
      // return jsonResponse.map((data) => Tasks.fromJson(data)).toList();
    } else {
      throw Exception();
      // final List<dynamic> jsonResponse = response.body;
      // print(jsonResponse);
      // return jsonResponse.map((data) => Tasks.fromJson(data)).toList();
    }
  }

  Future<Response> deleteProject(var id) async {
    // final response =  // Ganti 'URL_API' dengan URL API yang sesuai

    // if (response.status.hasError) {
    //   throw Exception('Error saat mengambil data');
    // }
    return await delete(
        'https://protracker.azurewebsites.net/api/project/$name/delete-project?projectId=$id',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        });
  }

  Future<Response> changeStatusTask(var id) async {
    // final response =  // Ganti 'URL_API' dengan URL API yang sesuai

    // if (response.status.hasError) {
    //   throw Exception('Error saat mengambil data');
    // }
    // var body = {};

    return await patch(
        'https://protracker.azurewebsites.net/api/task/$name/update-task-status?taskId=$id',
        {},
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        });
  }
}
