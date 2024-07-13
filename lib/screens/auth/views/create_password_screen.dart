
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
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        height: 120,
        elevation: 0,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomElevatedButton(onPressedFunction: () {
                Get.to(()=> const CongratulationsScreen());
              },
                height: 60,
                radius: 13,
                gradientColor: buildLinearGradient(leftToRight: true),
                buttonText: "Next",
                width: context.width,),
            ),
            10.ph,
            GestureDetector(
              onTap: (){
                Get.to(()=> const LoginScreen());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: CustomTextStyles.black415,
                    ),
                    Text(
                      'Login',
                      style: CustomTextStyles.primary515,
                    ),
                  ],
                ),
              ),
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
                  30.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: SizedBox(
                        width: 216,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 216,
                              height: 2,
                              color: CColors.lightYellowColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CColors.lightYellowColor,
                                  ),
                                ),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                    CColors.lightYellowColor,
                                  ),
                                ),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                    CColors.lightYellowColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  30.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Create Password',
                      style: CustomTextStyles.black624,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  20.ph,

                  Obx(()=> Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomTextField(textEditingController: controller.passwordController,
                      borderColor: CColors.textFieldBorderColor,
                      borderRadius:13,
                      height: 50,
                      suffixMinWidth: 34,
                      needSuffix: true,
                      isPassword: true,
                      isPasswordHide: controller.hidePassword.value,
                      suffixWidget: GestureDetector(
                        onTap: (){
                          controller.togglePasswordVisibility();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(Assets.iconsHide,width: 24,),
                        ),
                      ),
                      textStyle: CustomTextStyles.black414,
                      hintText: 'Password',
                    ),
                  ),),
                  20.ph,

                  Obx(()=> Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: CustomTextField(textEditingController: controller.cpasswordController,
                      borderColor: CColors.textFieldBorderColor,
                      borderRadius:13,
                      height: 50,
                      suffixMinWidth: 34,
                      needSuffix: true,
                      isPassword: true,
                      isPasswordHide: controller.hidePassword2.value,
                      suffixWidget: GestureDetector(
                        onTap: (){
                          controller.togglePasswordVisibility2();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(Assets.iconsHide,width: 24,),
                        ),
                      ),
                      textStyle: CustomTextStyles.black414,
                      hintText: 'Confirm Password',
                    ),
                  ),),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
