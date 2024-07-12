

import 'dart:io';

import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/auth/views/congratulations_screen.dart';
import 'package:dating/screens/auth/views/login_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        height: 180,
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomElevatedButton(onPressedFunction: () {
                Get.back();
              },
                height: 60,
                radius: 13,
                gradientColor: buildLinearGradient(leftToRight: true),
                buttonText: "Submit",
                width: context.width,),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.ph,
                  Center(
                    child: Image.asset(
                      Assets.imagesLogo,
                      height: 100,
                    ),
                  ),
                  50.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Forgot Password',
                      style: CustomTextStyles.black624,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  10.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Lorem Ipsum is simply dummy text of the printing typesetting industry. ',
                      style: CustomTextStyles.black416,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  40.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomTextField(textEditingController: controller.emailController,
                      borderColor: CColors.textFieldBorderColor,
                      borderRadius:13,
                      height: 50,
                      textStyle: CustomTextStyles.black414,
                      hintText: 'Email',
                    ),
                  ),
                  20.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
