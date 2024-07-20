import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/reusable_components/dropdown/custom_dropdown.dart';
import 'package:dating/screens/home/home_screen/controller/home_controller.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../reusable_components/buttons/custom_elevated_button.dart';
import '../../home/home_screen/components/slider_thumb_shape.dart';
import '../../onboarding/views/onboarding_screen.dart';

class SetPreferenceScreen extends StatelessWidget {
  const SetPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Preference",
              backButton: true,
              favButton: false,
              onTap: () {
                Get.back();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 30),
          child: GetBuilder<HomeController>(builder: (controller){
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: Text("What do you want?",style: CustomTextStyles.black520,)),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomDropDown(
                        onChanged: (val) {},
                        hint: 'Gender',
                        borderRadius: 13,
                        borderColor: CColors.textFieldBorderColor,
                        label: '',
                        mappingList: const ['Male', 'Female', 'Others'],
                        value: ''),
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Distance",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${controller.selectedMilesRange.round()}km",
                          style: CustomTextStyles.black412,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10),
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 5.0,
                        activeTickMarkColor:
                        CColors.primaryColor,
                        inactiveTickMarkColor:
                        const Color(0xff121212)
                            .withOpacity(0.4),
                        trackShape:
                        const RoundedRectSliderTrackShape(),
                        activeTrackColor: CColors.primaryColor,
                        inactiveTrackColor:
                        const Color(0xff121212)
                            .withOpacity(0.4),
                        thumbShape: const GradientThumbShape(
                          enabledThumbRadius: 11.0,
                        ),
                        minThumbSeparation: 5,
                        thumbColor: CColors.primaryColor,
                        overlayColor: Colors.transparent,
                        overlayShape:
                        const RoundSliderOverlayShape(
                            overlayRadius: 0.0),
                        valueIndicatorShape:
                        const PaddleSliderValueIndicatorShape(),
                        valueIndicatorColor: Colors.transparent,
                        valueIndicatorTextStyle:
                        const TextStyle(
                          color: Colors.transparent,
                          fontSize: 20.0,
                        ),
                      ),
                      child: Slider(
                        value: controller.selectedMilesRange,
                        onChanged: (value) {
                          controller.selectedMilesRangeFunction(
                              value);
                        },
                        min: 0,
                        max: 3000,
                        divisions: 60,
                        autofocus: true,
                        label: controller.selectedMilesRange
                            .round()
                            .toString(),
                      ),
                    ),
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Age",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${controller.filterLowerValue.round()}-${controller.filterUpperValue.round()}",
                          style: CustomTextStyles.black412,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child: RangeSliderFlutter(
                      values: [
                        controller.filterLowerValue,
                        controller.filterUpperValue
                      ],
                      handlerHeight: 24,
                      handler: RangeSliderFlutterHandler(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300
                                      .withOpacity(0.8),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset:
                                  const Offset(0.5, 0.5))
                            ],
                            gradient: buildLinearGradient(),
                            border: Border.all(
                                color: Colors.white, width: 3),
                            shape: BoxShape.circle),
                      ),
                      rightHandler: RangeSliderFlutterHandler(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300
                                      .withOpacity(0.8),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset:
                                  const Offset(0.5, 0.5))
                            ],
                            gradient: buildLinearGradient(),
                            border: Border.all(
                                color: Colors.white, width: 3),
                            shape: BoxShape.circle),
                        child: const Text(''),
                      ),
                      tooltip: RangeSliderFlutterTooltip(
                          alwaysShowTooltip: false,
                          disabled: true),
                      trackBar: RangeSliderFlutterTrackBar(
                        activeTrackBarHeight: 6,
                        inactiveTrackBarHeight: 6,
                        activeDisabledTrackBarColor:
                        const Color(0xff121212)
                            .withOpacity(0.4),
                        inactiveDisabledTrackBarColor:
                        const Color(0xff121212)
                            .withOpacity(0.4),
                        inactiveTrackBar: BoxDecoration(
                            color: const Color(0xff121212)
                                .withOpacity(0.4),
                            borderRadius:
                            BorderRadius.circular(25)),
                        activeTrackBar: const BoxDecoration(
                          color: CColors.primaryColor,
                        ),
                      ),
                      rangeSlider: true,
                      jump: true,
                      max: 80,
                      min: 18,
                      fontSize: 15,
                      onDragging: (handlerIndex, lowerValue,
                          upperValue) {
                        controller.filterLowerValue =
                            lowerValue;
                        controller.filterUpperValue =
                            upperValue;
                        controller.update();
                      },
                    ),
                  ),
              
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Height",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${controller.heightLowerValue.round()}-${controller.heightUpperValue.round()} cm",
                          style: CustomTextStyles.black412,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child: RangeSliderFlutter(
                      values: [
                        controller.heightLowerValue,
                        controller.heightUpperValue
                      ],
                      handlerHeight: 24,
                      handler: RangeSliderFlutterHandler(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300
                                      .withOpacity(0.8),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset:
                                  const Offset(0.5, 0.5))
                            ],
                            gradient: buildLinearGradient(),
                            border: Border.all(
                                color: Colors.white, width: 3),
                            shape: BoxShape.circle),
                      ),
                      rightHandler: RangeSliderFlutterHandler(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300
                                      .withOpacity(0.8),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset:
                                  const Offset(0.5, 0.5))
                            ],
                            gradient: buildLinearGradient(),
                            border: Border.all(
                                color: Colors.white, width: 3),
                            shape: BoxShape.circle),
                        child: const Text(''),
                      ),
                      tooltip: RangeSliderFlutterTooltip(
                          alwaysShowTooltip: false,
                          disabled: true),
                      trackBar: RangeSliderFlutterTrackBar(
                        activeTrackBarHeight: 6,
                        inactiveTrackBarHeight: 6,
                        activeDisabledTrackBarColor:
                        const Color(0xff121212)
                            .withOpacity(0.4),
                        inactiveDisabledTrackBarColor:
                        const Color(0xff121212)
                            .withOpacity(0.4),
                        inactiveTrackBar: BoxDecoration(
                            color: const Color(0xff121212)
                                .withOpacity(0.4),
                            borderRadius:
                            BorderRadius.circular(25)),
                        activeTrackBar: const BoxDecoration(
                          color: CColors.primaryColor,
                        ),
                      ),
                      rangeSlider: true,
                      jump: true,
                      max: 80,
                      min: 18,
                      fontSize: 15,
                      onDragging: (handlerIndex, lowerValue,
                          upperValue) {
                        controller.heightLowerValue =
                            lowerValue;
                        controller.heightUpperValue =
                            upperValue;
                        controller.update();
                      },
                    ),
                  ),
                  15.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CustomDropDown(
                        onChanged: (val) {},
                        hint: 'Language',
                        borderRadius: 13,
                        borderColor: CColors.textFieldBorderColor,
                        label: '',
                        mappingList: const ['English', 'Urdu',],
                        value: ''),
                  ),
                  15.ph,
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sports",
                                style:
                                CustomTextStyles.black514,
                              ),
                              10.ph,
                              Container(
                                height: 50,
                                width: context.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      13),
                                  border: Border.all(
                                      color: CColors
                                          .textFieldBorderColor),
                                ),
                                child: Obx(
                                      () => Row(
                                    children: [
                                      Expanded(
                                        child:
                                        GestureDetector(
                                          
                                          onTap:
                                              () {
                                            controller
                                                .setSelectedSports(
                                              Questionnaire
                                                  .yes,
                                            );
                                          },
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             SvgPicture.asset(
                                                 controller.getSelectedSports()==Questionnaire.yes?
                                                 Assets.iconsYes : Assets.iconsNo),                                               5.pw,
                                             Text("Yes",style: controller.getSelectedSports()==Questionnaire.yes? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                           ],
                                         ),
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 1,
                                          color: CColors
                                              .textFieldBorderColor),
                                      Expanded(
                                          child:
                                          GestureDetector(
                              
                                            onTap:
                                                () {
                                              controller
                                                  .setSelectedSports(
                                                Questionnaire.no,
                                              );
                                            },
                                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               SvgPicture.asset(
                                                   controller.getSelectedSports()==Questionnaire.no?
                                                   Assets.iconsYes : Assets.iconsNo),
                                               5.pw,
                                               Text("No",style: controller.getSelectedSports()==Questionnaire.no? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                             ],
                                           ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alcohol",
                                style:
                                CustomTextStyles.black514,
                              ),
                              10.ph,
                              Container(
                                height: 50,
                                width: context.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      13),
                                  border: Border.all(
                                      color: CColors
                                          .textFieldBorderColor),
                                ),
                                child: Obx(
                                      () => Row(
                                    children: [
                                      Expanded(
                                        child:
                                        GestureDetector(

                                          onTap:
                                              () {
                                            controller
                                                .setSelectedAlcohol(
                                              Questionnaire
                                                  .yes,
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  controller.getSelectedAlcohol()==Questionnaire.yes?
                                                  Assets.iconsYes : Assets.iconsNo),                                               5.pw,
                                              Text("Yes",style: controller.getSelectedAlcohol()==Questionnaire.yes? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 1,
                                          color: CColors
                                              .textFieldBorderColor),
                                      Expanded(
                                          child:
                                          GestureDetector(

                                            onTap:
                                                () {
                                              controller
                                                  .setSelectedAlcohol(
                                                Questionnaire.no,
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    controller.getSelectedAlcohol()==Questionnaire.no?
                                                    Assets.iconsYes : Assets.iconsNo),
                                                5.pw,
                                                Text("No",style: controller.getSelectedAlcohol()==Questionnaire.no? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  15.ph,
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Wants children",
                                style:
                                CustomTextStyles.black514,
                              ),
                              10.ph,
                              Container(
                                height: 50,
                                width: context.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      13),
                                  border: Border.all(
                                      color: CColors
                                          .textFieldBorderColor),
                                ),
                                child: Obx(
                                      () => Row(
                                    children: [
                                      Expanded(
                                        child:
                                        GestureDetector(

                                          onTap:
                                              () {
                                            controller
                                                .setSelectedWantChildren(
                                              Questionnaire
                                                  .yes,
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  controller.getSelectedWantChildren()==Questionnaire.yes?
                                                  Assets.iconsYes : Assets.iconsNo),                                               5.pw,
                                              Text("Yes",style: controller.getSelectedWantChildren()==Questionnaire.yes? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 1,
                                          color: CColors
                                              .textFieldBorderColor),
                                      Expanded(
                                          child:
                                          GestureDetector(

                                            onTap:
                                                () {
                                              controller
                                                  .setSelectedWantChildren(
                                                Questionnaire.no,
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    controller.getSelectedWantChildren()==Questionnaire.no?
                                                    Assets.iconsYes : Assets.iconsNo),
                                                5.pw,
                                                Text("No",style: controller.getSelectedWantChildren()==Questionnaire.no? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Has children",
                                style:
                                CustomTextStyles.black514,
                              ),
                              10.ph,
                              Container(
                                height: 50,
                                width: context.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      13),
                                  border: Border.all(
                                      color: CColors
                                          .textFieldBorderColor),
                                ),
                                child: Obx(
                                      () => Row(
                                    children: [
                                      Expanded(
                                        child:
                                        GestureDetector(

                                          onTap:
                                              () {
                                            controller
                                                .setSelectedHasChildren(
                                              Questionnaire
                                                  .yes,
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  controller.getSelectedHasChildren()==Questionnaire.yes?
                                                  Assets.iconsYes : Assets.iconsNo),                                               5.pw,
                                              Text("Yes",style: controller.getSelectedHasChildren()==Questionnaire.yes? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 1,
                                          color: CColors
                                              .textFieldBorderColor),
                                      Expanded(
                                          child:
                                          GestureDetector(

                                            onTap:
                                                () {
                                              controller
                                                  .setSelectedHasChildren(
                                                Questionnaire.no,
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    controller.getSelectedHasChildren()==Questionnaire.no?
                                                    Assets.iconsYes : Assets.iconsNo),
                                                5.pw,
                                                Text("No",style: controller.getSelectedHasChildren()==Questionnaire.no? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  15.ph,
                  Row(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Smoker",
                                style:
                                CustomTextStyles.black514,
                              ),
                              10.ph,
                              Container(
                                height: 50,
                                width: context.width,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      13),
                                  border: Border.all(
                                      color: CColors
                                          .textFieldBorderColor),
                                ),
                                child: Obx(
                                      () => Row(
                                    children: [
                                      Expanded(
                                        child:
                                        GestureDetector(

                                          onTap:
                                              () {
                                            controller
                                                .setSelectedSmoker(
                                              Questionnaire
                                                  .yes,
                                            );
                                          },
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset(
                                                  controller.getSelectedSmoker()==Questionnaire.yes?
                                                  Assets.iconsYes : Assets.iconsNo),                                               5.pw,
                                              Text("Yes",style: controller.getSelectedSmoker()==Questionnaire.yes? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                          height: 50,
                                          width: 1,
                                          color: CColors
                                              .textFieldBorderColor),
                                      Expanded(
                                          child:
                                          GestureDetector(

                                            onTap:
                                                () {
                                              controller
                                                  .setSelectedSmoker(
                                                Questionnaire.no,
                                              );
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                    controller.getSelectedSmoker()==Questionnaire.no?
                                                    Assets.iconsYes : Assets.iconsNo),
                                                5.pw,
                                                Text("No",style: controller.getSelectedSmoker()==Questionnaire.no? CustomTextStyles.primaryLight414 : CustomTextStyles.black414,)
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                  25.ph,
                  CustomElevatedButton(
                      onPressedFunction: (){
                        Get.offAll(()=> HomeScreen());
                      },
                      buttonText: 'Continue',
                    height: 60,
                    radius: 13,
                    gradientColor: buildLinearGradient(),
                    width: context.width-40,
                  ),
                  35.ph,
                ],
              ),
            );
          },),
        ),
      ),
    );
  }
}
