import 'package:template/routes/app_route.dart';


import 'package:template/view/screens/splash_screen.dart';
import 'package:get/get.dart';


class AppScreen {
  static final screen = [
    GetPage(
      name: AppRoute.splashScreen,
      page: () => const SplashScreen(),
    ),
  
  ];
}
