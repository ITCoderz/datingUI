import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/screens/auth/views/login_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_screen.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.ph,
              Image.asset(
                Assets.imagesLogo,
                height: 150,
              ),
              40.ph,
              Text(
                'Lorem Ipsum is simply dummy',
                style: CustomTextStyles.black624,
                textAlign: TextAlign.center,
              ),
              15.ph,
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                style: CustomTextStyles.black316,
                textAlign: TextAlign.center,
              ),
              70.ph,
              CustomElevatedButton(onPressedFunction: (){
                Get.to(()=> const LoginScreen());
              },
                height: 60,
                radius: 13,
                gradientColor: buildLinearGradient(leftToRight: true),
                buttonText: "Login", width: context.width,),
              30.ph,
              GradientContainer(
                padding: const EdgeInsets.all(0.8),
                radius: 13.0,
                child: CustomElevatedButton(onPressedFunction: (){
                  Get.to(()=> const RegisterScreen());
                },
                  height: 55,
                  radius: 13,
                  needShadow: false,
                  backgroundColor: Colors.white,
                  textStyle: CustomTextStyles.primary618,
                  buttonText: "Create Account", width: context.width,),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text('Terms of use',style: CustomTextStyles.black415,),
                Text('Privacy Policy',style: CustomTextStyles.black415,),
              ],),
              15.ph,
            ],
          ),
        ),
      ),
    );
  }
}

