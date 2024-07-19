import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/bottom_nav_bar/reusable_bottom_navbar.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/home/chat/message_screen/views/message_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors/app_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomAppBar(
          selectedIndex: 0,
        ),
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Messages",
              backButton: false,
              favButton: false,
              onTap: () {
                Get.back();
              },
            )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                textEditingController: TextEditingController(),
                height: 50,
                needPrefix: true,
                prefixMinWidth: 40,
                prefixWidget: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SvgPicture.asset(Assets.iconsSearchIcon),
                ),
                hintText: 'Search',
                borderColor: CColors.primaryColor,
                borderRadius: 13,
              ),
            ),
            10.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Active Now",
                style: CustomTextStyles.black518,
              ),
            ),
            15.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80,
                child: ListView.builder(
                    itemCount: 15,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>  MessageScreen());
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7),
                              child: Badge(
                                smallSize: 15,
                                largeSize: 15,
                                isLabelVisible: index==1? false :true,
                                alignment: Alignment.bottomRight,
                                label: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xff00D65A),
                                    border: Border.all(color: Colors.white)
                                  ),
                                ),
                                backgroundColor: Colors.transparent,

                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      Assets.imagesPhoto,
                                      height: 58,
                                      width: 58,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            5.ph,
                          index==0?  Text('You',style: CustomTextStyles.black414,):
                           Text('Person ${index+1}',style: CustomTextStyles.black414,)
                          ],
                        ),
                      );
                    }),
              ),
            ),
            5.ph,
            const Divider(color: Color(0xffE81E63),),
            5.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Messages",
                style: CustomTextStyles.black518,
              ),
            ),
            //No Messages
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: SvgPicture.asset(Assets.iconsEmptyMessage)),
                  10.ph,
                  Center(
                      child: Text(
                    "No messages yet !",
                    style: CustomTextStyles.primary520,
                  )),
                  5.ph,
                  Center(
                      child: Text("Explore the app to find like minded people",
                          style: CustomTextStyles.black414)),
                ],
              ),
            )*/

            // MessagesList

            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){
                        Get.to(()=>  MessageScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                        child: SizedBox(
                          height: 59,
                          width: context.width,
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    Assets.imagesPhoto,
                                    height: 58,
                                    width: 58,
                                    fit: BoxFit.cover,
                                  )),
                              10.pw,
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Emelie',style: CustomTextStyles.black514,),
                                          Text('23 min',style: CustomTextStyles.black412,),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Sticker 😍',style: CustomTextStyles.black414,),
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xffF8D267),
                                            ),
                                            child: Center(child: Text('1',style: CustomTextStyles.white412,)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Divider(color: const Color(0xffEE7268).withOpacity(0.4),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
