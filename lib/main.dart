// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:get/get.dart';
// import 'package:productivity_tracker_app/app/modules/project/bindings/project_binding.dart';
// import 'package:sp_util/sp_util.dart';

// import 'app/routes/app_pages.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SpUtil.getInstance();
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//         statusBarColor: Color(0xFF000),
//         statusBarIconBrightness: Brightness.dark,
//         systemNavigationBarColor: Colors.black),
//   );
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       builder: EasyLoading.init(),
//       theme: ThemeData(
//         primaryColor: Colors.white,
//       ),
//       title: "Application",
//       initialBinding: ProjectBinding(),
//       initialRoute: SpUtil.getBool('already_login', defValue: false)! == true
//           ? Routes.HOME
//           : AppPages.INITIAL,

//       // initialRoute: Routes.WELCOME,
//       // initialRoute: Routes.DETAIL_PROJECT,
//       getPages: AppPages.routes,
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
import 'package:productivity_tracker_app/app/modules/project/bindings/project_binding.dart';
import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF000),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      title: "Productiviry Tracker",
      initialBinding: ProjectBinding(),
      getPages: AppPages.routes,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulasi delay selama 3 detik (sesuaikan dengan kebutuhan)
    Future.delayed(
      Duration(seconds: 7),
      () {
        // Periksa kondisi untuk menentukan nama rute
        String initialRoute =
            SpUtil.getBool('already_login', defValue: false) == true
                ? Routes.HOME
                : AppPages.INITIAL;

        // Navigasi ke halaman beranda atau halaman awal
        Get.offNamed(initialRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Container(
              child: Center(
                child: Image.asset(
                  'assets/image/logologo-removebg-preview.png',
                  width: 400,
                  height: 300,
                  fit: BoxFit.contain,
                ),
                //  Lottie.asset(
                //   'assets/lottie/Animation-cat-serevr.json',
                //   width: 200, // Sesuaikan ukuran animasi sesuai kebutuhan
                //   height: 200,
                //   fit: BoxFit.contain,
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


