import 'package:food_flutter/page/dashboard/dashboard_binding.dart';
import 'package:food_flutter/page/dashboard/dashboard_page.dart';
import 'package:food_flutter/page/forgot_pasword/forgot_password.dart';
import 'package:food_flutter/page/forgot_pasword/forgot_password_page.dart';
import 'package:food_flutter/page/home/home_binding.dart';
import 'package:food_flutter/page/home/home_page.dart';
import 'package:food_flutter/page/login/login.dart';
import 'package:food_flutter/page/otp/otp_binding.dart';
import 'package:food_flutter/page/otp/otp_page.dart';
import 'package:food_flutter/page/recipe_detail/recipe_detail_binding.dart';
import 'package:food_flutter/page/recipe_detail/recipe_detail_page.dart';
import 'package:food_flutter/page/register/register_binding.dart';
import 'package:food_flutter/page/register/register_page.dart';
import 'package:food_flutter/page/review/review_binding.dart';
import 'package:food_flutter/page/review/review_page.dart';
import 'package:food_flutter/page/send_otp/send_otp_binding.dart';
import 'package:food_flutter/page/send_otp/send_otp_page.dart';
import 'package:food_flutter/page/splash/splash.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.recipeDetail,
      page: () => const RecipeDetailPage(),
      binding: RecipeDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.review,
      page: () => const ReviewPage(),
      binding: ReviewBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => const OtpPage(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: AppRoutes.sendOtp,
      page: () => const SendOtpPage(),
      binding: SendOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPass,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
