
import 'package:template/utill/app_constants.dart';
import 'package:template/utill/dimensions.dart';
import 'package:template/utill/styles.dart';
import 'package:template/view/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';

class PermissionDialog extends StatelessWidget {
  const PermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.px8),
        child: SizedBox(
          width: 300,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.add_location_alt_rounded,
                color: Theme.of(context).primaryColor, size: 100),
            const SizedBox(height: Dimensions.px8),
            Text(
              "youDeniedLocationPermission",
              textAlign: TextAlign.justify,
              style: quicksandMedium.copyWith(fontSize: Dimensions.px8),
            ),
            const SizedBox(height: Dimensions.px8),
            Row(children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            width: 2, color: Theme.of(context).primaryColor)),
                    minimumSize: const Size(1, 50),
                  ),
                  child: Text(AppConstants.no.tr),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: Dimensions.px8),
              Expanded(
                  child: CustomButton(
                      buttonText: AppConstants.yes.tr,
                      onPressed: () async {
                        await Geolocator.openAppSettings();

                        Get.back();
                      })),
            ]),
          ]),
        ),
      ),
    );
  }
}
