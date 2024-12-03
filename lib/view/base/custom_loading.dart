import 'package:template/helper/configs/app_dimensions.dart';
import 'package:template/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(Images.loading, width: AppDimensions.space(10)));
  }
}
