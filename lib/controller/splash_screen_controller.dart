import 'package:template/controller/base_controller.dart';
import 'package:template/helper/cache_helper.dart';
import 'package:template/routes/app_route.dart';
import 'package:template/utill/app_constants.dart';
import 'package:get/get.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // Future.delayed(const Duration(seconds: 3), () {
    //   CacheHelper.getData(key: AppConstants.token) != null
    //       ? {Get.toNamed(AppRoute.genderMainScreen)}
    //       : {Get.toNamed(AppRoute.loginScreen)};
    // });
  }
}
