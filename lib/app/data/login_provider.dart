import 'package:get/get.dart';
import 'package:productivity_tracker_app/core/utils/EndPoints.dart';

class LoginProvider extends GetConnect {
  Future<Response> auth(var data) async {
    var myHeader = {
      'Accept': 'application/json',
    };
    return await post(EndPoints.login, data, headers: myHeader);
  }
}
