import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChangedFunction;
  final Function()? onTap;
  final TextEditingController textEditingController;
  final String? hintText;
  final double? width, height;
  final bool isEnabled, readOnly,isAutofocus;
  final TextInputType? keyboardType;
  final int? minLines, maxLines, hintMaxLines;
  final double? horizontalPadding,
      verticalPadding,
      suffixMinWidth,
      prefixMinWidth,
      borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final int? maxLength;
  final bool needSuffix;
  final bool needPrefix;
  final bool? isPassword;
  final bool? isPasswordHide;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Color? fillColor, borderColor;
  final TextStyle? textStyle;

  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.hintText = "",
    this.onChangedFunction,
    this.onTap,
    this.keyboardType,
    this.hintMaxLines,
    this.minLines,
    this.maxLines = 1,
    this.isEnabled = true,
    this.readOnly = false,
    this.isPasswordHide = false,
    this.isPassword = false,
    this.isAutofocus = false,
    this.needSuffix = false,
    this.needPrefix = false,
    this.horizontalPadding,
    this.fillColor,
    this.borderColor,
    this.verticalPadding,
    this.suffixMinWidth,
    this.prefixMinWidth,
    this.borderRadius,
    this.inputFormatters,
    this.suffixWidget,
    this.prefixWidget,
    this.textAlign,
    this.maxLength,
    this.textStyle,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: textEditingController,
        textAlignVertical: TextAlignVertical.center,
        style: textStyle ?? CustomTextStyles.black414,
        textAlign: textAlign ?? TextAlign.start,
        cursorColor: CColors.blackTextColor,
        keyboardType: keyboardType ?? TextInputType.text,
        minLines: minLines,
        maxLines: maxLines,
        enabled: isEnabled,
        obscureText: isPassword!? isPasswordHide!: false,
        autofocus: isAutofocus,
        readOnly: readOnly,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: CustomTextStyles.black414,
          enabled: true,
          filled: true,
          hintMaxLines: hintMaxLines,
          suffixIcon:
          needSuffix ? suffixWidget ?? const SizedBox.shrink() : null,
          suffixIconConstraints: BoxConstraints(
            maxWidth: suffixMinWidth ?? 40,
            minWidth: suffixMinWidth ?? 40,
          ),
          prefixIcon:
            needPrefix ? prefixWidget ?? const SizedBox.shrink() : null,
        prefixIconConstraints: BoxConstraints(
          maxWidth: prefixMinWidth ?? 40,
          minWidth: prefixMinWidth ?? 40,
        ),
          fillColor: fillColor ?? CColors.whiteColor,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 15,
            vertical: verticalPadding ?? 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.greyBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 12),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.greyBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 12),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.greyBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 12),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CColors.redColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 12,
              ),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CColors.redColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 12,
              ),
            ),
          ),
          counterStyle: const TextStyle(
            fontSize: 0,
          ),
        ),
        onChanged: onChangedFunction,
        onTap: onTap,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      ),
    );
  }
}
