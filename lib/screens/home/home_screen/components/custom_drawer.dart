import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/screens/auth/views/starting_screen.dart';
import 'package:dating/screens/home/profile/views/profile_screen.dart';
import 'package:dating/screens/home/settings/privacy_screen.dart';
import 'package:dating/screens/home/settings/terms_service.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          Stack(
            children: [
              SizedBox(
                height: 94,
                child: DrawerHeader(
                  decoration:  BoxDecoration(
                      gradient: buildLinearGradient(leftToRight: true),
                      ),
                  padding: const EdgeInsets.only(top: 30, right: 0),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon:  SvgPicture.asset(
                            Assets.iconsBackIcon,
                            height: 20,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Text(
                          'Side Menu',
                          style: CustomTextStyles.white624,
                        ),
                      ],)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 115),
                child: Column(
                  children: [
                    GreyBorderContainer(
                      title: "Edit Profile",
                      prefix: Assets.iconsUser,
                      onTapFunction: () {
                        Get.back();
                        Get.to(()=> const ProfileScreen());
                      },
                    ),

                    GreyBorderContainer(
                      title: "Terms & Services",
                      prefix: Assets.iconsTermsService,
                      onTapFunction: () {
                        Get.back();
                        Get.to(()=> const TermsScreen());
                      },
                    ),

                    GreyBorderContainer(
                      title: "Privacy Policy",
                      prefix: Assets.iconsPrivacy,
                      onTapFunction: () {
                        Get.back();
                        Get.to(()=> const PrivacyScreen());
                      },
                    ),
                    GreyBorderContainer(
                      title: "App Settings",
                      prefix: Assets.iconsAppSetting,
                      onTapFunction: () {
                        Get.back();
                        // Get.to(()=> const ProfileScreen());
                      },
                    ),

                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 20,right: 20,top: context.height*0.75),
                child: CustomElevatedButton(
                    onPressedFunction: () {
                      Get.offAll(()=> const StartingScreen());
                    },
                    buttonText: "Log Out",
                    height: 40,
                    gradientColor: buildLinearGradient(),
                    width: context.width,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GreyBorderContainer extends StatelessWidget {
  const GreyBorderContainer(
      {super.key, this.title, this.prefix, this.suffix, this.onTapFunction});

  final String? title, prefix, suffix;
  final Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        height: 40,
        margin: const EdgeInsets.only(left: 10),
        width: context.width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                prefix != null
                    ? SvgPicture.asset(
                  prefix!,
                  height: 20,
                  color: CColors.textFieldBorderColor,
                )
                    : const SizedBox.shrink(),
                10.pw,
                Text(
                  title ?? '',
                  style: CustomTextStyles.black414,
                ),
                const Spacer(),
                suffix != null
                    ? Image.asset(
                  suffix!,
                  height: 20,
                )
                    : const SizedBox.shrink(),
              ],
            ),
            4.ph,
            const Divider(color: CColors.textFieldBorderColor,)
          ],
        ),
      ),
    );
  }
}
