import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginControllerb
  var isObscured = true.obs; // Observable<bool> to track the obscureText state

  void toggleObscureText() {
    isObscured
        .toggle(); // Toggles the value of isObscured (true to false or vice versa)
  }
}
