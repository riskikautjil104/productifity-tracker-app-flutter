import 'package:get/get.dart';
import 'package:productivity_tracker_app/app/data/models/projects_model.dart';
import 'package:productivity_tracker_app/app/data/models/detail_project.dart';
// import 'package:productivity_tracker_app/core/utils/EndPoints.dart';
import 'package:sp_util/sp_util.dart';

class ProjectProvider extends GetConnect {
  var token = SpUtil.getString('jwtToken');
  var name = SpUtil.getString('username');
  Future<Project> fetchData() async {
    final response = await get(
        'https://protracker.azurewebsites.net/api/project/$name/get-all-project',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }); // Ganti 'URL_API' dengan URL API yang sesuai

    if (response.status.hasError) {
      throw Exception('Error saat mengambil data');
    }
    return Project.fromJson(response.body);
  }

  Future<Response> createProject(var data) async {
    var token = SpUtil.getString('jwtToken');
    var name = SpUtil.getString('username');
    var myHeader = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await post(
        'https://protracker.azurewebsites.net/api/project/$name/create-project',
        data,
        headers: myHeader);
  }

  Future<DetailProject> detailProject(var id) async {
    final response = await get(
        'https://protracker.azurewebsites.net/api/project/$name/get-project?projectId=$id',
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }); // Ganti 'URL_API' dengan URL API yang sesuai
    print('uke punya ${response.body}');
    if (response.status.hasError) {
      throw Exception('Error saat mengambil data');
    }
    return DetailProject.fromJson(response.body);
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
}
