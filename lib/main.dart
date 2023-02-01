import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:things_todo/core/resources/strings_manager.dart';
import 'package:things_todo/core/resources/theme_manager.dart';
import 'package:things_todo/features/home/presentation/bindings/login_binding.dart';
import 'package:things_todo/features/home/presentation/pages/login_page.dart';
import 'package:things_todo/generated/l10n.dart';
import 'package:things_todo/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const ThingsToDo());
}

class ThingsToDo extends StatelessWidget {
  const ThingsToDo({super.key});

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
          minWidth: 480,
          defaultScale: true,
          breakpoints: const <ResponsiveBreakpoint>[
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
        ),
        theme: getApplicationThemeData(isDark: false),
        initialRoute: '/home',
        getPages: [
          GetPage(
            name: '/home',
            page: LoginPage.new,
            binding: LoginBinding(),
          ),
        ],
      );
}
