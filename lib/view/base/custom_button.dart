import 'package:template/utill/dimensions.dart';
import 'package:template/utill/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? buttonText;
  final bool? transparent;
  final bool? border;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final IconData? icon;
  final Color? colorText;

  const CustomButton(
      {super.key,
      this.onPressed,
      this.buttonText,
      this.transparent = false,
      this.border = false,
      this.margin,
      this.width,
      this.colorText = Colors.black,
      this.height,
      this.fontSize,
      this.radius = 10,
      this.icon});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent!
              ? Colors.transparent
              : Theme.of(context).primaryColor,
      minimumSize: Size(width != null ? width! : Dimensions.WEB_SCREEN_WIDTH,
          height != null ? height! : 50),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: border!
            ? BorderSide(color: Theme.of(context).primaryColor)
            : BorderSide(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(radius!),
      ),
    );

    return Center(
        child: SizedBox(
            width: width ?? Dimensions.WEB_SCREEN_WIDTH,
            child: Padding(
              padding: margin == null ? const EdgeInsets.all(0) : margin!,
              child: TextButton(
                onPressed: onPressed,
                style: flatButtonStyle,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  icon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: Dimensions.px8),
                          child: Icon(icon,
                              color: transparent!
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).cardColor),
                        )
                      : const SizedBox(),
                  Text(buttonText ?? '',
                      textAlign: TextAlign.center,
                      style: quicksandBold.copyWith(
                        color: colorText,
                        fontSize: fontSize ?? Dimensions.px8,
                      )),
                ]),
              ),
            )));
  }
}
