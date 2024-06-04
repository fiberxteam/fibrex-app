import 'package:fiber/config/bindings/binding_controllers.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/themes/theme_generator.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/l10n/locals.g.dart';
import 'package:fiber/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  // prefs.remove('token');

  Get.changeThemeMode(ThemeMode.light);
  Get.updateLocale(const Locale('ar'));
  OneSignal.shared.setLogLevel(OSLogLevel.debug, OSLogLevel.none);
  OneSignal.shared.setAppId('6710bf63-e967-4d5e-8447-d8abd4a201c0');
  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    Logger().d("Accepted permission: $accepted");
  });

  OneSignal.shared.setLanguage(
      prefs.getString("languageCode") ?? Get.deviceLocale!.languageCode);
  OneSignal.shared
      .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    noti(
      result.notification.title ?? "",
      result.notification.body ?? "",
    );

    Logger().d("Opened notification: ${result.notification}");
  });
  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    noti(
      event.notification.title ?? "",
      event.notification.body ?? "",
    );

    event.complete(event.notification);
  });

  // set segments
  OneSignal.shared.setExternalUserId(prefs.getString('token') ?? "");
  // var deviceLanguageCode = Get.deviceLocale!.languageCode;
  // var local = Locale(prefs.getString("languageCode") ?? deviceLanguageCode);

  // Get.updateLocale(local);
  SetDataController controller = Get.put(SetDataController());
  if (prefs.getBool('darkTheme') == null) {
    Get.changeThemeMode(ThemeMode.light);
  } else {
    Get.changeThemeMode(
        prefs.getBool('darkTheme')! ? ThemeMode.dark : ThemeMode.light);
    controller.isDark.value = prefs.getBool('darkTheme')!;
  }

  // if (prefs.getBool('positive') != null) {
  //   OneSignal.shared.disablePush(prefs.getBool('positive')! ? false : true);
  // } else {
  //   OneSignal.shared.disablePush(false);
  // }
  // OneSignal.shared.disablePush(false);

  runApp(const MyApp(page: SplashPage()));
}

class MyApp extends StatefulWidget {
  final Widget page;

  const MyApp({
    super.key,
    required this.page,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
          home: widget.page,
          title: "Fiber X",
          defaultTransition: Transition.fadeIn,
          translationsKeys: AppTranslation.translations,
          // locale: Get.locale!,
          supportedLocales: const [
            Locale("ar", "SA"),
          ],
          fallbackLocale: const Locale("ar", "AR"),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
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
