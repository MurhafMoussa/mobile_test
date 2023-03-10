import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/core/resources/app_routes.dart';
import 'package:things_todo/core/resources/color_manager.dart';
import 'package:things_todo/core/resources/route_manager.dart';
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
        color: ColorManager.white,
        theme: getApplicationThemeData(isDark: false),
        navigatorKey: MobileTest.navigatorKey,
        initialRoute: AppRoutes.splashRoute,
        getPages: RoutesManager.routes,
      );
}
