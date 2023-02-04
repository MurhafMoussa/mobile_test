import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
import 'package:things_todo/core/resources/strings_manager.dart';
import 'package:things_todo/core/resources/theme_manager.dart';
import 'package:things_todo/generated/l10n.dart';
import 'package:things_todo/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
 runApp(
      const MobileTest(),
   
  );
}

class MobileTest extends StatelessWidget {
  const MobileTest({super.key});
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        onGenerateTitle: (BuildContext context) =>
            AppLocalizations.of(context).appTitle,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale(StringsManager.english),
          Locale(StringsManager.arabic),
        ],
        debugShowCheckedModeBanner: false,
        builder: (
          BuildContext context,
          Widget? child,
        ) =>
            ResponsiveWrapper.builder(
          child,
          minWidth: 350,
          defaultScale: true,
          breakpoints: const <ResponsiveBreakpoint>[
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.resize(500, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ],
        ),
        theme: getApplicationThemeData(isDark: false),
        navigatorKey: MobileTest.navigatorKey,
        initialRoute: AppRoutes.splashRoute,
        getPages: [
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
          ),GetPage(
            name: AppRoutes.updateInformationRoute,
            page: () => const UpdateInformationPage(),
            binding: UpdateInformationBinding(),
          ),
          GetPage(
            name: AppRoutes.splashRoute,
            page: () => const SplashPage(),
            binding: SplashBinding(),
          ),
        ],
      );
}
