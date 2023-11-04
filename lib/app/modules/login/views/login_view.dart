import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Container(
              width: 41,
              height: 41,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.amber,
                border: Border.all(color: Color(0xFFE8ECF4)),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(23),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  'Welcome back! Glad to see you, Again',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 57),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey.shade700,
                        )),
                  ),
                  obscureText: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                InkWell(
                  onTap: () {
                    Get.offAllNamed('/homeCrew');
                  },
                  child: Container(
                    width: 330,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(0xff2DB5F4),
                          Color(0xff197390),
                        ],
                      ),
                    ),
                    child: const Center(
                        child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFFFFFFFF),
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                  ),
                ),
                SizedBox(height: 150),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register Now'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
