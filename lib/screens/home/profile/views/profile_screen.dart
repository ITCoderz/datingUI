import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/bottom_nav_bar/reusable_bottom_navbar.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/app_colors.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {


  return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomAppBar(
          selectedIndex: 2,
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Profile",
              backButton: false,
              favButton: true,
              onTap: () {
                Get.back();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              Expanded(
                child: Container(
                  height: context.height * 0.55,
                  width: context.width,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(
                              bottomRight: Radius.circular(250),
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13),
                              bottomLeft: Radius.circular(13),
                          ),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(Assets.imagesPhoto4))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> const EditProfileScreen());
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          padding: const EdgeInsets.all(15),
                          decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: buildLinearGradient(),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.35),
                                    offset: const Offset(0,0),
                                    blurRadius: 10

                                )
                              ]
                          ),
                          child: SvgPicture.asset(Assets.iconsEditIcon,height: 35,),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              10.ph,
              const Divider(color: CColors.primaryColor,),
              Text(
                'About',
                style: CustomTextStyles.primary520,
              ),
              5.ph,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: CustomTextStyles.black314,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
