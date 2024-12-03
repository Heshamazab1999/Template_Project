import 'dart:io';
import 'package:template/controller/language_controller.dart';
import 'package:template/controller/theme_controller.dart';
import 'package:template/helper/configs/app.dart';
import 'package:template/routes/app_screen.dart';
import 'package:template/theme/dark_theme.dart';
import 'package:template/theme/light_theme.dart';
import 'package:template/utill/app_constants.dart';
import 'package:template/utill/messages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/get_di.dart' as di;
import 'routes/app_route.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        final isValidHost =
            ["192.168.0.33"].contains(host); // Allow only hosts in array
        return isValidHost;
      };
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di.init();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>>? languages;

  const MyApp({Key? key, this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSetting.init(context);
    return GetBuilder<LocalizationController>(builder: (localizeController) {
      return GetBuilder<ThemeController>(builder: (themeController) {
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          ),
          theme: themeController.darkTheme ? dark : light,
          locale: localizeController.locale,
          translations: Messages(languages: languages!),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode!,
              AppConstants.languages[0].countryCode!),
          getPages: AppScreen.screen,
          //home: RequestNewPlanScreen(),
          // initialRoute: AppRoute.getAddressScreen,
          initialRoute: AppRoute.loginScreen,
          //initialRoute: AppRoute.loginScreen,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
        );
      });
    });
  }
}
