import 'package:template/helper/configs/app_dimensions.dart';
import 'package:template/utill/color_resources.dart';
import 'package:template/utill/dimensions.dart';
import 'package:template/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key, this.label, this.onTap});

  final Function()? onTap;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.px8,
            vertical: Dimensions.px8),
        child: Material(
          elevation: 2,
          shadowColor: ColorResources.COLOR_GREY,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label ?? "",
                      style: quicksandRegular.copyWith(

                          fontSize: AppDimensions.font(
                            Dimensions.px8,
                          ))),
                  Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                    size: AppDimensions.space(1.5),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
