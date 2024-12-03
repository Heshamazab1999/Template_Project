import 'package:template/controller/connectivity_controller.dart';
import 'package:template/helper/configs/app_dimensions.dart';
import 'package:template/routes/app_route.dart';
import 'package:template/utill/dimensions.dart';
import 'package:template/utill/extension_sized_box.dart';
import 'package:template/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConnectivityController());
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(Images.splash,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity),
            Positioned(
              top: AppDimensions.space(Dimensions.px3),
              right: AppDimensions.space(Dimensions.px2),
              left: AppDimensions.space(Dimensions.px2),
              child: Column(
                children: [
                  Image.asset(Images.appleLogo,
                      width: AppDimensions.space(Dimensions.px5)),
                  AppDimensions.space().sBH,
                  Image.asset(Images.logoName),
                ],
              ),
            ),
            Positioned(
              bottom: AppDimensions.space(Dimensions.px2),
              right: AppDimensions.space(Dimensions.px2),
              child: IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.loginScreen);
                  },
                  icon: const Icon(
                    Icons.arrow_forward_sharp,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
