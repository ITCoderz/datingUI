
import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/home/chat/message_screen/controller/messages_controller.dart';
import 'package:dating/screens/home/chat/message_screen/views/video_call_screen.dart';
import 'package:dating/screens/home/chat/message_screen/views/audio_call_screen.dart';
import 'package:dating/screens/home/chat/message_screen/views/view_profile_screen_messages.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/constants/constant_lists.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/messages_components.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

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
                              Get.to(()=> ViewProfileScreenMessage());
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
                            Text("Online",style: CustomTextStyles.white412,),
                          ],),
                        const Spacer(),
                        GestureDetector(
                            onTap: (){
                              Get.to(()=> VideoCallScreen());
                            },
                            child: SvgPicture.asset(Assets.iconsVideo,height: 24,width: 24,)),
                        10.pw,
                        GestureDetector(
                            onTap: (){
                              Get.to(()=> AudioCallScreen());

                            },
                            child: SvgPicture.asset(Assets.iconsAudioCall,height: 24,width: 24,)),
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
        body: Column(
          children: [
            20.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      width: 121,
                      color: const Color(0xffE8E6EA),
                    ),
                  ),
                  5.pw,
                  Text("Today",style: CustomTextStyles.grey412Color,),
                  5.pw,
                  Expanded(
                    child: Container(
                      height: 1,
                      width: 121,
                      color: const Color(0xffE8E6EA),
                    ),
                  ),
                ],),
            ),
            20.ph,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                itemCount: ConstantLists.messagesList.length,
                separatorBuilder: (BuildContext context, int index) =>
                20.ph,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child:
                        ConstantLists.messagesList[index].isUserMessage
                            ? ClientMessageBubble(
                          messagesModel:
                          ConstantLists.messagesList[index],
                        )
                            : UserMessageBubble(
                          messagesModel:
                          ConstantLists.messagesList[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            BottomAppBar(
              color: CColors.whiteColor,
              elevation: 0,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        textEditingController:
                        controller.messageTextController,
                        height: 50,
                        hintText: 'Your Message',
                        borderColor: CColors.primaryColor,
                        isAutofocus: true,
                        needSuffix: true,
                        suffixMinWidth: 30,
                        suffixWidget: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: SvgPicture.asset(
                              Assets.iconsStickers,
                              height: 20,
                            ),
                          ),
                        ),
                        borderRadius: 12,
                      ),
                    ),
                    10.pw,
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: CColors.primaryColor),
                        ),
                        padding: const EdgeInsets.all(13),
                        child: SvgPicture.asset(
                          Assets.iconsVoice,
                          height: 20,
                        ),
                      ),
                    ),
                    10.pw,
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
