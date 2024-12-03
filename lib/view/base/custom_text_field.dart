import 'package:template/helper/configs/app_dimensions.dart';
import 'package:template/utill/color_resources.dart';
import 'package:template/utill/dimensions.dart';
import 'package:template/utill/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:show_up_animation/show_up_animation.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Color? fillColor;
  final Color? borderColor;
  final Color? hintColor;
  final Color? inputColor;
  final int? maxLines;
  final bool? isPassword;
  final bool? isCountryPicker;
  final bool? isShowBorder;
  final bool? isIcon;
  final bool? isShowSuffixIcon;
  final bool? isShowPrefixIcon;
  final Function()? onTap;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final Function()? onSuffixTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool? isSearch;
  final Function(String)? onSubmit;
  final bool? isEnabled;
  final TextCapitalization? capitalization;
  final String? errorLabel;
  final Widget? widget;
  final Widget? widgetPrefix;
  final bool? isValidator;
  final bool? hidden;
  final String? validatorMessage;

  const CustomTextField({
    super.key,
    this.hintText = 'Write something...',
    this.controller,
    this.borderColor = Colors.grey,
    this.label,
    this.inputColor,
    this.hintColor,
    this.errorLabel,
    this.focusNode,
    this.nextFocus,
    this.widget,
    this.prefixIconTap,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSuffixTap,
    this.fillColor,
    this.onSubmit,
    this.onChanged,
    this.widgetPrefix,
    this.capitalization = TextCapitalization.none,
    this.isCountryPicker = false,
    this.isShowBorder = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.onTap,
    this.isValidator = false,
    this.validatorMessage,
    this.isIcon = false,
    this.isPassword = false,
    this.suffixIconUrl,
    this.prefixIconUrl,
    this.isSearch = false,
    this.hidden = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        widget.label == null
            ? const SizedBox()
            : Text(widget.label ?? "",
                style: quicksandRegular.copyWith(
                  color: widget.inputColor ?? Colors.black,
                  fontSize: AppDimensions.font(
                    Dimensions.px8,
                  ),
                )),
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: quicksandBold.copyWith(
            color: widget.inputColor,
            fontSize: Dimensions.px8,
          ),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: const Color(0xFF80C66B),
          textCapitalization: widget.capitalization!,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword! ? _obscureText : false,
          inputFormatters: [
            widget.inputType == TextInputType.phone
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              // Optional: Adjust the border radius as needed
              borderSide: BorderSide(color: Colors.grey), // Grey border color
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(color: Colors.grey), // Grey border when focused
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  BorderSide(color: Colors.grey), // Grey border when enabled
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            hintText: widget.hintText,
            hintStyle: quicksandMedium.copyWith(
              color: widget.hintColor ?? ColorResources.COLOR_GRAY,
              fontSize: Dimensions.px8,
            ),
            prefixIcon: widget.isShowPrefixIcon!
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: Dimensions.px8,
                        right: Dimensions.px8),
                    child: GestureDetector(
                        onTap: widget.prefixIconTap,
                        child: Image.asset(widget.prefixIconUrl!,
                            color: Theme.of(context).primaryColor)),
                  )
                : widget.widgetPrefix,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 50, maxHeight: 50),
            suffixIcon: widget.isShowSuffixIcon!
                ? widget.isPassword!
                    ? IconButton(
                        icon: Icon(
                            _obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: const Color(0xFF6EBF56),
                            size: AppDimensions.space(1.5)),
                        onPressed: _toggle)
                    : widget.isIcon!
                        ? IconButton(
                            onPressed: widget.onSuffixTap,
                            icon: Image.asset(
                              widget.suffixIconUrl!,
                              width: 25,
                              height: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : widget.widget
                : null,
          ),
          onTap: widget.onTap,
          onSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
        ),
      ]),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
