import 'package:dating/generated/assets.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../reusable_components/buttons/custom_elevated_button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(Assets.imagesCongrats),
                  Container(
                    height: 141,
                    width: 141,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffF8D267),
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xff6F8CB0).withOpacity(0.41),
                              offset: const Offset(4, 4),
                              blurRadius: 20),
                          BoxShadow(
                              color: const Color(0xff728EAB).withOpacity(0.1),
                              offset: const Offset(2, 2),
                              blurRadius: 4)
                        ]),
                    padding: const EdgeInsets.all(40),
                    child: SvgPicture.asset(
                      Assets.iconsUser,
                    ),
                  )
                ],
              ),
            ),
            50.ph,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Congratulations!\nSign up successful.",
                    style: CustomTextStyles.primary722,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing\nand typesetting industry",
                      style: CustomTextStyles.black412,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomElevatedButton(onPressedFunction: () {},
                      height: 60,
                      radius: 13,
                      gradientColor: buildLinearGradient(leftToRight: true),
                      buttonText: "Continue",
                      width: context.width,),
                  ),
                  50.ph,
                ],
              ),
            )
        ]
      ),
    ));
  }
}
