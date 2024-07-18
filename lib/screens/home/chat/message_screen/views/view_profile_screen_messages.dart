
import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/screens/home/chat/message_screen/views/audio_call_screen.dart';
import 'package:dating/screens/home/chat/message_screen/views/message_screen.dart';
import 'package:dating/screens/home/chat/message_screen/views/video_call_screen.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ViewProfileScreenMessage extends StatelessWidget {
  const ViewProfileScreenMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "View Profile",
              backButton: true,
              favButton: false,
              onTap: () {
                Get.back();
              },
            )),
        body: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: context.height - 95,
                  width: context.width,
                ),
                Image.asset(
                  Assets.imagesPhoto,
                  height: context.height * 0.5,
                  width: context.width,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: context.height * 0.42,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: context.height*0.45,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name here....',
                                  style: CustomTextStyles.primary520,
                                ),
                                Container(
                                    height: 20,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.09),
                                      color: const Color(0xff86EFB3)
                                          .withOpacity(0.3),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Active",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff009941)),
                                      ),
                                    ))
                              ],
                            ),
                            const Divider(
                              color: CColors.primaryColor,
                            ),
                            10.ph,
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.iconsLocationPin,
                                  height: 24,
                                ),
                                10.pw,
                                Text(
                                  'City A,B,C',
                                  style: CustomTextStyles.black412,
                                ),
                                const Spacer(),
                                Text(
                                  "21 year",
                                  style: CustomTextStyles.black514,
                                )
                              ],
                            ),
                            10.ph,
                            const Divider(
                              color: CColors.primaryColor,
                            ),
                            10.ph,
                            Text(
                              'About',
                              style: CustomTextStyles.primary520,
                            ),
                            5.ph,
                            Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                              style: CustomTextStyles.black314,
                            ),
                            10.ph,
                            Text(
                              'Photos',
                              style: CustomTextStyles.primary520,
                            ),
                            5.ph,
                            Row(children: [
                              Expanded(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(Assets.imagesPhoto,))),
                              10.pw,
                              Expanded(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(Assets.imagesPhoto,))),                          ],),
                            10.ph,
                            Row(children: [
                              Expanded(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(Assets.imagesPhoto,))),                            10.pw,
                              Expanded(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(Assets.imagesPhoto,))),                            10.pw,
                              Expanded(child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(Assets.imagesPhoto,))),                          ],),
                            30.ph,
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: CustomElevatedButton(onPressedFunction: (){},
                                  gradientColor: buildLinearGradient(),
                                  height: 50,
                                  needShadow: true,
                                  buttonText: "Block User"),
                            ), 30.ph,

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: context.height * 0.38,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> const VideoCallScreen());
                        },
                        child: const WhiteContainer(
                          icon: Assets.iconsVideo,
                          padding: 15,
                          shadow: true,
                          iconColor: CColors.primaryColor,
                          height: 58,
                          width: 58,
                        ),
                      ),
                      20.pw,
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> const MessageScreen());
                        },
                        child: const WhiteContainer(
                          icon: Assets.iconsChatOutlined,
                          shadow: true,
                          padding: 15,
                          height: 58,
                          width: 58,
                        ),
                      ),
                      20.pw,
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> const AudioCallScreen());
                        },
                        child: const WhiteContainer(
                          icon: Assets.iconsAudioCall,
                          shadow: true,
                          padding: 15,
                          iconColor: CColors.primaryColor,
                          height: 58,
                          width: 58,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
