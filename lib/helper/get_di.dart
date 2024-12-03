import 'dart:convert';

import 'package:template/controller/language_controller.dart';
import 'package:template/controller/splash_screen_controller.dart';
import 'package:template/controller/theme_controller.dart';
import 'package:template/helper/cache_helper.dart';
import 'package:template/helper/network/dio_integration.dart';
import 'package:template/model/body/language_model.dart';
import 'package:template/utill/app_constants.dart';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';


// Future<Map<String, Map<String, String>>> init() async {
//
//   // Core
//   await CacheHelper.init();
//   DioUtilNew.getInstance();
//   Get.lazyPut(() => ThemeController(), fenix: true);
//   Get.lazyPut(() => LocalizationController(), fenix: true);
//
//   // Controller
//   Get.lazyPut(() => RegisterController());
//   Get.lazyPut(() => LoginController());
//   Get.lazyPut(() => FemaleScreenController());
//   Get.lazyPut(() => SplashScreenController());
//   Get.lazyPut(() => MaleScreenController());
//   Get.lazyPut(() => GenderMainController());
//   Get.lazyPut(() => FitnessMainController());
//
//   // Retrieving localized data
//   Map<String, Map<String, String>> languages = {};
//   for (LanguageModel languageModel in AppConstants.languages) {
//     String jsonStringValues = await rootBundle
//         .loadString('assets/language/${languageModel.languageCode}.json');
//     Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
//     Map<String, String> json = {};
//     mappedJson.forEach((key, value) {
//       json[key] = value.toString();
//     });
//     languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
//         json;
//   }
//   return languages;
// }
final instance = GetIt.instance;

Future<Map<String, Map<String, String>>> init() async {
  try {
    // Initialize core utilities and controllers
    await CacheHelper.init();
    DioUtilNew.getInstance();
    Get.lazyPut(() => ThemeController(), fenix: true);
    Get.lazyPut(() => LocalizationController(), fenix: true);
    Get.lazyPut(() => SplashScreenController());

    // Load language files and decode them
    Map<String, Map<String, String>> languages = {};
    for (LanguageModel languageModel in AppConstants.languages) {
      // Load the JSON string from assets
      String jsonStringValues = await rootBundle
          .loadString('assets/language/${languageModel.languageCode}.json');

      // Parse the JSON string to Map
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);

      // Convert dynamic map to Map<String, String>
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });

      // Add the parsed language map to languages collection
      languages['${languageModel.languageCode}_${languageModel.countryCode}'] = json;
    }

    return languages;
  } catch (e) {
    print('Error initializing languages or controllers: $e');
    return {};
  }
}