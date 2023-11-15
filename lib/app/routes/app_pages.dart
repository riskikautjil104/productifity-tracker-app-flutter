import 'package:get/get.dart';

import '../modules/forgot/bindings/forgot_binding.dart';
import '../modules/forgot/views/changepasswordsuccess.dart';
import '../modules/forgot/views/createNewPassword.dart';
import '../modules/forgot/views/forgot_view.dart';
import '../modules/forgot/views/otpVerification.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_pm_views.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

// import '../modules/home/views/home_pm_views.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HomeViewPm, // Use the correct path name for HomeViewPm
      page: () => const HomeViewPm(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT,
      page: () => const ForgotView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.OTPVERIFICATION,
      page: () => const OtpVerificationView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.CREATENEWPASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORDSUCCESS,
      page: () => const ChangePasswordSuccessView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
