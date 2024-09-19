import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/dropdown/custom_dropdown.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/auth/views/login_screen.dart';
import 'package:dating/screens/auth/views/upload_your_photos_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: controller.registerFormKey,
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
                                color: CColors.lightYellowColor.withOpacity(0.5),
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
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CColors.lightYellowColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Container(
                                    width: 16,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: CColors.lightYellowColor
                                          .withOpacity(0.5),
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
                        'Basic Info',
                        style: CustomTextStyles.black624,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    50.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        textEditingController: controller.fullNameController,
                        borderColor: CColors.textFieldBorderColor,
                        borderRadius: 13,
                        height: 50,
                        validator: (value){
                          return controller.validateName(value);
                        },
                        textStyle: CustomTextStyles.black414,
                        hintText: 'Full Name',
                      ),
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        textEditingController: controller.emailController,
                        borderColor: CColors.textFieldBorderColor,
                        borderRadius: 13,
                        height: 50,
                        validator: (value){
                          return controller.validateEmail(value);
                        },
                        textStyle: CustomTextStyles.black414,
                        hintText: 'Email',
                      ),
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        textEditingController: controller.contactController,
                        borderColor: CColors.textFieldBorderColor,
                        borderRadius: 13,
                        height: 50,
                        validator: (value){
                          return controller.validateContact(value);
                        },
                        keyboardType: TextInputType.number,
                        textStyle: CustomTextStyles.black414,
                        hintText: 'Contact',
                      ),
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child:Obx(()=>  CustomDropDown(
                          onChanged: (val) {
                            controller.updateGender(val);
                          },
                          hint: 'Gender',
                          borderRadius: 13,
                          borderColor: CColors.textFieldBorderColor,
                          label: '',
                          mappingList: const ['Male', 'Female', 'Others'],
                          value: controller.selectedRelation.value),)
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        textEditingController: controller.heightController,
                        borderColor: CColors.textFieldBorderColor,
                        borderRadius: 13,
                        keyboardType: TextInputType.number,
                        height: 50,
                        validator: (value){
                          return controller.validateHeight(value);
                        },
                        textStyle: CustomTextStyles.black414,
                        hintText: 'Height',
                      ),
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Obx(()=> CustomDropDown(
                          onChanged: (val) {
                            controller.updateRelation(val);
                          },
                          hint: 'Relationship',
                          borderRadius: 13,
                          borderColor: CColors.textFieldBorderColor,
                          label: '',
                          mappingList: const ['Uncle', 'Father', 'Others'],
                          value: controller.selectedRelation.value)),
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomTextField(
                        textEditingController: controller.cityController,
                        borderColor: CColors.textFieldBorderColor,
                        borderRadius: 13,
                        height: 50,
                        validator: (value){
                          return controller.validateCity(value);
                        },
                        textStyle: CustomTextStyles.black414,
                        hintText: 'City',
                      ),
                    ),
                    15.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 50,
                        width: context.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: CColors.textFieldBorderColor),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: CustomTextField(
                              textAlign: TextAlign.center,
                              textEditingController: controller.mmController,
                              borderColor: Colors.transparent,
                              keyboardType: TextInputType.number,
                              hintText: "MM",
                            )),
                            Container(
                                height: 50,
                                width: 1,
                                color: CColors.textFieldBorderColor),
                            Expanded(
                                child: CustomTextField(
                              textAlign: TextAlign.center,
                              textEditingController: controller.ddController,
                              borderColor: Colors.transparent,
                              keyboardType: TextInputType.number,
                              hintText: "DD",
                            )),
                            Container(
                                height: 50,
                                width: 1,
                                color: CColors.textFieldBorderColor),
                            Expanded(
                                child: CustomTextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              textEditingController: controller.yyyyController,
                              borderColor: Colors.transparent,
                              hintText: "YYYY",
                            )),
                          ],
                        ),
                      ),
                    ),
                    40.ph,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: CustomElevatedButton(
                        onPressedFunction: () {
                            if (controller.validateAllFields()) {
                              Get.to(() => const UploadYourPhotosScreen());
                            } else {
                              Get.snackbar("Error", "Please fill all the fields correctly");
                            }
                        },
                        height: 60,
                        radius: 13,
                        gradientColor: buildLinearGradient(leftToRight: true),
                        buttonText: "Next",
                        width: context.width,
                      ),
                    ),
                    20.ph,
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const LoginScreen());
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
                    30.ph,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
