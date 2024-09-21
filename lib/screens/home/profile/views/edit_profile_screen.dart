import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/reusable_components/dropdown/custom_dropdown.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/home/profile/views/uplaod_photos_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/edit_profile_controllers.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<ProfileController>(builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                  preferredSize: Size(context.width, 57),
                  child: AppbarWidget(
                    title: "Edit Profile",
                    backButton: true,
                    favButton: true,
                    onTap: () {
                      Get.back();
                    },
                  )),
              body: Obx(() =>
              !controller.loading.value ? SingleChildScrollView(
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
                                    color: CColors.textFieldBorderColor
                                        .withOpacity(0.5),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CColors.lightYellowColor,
                                        ),
                                        child: SvgPicture.asset(
                                            Assets.iconsEditIcon),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          CColors.textFieldBorderColor
                                              .withOpacity(0.5),
                                        ),
                                      ),
                                      Container(
                                        width: 16,
                                        height: 16,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                          CColors.textFieldBorderColor
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
                            textEditingController: controller
                                .fullNameController,
                            borderColor: CColors.textFieldBorderColor,
                            borderRadius: 13,
                            height: 50,
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
                            keyboardType: TextInputType.number,
                            textStyle: CustomTextStyles.black414,
                            hintText: 'Contact',
                          ),
                        ),
                        15.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomDropDown(
                              onChanged: (val) {
                                controller.selectedGenderProfile = val.toString();

                              },
                              hint: controller.selectedGenderProfile,
                              borderRadius: 13,
                              borderColor: CColors.textFieldBorderColor,
                              label: '',
                              mappingList: const ['Male', 'Female', 'Others'],
                              value: controller.selectedGenderProfile),
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
                            textStyle: CustomTextStyles.black414,
                            hintText: 'Height',
                          ),
                        ),
                        15.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomDropDown(
                              onChanged: (val) {},
                              hint: 'Relationship',
                              borderRadius: 13,
                              borderColor: CColors.textFieldBorderColor,
                              label: '',
                              mappingList: const ['Uncle', 'Father', 'Others'],
                              value: ''),
                        ),
                        15.ph,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextField(
                            textEditingController: controller.cityController,
                            borderColor: CColors.textFieldBorderColor,
                            borderRadius: 13,
                            height: 50,
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
                              border: Border.all(
                                  color: CColors.textFieldBorderColor),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                      textAlign: TextAlign.center,
                                      textEditingController: controller
                                          .mmController,
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
                                      textEditingController: controller
                                          .ddController,
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
                                      textEditingController: controller
                                          .yyyyController,
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

                              Get.to(() => EditUploadYourPhotosScreen(controller.mediaList,controller.userMap));
                            },
                            height: 60,
                            radius: 13,
                            gradientColor: buildLinearGradient(
                                leftToRight: true),
                            buttonText: "Update",
                            width: context.width,
                          ),
                        ),
                        150.ph,
                      ],
                    ),
                  ),
                ),
              )
                  : Center(child: CircularProgressIndicator()),)
          );
        }

        ));
  }
}
