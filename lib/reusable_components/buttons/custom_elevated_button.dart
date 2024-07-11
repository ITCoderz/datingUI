import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function()? onPressedFunction;
  final String buttonText;
  final double? height, width, radius;
  final bool isProcessing;
  final TextStyle? textStyle;
  final Gradient? gradientColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool needShadow, isInfoIcon,isPLusIcon;

  const CustomElevatedButton({
    super.key,
    required this.onPressedFunction,
    required this.buttonText,
    this.width,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.gradientColor,
    this.height,
    this.radius,
    this.needShadow = true,
    this.isProcessing = false,
    this.isInfoIcon = false,
    this.isPLusIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressedFunction,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: gradientColor,
          border: Border.all(color: borderColor??Colors.transparent),
          color: backgroundColor ?? CColors.greenColor,
          borderRadius: BorderRadius.circular(radius ?? 6),
          boxShadow: needShadow
              ? [
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 8,
              color: Colors.black.withOpacity(0.15),
            ),
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 20,
              color: Colors.black.withOpacity(0.20),
            ),
          ]
              : null,
        ),
        child: isProcessing
            ? const Padding(
          padding: EdgeInsets.all(5),
          child: CircularProgressIndicator(color: CColors.whiteColor),
        )
            : isInfoIcon
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            10.pw,
            Flexible(
              child: Text(
                buttonText,
                style: textStyle ?? CustomTextStyles.black414,
              ),
            ),
          ],
        )
            : isPLusIcon?  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_circle_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            10.pw,
            Flexible(
              child: Text(
                buttonText,
                style: textStyle ?? CustomTextStyles.black414,
              ),
            ),
          ],
        ) :Text(
          buttonText,
          style: textStyle ?? CustomTextStyles.white618,
        ),
      ),
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    required this.child,
    this.radius = 0.0,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final radius;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: buildLinearGradient(),
      ),
      child: child,
    );
  }
}
