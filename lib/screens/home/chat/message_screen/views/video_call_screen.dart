
import 'package:dating/generated/assets.dart';
import 'package:dating/screens/home/chat/message_screen/controller/messages_controller.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'view_profile_screen_messages.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<MessagesController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              flexibleSpace: SizedBox(
                height: 57,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(-4,1),
                            blurRadius: 10
                        )
                      ],
                      gradient: buildLinearGradient(leftToRight: true)
                  ),
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0,left: 10),
                            child: SvgPicture.asset(Assets.iconsBackIcon),
                          ),
                        ),
                        10.pw,
                        Badge(
                          smallSize: 15,
                          largeSize: 15,
                          isLabelVisible:true,
                          alignment: Alignment.bottomRight,
                          label: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff00D65A),
                                border: Border.all(color: Colors.white)
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=> const ViewProfileScreenMessage());
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(Assets.imagesPhoto,height: 40,width: 40,fit: BoxFit.cover,)),
                          ),
                        ),
                        10.pw,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Penelope",style: CustomTextStyles.white620,),
                          ],),
                        const Spacer(),
                        10.pw,
                        SvgPicture.asset(Assets.iconsTablerDots,height: 24,width: 24,),
                        10.pw,
                      ],
                    ),
                  ),
                ),
              ),
              centerTitle: true,
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              20.ph,
              SizedBox(
                height: context.height*0.7,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                        child: Image.asset(Assets.imagesPhoto4,fit: BoxFit.cover
                          ,)),
                    Positioned(
                      right: 15,
                      bottom: 15,
                      child:  Container(
                        width: 117,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.white,width: 1.5),
                          image: const DecorationImage(
                            image: AssetImage(Assets.imagesPhoto1,),
                            fit: BoxFit.cover
                          )
                        ),
                      ),)
                  ],
                ),
              ),
              20.ph,
              const Spacer(),
              BottomAppBar(
                color: CColors.whiteColor,
                elevation: 0,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      WhiteRectangle(padding: 15,icon: Assets.iconsVoiceOutlined,onTap: (){},),
                      WhiteRectangle(padding: 15,icon: Assets.iconsVideo,onTap: (){},),
                      WhiteRectangle(padding: 15,icon: Assets.iconsSpeaker,onTap: (){},),
                      WhiteRectangle(padding: 15,icon: Assets.iconsCallEnd,onTap: (){
                        Get.back();
                      },),
                    ],
                  ),
                ),
              ),
              15.ph,
            ],
          ),
        ),
      ),
    );
  }
}

class WhiteRectangle extends StatelessWidget {
  const WhiteRectangle({
    super.key,
    required this.icon,required this.onTap,this.padding=10
  });
  final String icon;
  final double padding;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child:  Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(0, 0),
                  blurRadius: 4)
            ],

            ),
        padding:  EdgeInsets.all(padding),
        child: SvgPicture.asset(icon,color: icon==Assets.iconsCallEnd? const Color(0xffFF0000): CColors.primaryColor,),
      ),
    );
  }
}
