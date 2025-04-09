import 'dart:convert';
import 'dart:io';
import 'package:fiber/config/bindings/binding_controllers.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/themes/theme_generator.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/l10n/locals.g.dart';
import 'package:fiber/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

late SharedPreferences prefs;


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  prefs = await SharedPreferences.getInstance();

  Get.changeThemeMode(ThemeMode.light);
  Get.updateLocale(const Locale('ar'));

  SetDataController controller = Get.put(SetDataController());
  if (prefs.getBool('darkTheme') == null) {
    Get.changeThemeMode(ThemeMode.light);
  } else {
    Get.changeThemeMode(
        prefs.getBool('darkTheme')! ? ThemeMode.dark : ThemeMode.light);
    controller.isDark.value = prefs.getBool('darkTheme')!;
  }


  runApp(const MyApp(page: SplashPage())); // Change to your pages
}



class MyApp extends StatelessWidget {
  final Widget page;

  const MyApp({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        final theme = AppTheme();

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: BindingsController(),
          home: page,
          title: "Fiber X",
          defaultTransition: Transition.fadeIn,
          translationsKeys: AppTranslation.translations,
          supportedLocales: const [
            Locale("ar", "SA"),
          ],
          fallbackLocale: const Locale("ar", "AR"),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: theme.buildLightTheme(),
          themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: theme.buildDarkTheme(),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      });
    });
  }
}
