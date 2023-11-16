import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF000),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      title: "Application",
      initialRoute: SpUtil.getBool('already_login', defValue: false)!
          ? SpUtil.getString('userType') == 'Crew'
              ? Routes.HOME
              : Routes.HOME_PM
          : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

// info route
// home crew
// static const HOME = '/homeCrew';

// home pm
//   static const HomeViewPm = '/homeViewPm';
