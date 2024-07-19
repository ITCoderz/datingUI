import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/auth/views/register_screen.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'forgot_password.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(elevation: 0,
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don’t have an account? ', style: CustomTextStyles.black415,),
              GestureDetector(

                  onTap: (){
                    Get.to(()=> const RegisterScreen());
                  },
                  child: Text('Register', style: CustomTextStyles.primary515,)),
            ],),
        ),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: context.height,
            width: context.width,
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                40.ph,
                Text(
                  'Welcome Back👋',
                  style: CustomTextStyles.black624,
                  textAlign: TextAlign.left,
                ),
                15.ph,
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                  style: CustomTextStyles.black316,
                  textAlign: TextAlign.left,
                ),
                50.ph,
              CustomTextField(textEditingController:controller.emailController,
                borderColor: CColors.textFieldBorderColor,
                borderRadius:13,
                height: 50,
                textStyle: CustomTextStyles.black414,
                hintText: 'Email',
              ),
                20.ph,
                Obx(()=> CustomTextField(textEditingController: controller.passwordController,
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
                ),),
                10.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  GestureDetector(
                      onTap: (){
                        Get.to(()=> const ForgotPasswordScreen());
                      },
                      child: Text("Forgot Password?",style: CustomTextStyles.primary415,))
                ],),
                100.ph,
                CustomElevatedButton(onPressedFunction: () {
                  Get.to(()=>  HomeScreen());
                },
                  height: 60,
                  radius: 13,
                  gradientColor: buildLinearGradient(leftToRight: true),
                  buttonText: "Login",
                  width: context.width,),
                30.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

