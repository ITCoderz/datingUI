import 'dart:ui';

import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/screens/home/home_screen/view/view_profile_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Discover",
              drawer: true,
              favButton: true,
              onTap: () {
                Get.back();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              30.ph,
            Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: CColors.pinkLightColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0,0),
                    blurRadius: 4
                  )
                ]
              ),padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SvgPicture.asset(Assets.iconsFilter,height: 30,),
                Text("Filters",style: CustomTextStyles.black620,),
                  SvgPicture.asset(Assets.iconsArrowDown2,height: 10,)
              ],),
            ),
              20.ph,
              SizedBox(
                  height: context.height*0.65,
                  width: context.width,
                  child: FittedBox(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 440,
                              width: context.width,
                            ),
                            Container(
                              height: 90,
                              width: context.width,
                              decoration: BoxDecoration(
                                gradient: buildLinearGradient(),
                                borderRadius: BorderRadius.circular(13)
                              ),
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                const WhiteContainer(icon: Assets.iconsClear,padding: 12,),
                                  20.pw,
                                  const WhiteContainer(icon: Assets.iconsOpen,height: 48,width: 48,borderColor: CColors.primaryColor,),
                                  20.pw,
                                  const WhiteContainer(icon: Assets.iconsStar,padding: 8,),
                    
                    
                                ],),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(()=> const ViewProfileScreen());
                              },
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.asset(Assets.imagesPhoto,height: 470,width: context.width,fit: BoxFit.cover,)),
                            ),
                            Positioned(
                              bottom: 181,
                              right: 0,
                              child: SvgPicture.asset(Assets.iconsContainer,height: 108,),
                            ),
                            Positioned(
                              bottom: 181,
                              right: 5,
                              child: SizedBox(
                                height: 108,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(Assets.iconsTopOpen),
                                    10.ph,
                                    SvgPicture.asset(Assets.iconsBottomOpen),
                                  ],
                                ),
                              ),
                            ),
                            
                            Positioned(
                              bottom: 10,
                              right: 10,
                              left: 10,
                              child: Container(
                                height: 60,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffFFFFFF).withOpacity(0.5),
                                      const Color(0xffFFFFFF).withOpacity(0.155),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Text("@username",style: CustomTextStyles.primary516,),
                                       Row(children: [
                                         SvgPicture.asset(Assets.iconsLocationPin,height: 15,),
                                         5.pw,
                                         Text("Location....",style: CustomTextStyles.white412,)
                                       ],)
                                     ],
                                   ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                            height: 15,
                                            width: 51,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(4.09),
                                              color: const Color(0xff86EFB3).withOpacity(0.3),
                                            ),
                                            child: const Center(
                                              child: Text("Active",style: TextStyle(
                                                fontSize: 09,
                                                fontWeight:
                                                  FontWeight.w400,
                                                color: Color(0xff00FF6C)
                                              ),),
                                            )),
                                        Row(children: [
                                          SvgPicture.asset(Assets.iconsLocationPin,height: 15,),
                                          5.pw,
                                          Text("21 year",style: CustomTextStyles.white412,)
                                        ],)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({
    super.key,
    this.height=38,
    this.width=38,
    this.padding=10,
    this.shadow=false,
    this.bgColor=Colors.white,
    this.borderColor=Colors.white,
    required this.icon
  });

  final double? height,width,padding;
  final Color? bgColor, borderColor;
  final String icon;
  final bool? shadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: shadow!? [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            offset: Offset(0,14),
            blurRadius: 36
          )
        ]: null,
        border: Border.all(color: borderColor!)
      ),
      padding:  EdgeInsets.all(padding!),
      child: SvgPicture.asset(icon),
    );
  }
}
