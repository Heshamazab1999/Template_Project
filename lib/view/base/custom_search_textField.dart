import 'package:template/utill/app_constants.dart';
import 'package:template/utill/color_resources.dart';
import 'package:template/utill/dimensions.dart';
import 'package:template/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key, this.onChange});

  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).primaryColor,
      onChanged: onChange,
      //     (String query) {
      //   // searchProvider.searchLanguage(query, context);
      // },
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color,
          fontSize: Dimensions.px8),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
          borderSide: const BorderSide(style: BorderStyle.none, width: 0),
        ),
        isDense: true,
        hintText: AppConstants.findLanguage.tr,
        fillColor: Theme.of(context).cardColor,
        hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontSize: Dimensions.px8,
            color: ColorResources.COLOR_HINT),
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
              left: Dimensions.px8,
              right: Dimensions.px8),
          child: Image.asset(Images.arabic,
              width: 15,
              height: 15,
              color: Theme.of(context).textTheme.bodyLarge?.color),
        ),
      ),
    );
  }
}
