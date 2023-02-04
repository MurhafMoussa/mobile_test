import 'package:get/get.dart';
import 'package:things_todo/app/presentation/bindings/change_password_binding.dart';
import 'package:things_todo/app/presentation/bindings/home_binding.dart';
import 'package:things_todo/app/presentation/bindings/login_binding.dart';
import 'package:things_todo/app/presentation/bindings/register_binding.dart';
import 'package:things_todo/app/presentation/bindings/splash_binding.dart';
import 'package:things_todo/app/presentation/bindings/update_information_binding.dart';
import 'package:things_todo/app/presentation/bindings/welcome_binding.dart';
import 'package:things_todo/app/presentation/pages/change_password_page.dart';
import 'package:things_todo/app/presentation/pages/home_page.dart';
import 'package:things_todo/app/presentation/pages/login_page.dart';
import 'package:things_todo/app/presentation/pages/register_page.dart';
import 'package:things_todo/app/presentation/pages/splash_page.dart';
import 'package:things_todo/app/presentation/pages/update_information_page.dart';
import 'package:things_todo/app/presentation/pages/welcome_page.dart';
import 'package:things_todo/core/resources/app_routes.dart';

class RoutesManager {
  RoutesManager._();
  static final routes = [
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.registerRoute,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.welcomeRoute,
      page: () => const WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.changePasswordRoute,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.updateInformationRoute,
      page: () => const UpdateInformationPage(),
      binding: UpdateInformationBinding(),
    ),
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
  ];
}
