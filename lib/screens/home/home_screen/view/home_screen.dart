
import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/reusable_components/dialogs/custom_dialog.dart';
import 'package:dating/reusable_components/dropdown/custom_dropdown.dart';
import 'package:dating/screens/home/home_screen/components/custom_drawer.dart';
import 'package:dating/screens/home/home_screen/components/slider_thumb_shape.dart';
import 'package:dating/screens/home/home_screen/controller/home_controller.dart';
import 'package:dating/screens/home/home_screen/view/view_profile_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

import '../../../../reusable_components/bottom_nav_bar/reusable_bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  final GlobalKey filterKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        bottomNavigationBar: const CustomBottomAppBar(
          selectedIndex: -1,
        ),
        backgroundColor: Colors.white,
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Discover",
              drawer: true,
              favButton: true,
              drawerTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              onTap: () {
                Get.back();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              30.ph,
              GestureDetector(
                key: filterKey,
                onTap: (){
                  showFilterDialog(context);
                },
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: CColors.pinkLightColor,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 0),
                            blurRadius: 4)
                      ]),
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        Assets.iconsFilter,
                        height: 30,
                      ),
                      Text(
                        "Filters",
                        style: CustomTextStyles.black620,
                      ),
                      SvgPicture.asset(
                        Assets.iconsArrowDown2,
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              20.ph,
              Expanded(
                child: SizedBox(
                    height: context.height * 0.65,
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
                                    borderRadius: BorderRadius.circular(13)),
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {

                                      },
                                      child: const WhiteContainer(
                                        icon: Assets.iconsClear,
                                        padding: 12,
                                      ),
                                    ),
                                    20.pw,
                                    GestureDetector(
                                      onTap: (){
                                        Get.to(()=> const ViewProfileScreen());
                                      },
                                      child: const WhiteContainer(
                                        icon: Assets.iconsOpen,
                                        height: 48,
                                        width: 48,
                                        borderColor: CColors.primaryColor,
                                      ),
                                    ),
                                    20.pw,
                                    GestureDetector(
                                      onTap: () {
                                        CustomDialogs.customDialog(
                                            context: context,
                                            titleImage: Assets.iconsWarning,
                                            titleText: "Warning",
                                            subtitle:
                                                'You have reached the limits\nTry again tomorrow',
                                            buttonWidget: CustomElevatedButton(
                                              onPressedFunction: () {
                                                Get.back();
                                              },
                                              buttonText: "Continue",
                                              height: 40,
                                              width: 200,
                                              gradientColor:
                                                  buildLinearGradient(),
                                              textStyle:
                                                  CustomTextStyles.white618,
                                            ));
                                      },
                                      child: const WhiteContainer(
                                        icon: Assets.iconsStar,
                                        padding: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const ViewProfileScreen());
                                },
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Image.asset(
                                      Assets.imagesPhoto,
                                      height: 470,
                                      width: context.width,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Positioned(
                                bottom: 181,
                                right: 0,
                                child: SvgPicture.asset(
                                  Assets.iconsContainer,
                                  height: 108,
                                ),
                              ),
                              Positioned(
                                bottom: 181,
                                right: 5,
                                child: SizedBox(
                                  height: 108,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            const Color(0xffFFFFFF)
                                                .withOpacity(0.5),
                                            const Color(0xffFFFFFF)
                                                .withOpacity(0.155),
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "@username",
                                            style: CustomTextStyles.primary516,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                Assets.iconsLocationPin,
                                                height: 15,
                                              ),
                                              5.pw,
                                              Text(
                                                "Location....",
                                                style:
                                                    CustomTextStyles.white412,
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              height: 15,
                                              width: 51,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.09),
                                                color: const Color(0xff86EFB3)
                                                    .withOpacity(0.3),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Active",
                                                  style: TextStyle(
                                                      fontSize: 09,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xff00FF6C)),
                                                ),
                                              )),
                                          Row(
                                            children: [

                                              Text(
                                                "21 year",
                                                style:
                                                    CustomTextStyles.white412,
                                              )
                                            ],
                                          )
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
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

   void showFilterDialog(BuildContext context) {
     RenderBox renderBox =
     filterKey.currentContext!.findRenderObject() as RenderBox;
     Offset position = renderBox.localToGlobal(Offset.zero);
     double x = position.dx;
     double y = position.dy + renderBox.size.height - 75;

     showDialog(
       // barrierColor: Colors.transparent,
       barrierDismissible: true,
       context: context,
       builder: (BuildContext context) {
         return StatefulBuilder(builder: (context, setState) {
           return Stack(
             children: [
               Positioned(
                 left: x,
                 top: y,
                 child: Material(
                   borderRadius: BorderRadius.circular(6),
                   child: Container(
                     height: 400,
                     width: 327,
                     decoration: BoxDecoration(
                       color: const Color(0xffF3B65B).withOpacity(0.20),
                       boxShadow: [
                         BoxShadow(
                           color: Colors.black.withOpacity(0.05),
                           blurRadius: 4,
                           offset: const Offset(0, 0),
                         ),
                       ],
                     ),
                     child: GetBuilder<HomeController>(builder: (controller){
                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           GestureDetector(
                             onTap: () {
                               Get.back();
                             },
                             child: Container(
                               height: 35,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(6),
                                   color: Colors.transparent),
                               padding:
                               const EdgeInsets.symmetric(horizontal: 5),
                               child: Row(
                                 mainAxisAlignment:
                                 MainAxisAlignment.spaceBetween,
                                 children: [
                                   SvgPicture.asset(
                                     Assets.iconsFilter,
                                     height: 30,
                                   ),
                                   Text(
                                     "Filters",
                                     style: CustomTextStyles.black620,
                                   ),
                                   SvgPicture.asset(
                                     Assets.iconsArrowUp2,
                                     height: 24,
                                   )
                                 ],
                               ),
                             ),
                           ),
                           Container(
                             height: 1,
                             color: CColors.textFieldBorderColor,
                           ),
                           10.ph,
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Padding(
                                 padding:
                                 const EdgeInsets.symmetric(horizontal: 10),
                                 child: Text(
                                   "Interested in",
                                   style: CustomTextStyles.black514,
                                 ),
                               ),
                             ],
                           ),
                           10.ph,
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(5),
                               child: Container(
                                 height: 30,
                                 width: context.width,
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(5),
                                   border: Border.all(
                                       color: CColors.textFieldBorderColor),
                                 ),
                                 child: Obx(() => Row(
                                   children: [
                                     Expanded(
                                         child: CustomElevatedButton(
                                           buttonText: 'Girls',
                                           height: 30,
                                           needShadow: false,
                                           onPressedFunction: () {
                                             controller.setSelectedGender(
                                                 Gender.female);
                                           },
                                           textStyle:
                                           controller.getSelectedGender() ==
                                               Gender.female
                                               ? CustomTextStyles.white412
                                               : CustomTextStyles.black412,
                                           backgroundColor:
                                           controller.getSelectedGender() ==
                                               Gender.female
                                               ? null
                                               : Colors.transparent,
                                           gradientColor:
                                           controller.getSelectedGender() ==
                                               Gender.female
                                               ? buildLinearGradient()
                                               : null,
                                           radius: 0,
                                         )),
                                     Container(
                                         height: 30,
                                         width: 1,
                                         color:
                                         CColors.textFieldBorderColor),
                                     Expanded(
                                         child: CustomElevatedButton(
                                           buttonText: 'Boys',
                                           height: 30,
                                           needShadow: false,
                                           onPressedFunction: () {
                                             controller
                                                 .setSelectedGender(Gender.male);
                                           },
                                           textStyle:
                                           controller.getSelectedGender() ==
                                               Gender.male
                                               ? CustomTextStyles.white412
                                               : CustomTextStyles.black412,
                                           backgroundColor:
                                           controller.getSelectedGender() ==
                                               Gender.male
                                               ? null
                                               : Colors.transparent,
                                           gradientColor:
                                           controller.getSelectedGender() ==
                                               Gender.male
                                               ? buildLinearGradient()
                                               : null,
                                           radius: 0,
                                         )),
                                     Container(
                                         height: 30,
                                         width: 1,
                                         color:
                                         CColors.textFieldBorderColor),
                                     Expanded(
                                         child: CustomElevatedButton(
                                           buttonText: 'Both',
                                           height: 30,
                                           needShadow: false,
                                           onPressedFunction: () {
                                             controller.setSelectedGender(
                                                 Gender.both);
                                           },
                                           textStyle: controller
                                               .getSelectedGender() ==
                                               Gender.both
                                               ? CustomTextStyles.white412
                                               : CustomTextStyles.black412,
                                           backgroundColor: controller
                                               .getSelectedGender() ==
                                               Gender.both
                                               ? null
                                               : Colors.transparent,
                                           gradientColor: controller
                                               .getSelectedGender() ==
                                               Gender.both
                                               ? buildLinearGradient()
                                               : null,
                                           radius: 0,
                                         )),
                                   ],
                                 )),
                               ),
                             ),
                           ),
                           10.ph,
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: SizedBox(
                               height: 40,
                               child: CustomDropDown(
                                   onChanged: (value) {},
                                   small: true,
                                   label: '',
                                   borderColor: CColors.textFieldBorderColor,
                                   borderRadius: 13,
                                   hint: 'Location',
                                   mappingList: const ["Location", "City"],
                                   value: 'value'),
                             ),
                           ),
                           20.ph,
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "Distance",
                                   style: GoogleFonts.roboto(
                                       color: Colors.black,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500),
                                 ),
                                 Text("${controller.selectedMilesRange.round()}km",style: CustomTextStyles.black412,),
                               ],
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 10),
                             child: SliderTheme(
                               data: SliderTheme.of(context).copyWith(
                                 trackHeight: 6.0,

                                 activeTickMarkColor: CColors.primaryColor,
                                 inactiveTickMarkColor: const Color(0xff121212).withOpacity(0.4),
                                 trackShape: const RoundedRectSliderTrackShape(),
                                 activeTrackColor: CColors.primaryColor,
                                 inactiveTrackColor:  const Color(0xff121212).withOpacity(0.4),
                                 thumbShape: const GradientThumbShape(
                                   enabledThumbRadius: 16.0,
                                 ),
                                 minThumbSeparation: 5,
                                 thumbColor: CColors.primaryColor,
                                 overlayColor: Colors.transparent,
                                 overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
                                 valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                                 valueIndicatorColor: Colors.transparent,
                                 valueIndicatorTextStyle: const TextStyle(
                                   color: Colors.transparent,
                                   fontSize: 20.0,
                                 ),
                               ),
                               child: Slider(
                                   value: controller.selectedMilesRange,
                                   onChanged: (value) {
                                     controller.selectedMilesRangeFunction(value);
                                   },
                                   min: 0,
                                   max: 3000,
                                   divisions: 60,
                                   autofocus: true,
                                   label: controller.selectedMilesRange.round().toString()),
                             ),
                           ),
                           20.ph,
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 18),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text(
                                   "Age",
                                   style: GoogleFonts.roboto(
                                       color: Colors.black,
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500),
                                 ),
                                 Text("${controller.filterlowerValue.round()}-${controller.filterupperValue.round()}",style: CustomTextStyles.black412,),
                               ],
                             ),
                           ),
                           Container(
                             height: 50,
                             padding: const EdgeInsets.only(right: 10),
                             child: RangeSliderFlutter(
                               values: [
                                 controller.filterlowerValue,
                                 controller.filterupperValue
                               ],
                               handler: RangeSliderFlutterHandler(
                                 decoration: BoxDecoration(
                                     boxShadow: [
                                       BoxShadow(
                                           color: Colors.grey.shade300.withOpacity(0.8),
                                           blurRadius: 10,
                                           spreadRadius: 2,
                                           offset: const Offset(0.5, 0.5))
                                     ],
                                     gradient: buildLinearGradient(),
                                     border: Border.all(color: Colors.white, width: 3),
                                     shape: BoxShape.circle),

                               ),
                               rightHandler: RangeSliderFlutterHandler(
                                   decoration: BoxDecoration(
                                       boxShadow: [
                                         BoxShadow(
                                             color: Colors.grey.shade300.withOpacity(0.8),
                                             blurRadius: 10,
                                             spreadRadius: 2,
                                             offset: const Offset(0.5, 0.5))
                                       ],
                                       gradient: buildLinearGradient(),
                                       border: Border.all(color: Colors.white, width: 3),
                                       shape: BoxShape.circle),
                                   child: const Text('')
                               ),
                               tooltip: RangeSliderFlutterTooltip(
                                   alwaysShowTooltip: false, disabled: true),
                               trackBar: RangeSliderFlutterTrackBar(
                                   activeTrackBarHeight: 6,
                                   inactiveTrackBarHeight: 6,
                                   activeDisabledTrackBarColor: const Color(0xff121212).withOpacity(0.4),
                                   inactiveDisabledTrackBarColor: const Color(0xff121212).withOpacity(0.4),
                                   inactiveTrackBar: BoxDecoration(
                                       color: const Color(0xff121212).withOpacity(0.4),
                                       borderRadius: BorderRadius.circular(25)),
                                   activeTrackBar: const BoxDecoration(
                                     color: CColors.primaryColor,
                                   )),
                               rangeSlider: true,
                               jump: true,
                               max: 80,
                               min: 18,
                               fontSize: 15,
                               onDragging: (handlerIndex, lowerValue, upperValue) {
                                 controller.filterlowerValue = lowerValue;
                                 controller.filterupperValue = upperValue;
                                 controller.update();
                               },
                             ),
                           ),
                           20.ph,
                           CustomElevatedButton(onPressedFunction: (){
                             Get.back();
                           },
                             gradientColor: buildLinearGradient(),
                             buttonText: "Search",height: 40,width: 200,)
                           ,20.ph,
                         ],
                       );
                     },),
                   ),
                 ),
               ),
             ],
           );
         });
       },
     );
   }
}

class WhiteContainer extends StatelessWidget {
  const WhiteContainer(
      {super.key,
      this.height = 38,
      this.width = 38,
      this.padding = 10,
      this.shadow = false,
      this.bgColor = Colors.white,
      this.iconColor,
      this.borderColor = Colors.white,
      required this.icon});

  final double? height, width, padding;
  final Color? bgColor, borderColor, iconColor;
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
          boxShadow: shadow!
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      offset: const Offset(0, 14),
                      blurRadius: 36)
                ]
              : null,
          border: Border.all(color: borderColor!)),
      padding: EdgeInsets.all(padding!),
      child: SvgPicture.asset(
        icon,
        color: iconColor,
      ),
    );
  }
}
