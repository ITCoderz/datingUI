import 'package:dating/api_providers/auth_provider.dart';
import 'package:dating/generated/assets.dart';
import 'package:dating/models/api_models/get_all_user_list_model.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/reusable_components/dialogs/custom_dialog.dart';
import 'package:dating/reusable_components/dropdown/custom_dropdown.dart';
import 'package:dating/screens/home/home_screen/components/custom_drawer.dart';
import 'package:dating/screens/home/home_screen/components/slider_thumb_shape.dart';
import 'package:dating/screens/home/home_screen/controller/home_controller.dart';
import 'package:dating/screens/home/home_screen/view/view_profile_screen.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
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
                onTap: () {
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
              child: FutureBuilder<List<UserProfileDataObj>>(
                future: AuthProvider().getAllUsersList(), // Calling the Future method
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No profiles found.'));
                  }

                  // List of profiles to display
                  final profiles = snapshot.data!;

                  return ListView.builder(
                    itemCount: profiles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final profile = profiles[index];
                      return    Expanded(
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
                                              onTap: () {},
                                              child: const WhiteContainer(
                                                icon: Assets.iconsClear,
                                                padding: 12,
                                              ),
                                            ),
                                            20.pw,
                                            GestureDetector(
                                              onTap: () {
                                                Get.to(() => const ViewProfileScreen());
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
                                            child:profile.media!=null&&profile.media.length>0? Image.network(
                                              height: 470,
                                              width: context.width,
                                              fit: BoxFit.cover,
                                               profile.media[0].originalUrl,
                                              // Placeholder to display while the image is loading
                                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return Center(child: child); // When the image has loaded successfully
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value: loadingProgress.expectedTotalBytes != null
                                                        ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                                        : null,
                                                  ),
                                                );
                                              },
                                              // Error handling for when the image fails to load
                                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                                return Container(
                                                  width: 100,
                                                  height: 100,
                                                  color: Colors.grey, // Fallback color
                                                  child: const Icon(
                                                    Icons.error, // Error icon
                                                    color: Colors.red,
                                                    size: 40,
                                                  ),
                                                );
                                              },
                                            ):
                                            Image.asset(
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
                                                const Color(0xffED7368).withOpacity(1),
                                                const Color(0xffF3B55B).withOpacity(1),
                                              ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "@"+profile.name,
                                                    style: CustomTextStyles.white516,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SvgPicture.asset(
                                                        Assets.iconsLocationPin,
                                                        height: 15,
                                                        colorFilter:
                                                        const ColorFilter.mode(
                                                          CColors.whiteColor,
                                                          BlendMode.srcIn,
                                                        ),
                                                      ),
                                                      5.pw,
                                                      Text(
                                                        profile.city,
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
                                                       profile.age +" year",
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
                                  )


                                ],
                              ),
                            )),
                      );
                    },
                  );
                },
              ),
            ),


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
    double y = position.dy + renderBox.size.height - 80;

    showDialog(
      // barrierColor: Colors.transparent,
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Stack(
            children: [
              Positioned(
                left: 15,
                right: 15,
                top: y,
                child: Material(
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    width: 327,
                    decoration: BoxDecoration(
                     // color: const Color(0xffF3B65B).withOpacity(0.20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: GetBuilder<ProfileController>(
                        builder: (controller) {
                          return SizedBox(
                            height: context.height * 0.7,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.transparent),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Interested in",
                                          style: CustomTextStyles.black514,
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.ph,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: 30,
                                        width: context.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color:
                                                  CColors.textFieldBorderColor),
                                        ),
                                        child: Obx(
                                          () => Row(
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
                                                textStyle: controller
                                                            .getSelectedGender() ==
                                                        Gender.female
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedGender() ==
                                                        Gender.female
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedGender() ==
                                                        Gender.female
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: CColors
                                                    .textFieldBorderColor,
                                              ),
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'Boys',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller.setSelectedGender(
                                                      Gender.male);
                                                },
                                                textStyle: controller
                                                            .getSelectedGender() ==
                                                        Gender.male
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedGender() ==
                                                        Gender.male
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedGender() ==
                                                        Gender.male
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                              Container(
                                                  height: 30,
                                                  width: 1,
                                                  color: CColors
                                                      .textFieldBorderColor),
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
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.ph,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: SizedBox(
                                      height: 40,
                                      child: CustomDropDown(
                                          onChanged: (value) {},
                                          small: true,
                                          label: '',
                                          borderColor:
                                              CColors.textFieldBorderColor,
                                          borderRadius: 13,
                                          hint: 'Location',
                                          mappingList: const [
                                            "Location",
                                            "City"
                                          ],
                                          value: 'value'),
                                    ),
                                  ),
                                  20.ph,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
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
                                  20.ph,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18),
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
                                  10.ph,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Language",
                                          style: CustomTextStyles.black514,
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.ph,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: 30,
                                        width: context.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color:
                                                  CColors.textFieldBorderColor),
                                        ),
                                        child: Obx(
                                          () => Row(
                                            children: [
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'French',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller
                                                      .setSelectedLanguage(
                                                          Language.french);
                                                },
                                                textStyle: controller
                                                            .getSelectedLanguage() ==
                                                        Language.french
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedLanguage() ==
                                                        Language.french
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedLanguage() ==
                                                        Language.french
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: CColors
                                                    .textFieldBorderColor,
                                              ),
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'English',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller
                                                      .setSelectedLanguage(
                                                          Language.english);
                                                },
                                                textStyle: controller
                                                            .getSelectedLanguage() ==
                                                        Language.english
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedLanguage() ==
                                                        Language.english
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedLanguage() ==
                                                        Language.english
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                              Container(
                                                  height: 30,
                                                  width: 1,
                                                  color: CColors
                                                      .textFieldBorderColor),
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'Spanish',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller
                                                      .setSelectedLanguage(
                                                          Language.spanish);
                                                },
                                                textStyle: controller
                                                            .getSelectedLanguage() ==
                                                        Language.spanish
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedLanguage() ==
                                                        Language.spanish
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedLanguage() ==
                                                        Language.spanish
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  20.ph,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "Relationship",
                                          style: CustomTextStyles.black514,
                                        ),
                                      ),
                                    ],
                                  ),
                                  10.ph,
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                        height: 30,
                                        width: context.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color:
                                                  CColors.textFieldBorderColor),
                                        ),
                                        child: Obx(
                                          () => Row(
                                            children: [
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'Serious',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller
                                                      .setSelectedRelationship(
                                                    Relationship.serious,
                                                  );
                                                },
                                                textStyle: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.serious
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.serious
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.serious
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                              Container(
                                                height: 30,
                                                width: 1,
                                                color: CColors
                                                    .textFieldBorderColor,
                                              ),
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'Fun',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller
                                                      .setSelectedRelationship(
                                                          Relationship.fun);
                                                },
                                                textStyle: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.fun
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.fun
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.fun
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                              Container(
                                                  height: 30,
                                                  width: 1,
                                                  color: CColors
                                                      .textFieldBorderColor),
                                              Expanded(
                                                  child: CustomElevatedButton(
                                                buttonText: 'Friends',
                                                height: 30,
                                                needShadow: false,
                                                onPressedFunction: () {
                                                  controller
                                                      .setSelectedRelationship(
                                                    Relationship.friends,
                                                  );
                                                },
                                                textStyle: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.friends
                                                    ? CustomTextStyles.white412
                                                    : CustomTextStyles.black412,
                                                backgroundColor: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.friends
                                                    ? null
                                                    : Colors.transparent,
                                                gradientColor: controller
                                                            .getSelectedRelationship() ==
                                                        Relationship.friends
                                                    ? buildLinearGradient()
                                                    : null,
                                                radius: 0,
                                              )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  20.ph,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
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
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  height: 30,
                                                  width: context.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: CColors
                                                            .textFieldBorderColor),
                                                  ),
                                                  child: Obx(
                                                    () => Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              CustomElevatedButton(
                                                            buttonText: 'Yes',
                                                            height: 30,
                                                            needShadow: false,
                                                            onPressedFunction:
                                                                () {
                                                              controller
                                                                  .setSelectedSports(
                                                                Questionnaire
                                                                    .yes,
                                                              );
                                                            },
                                                            textStyle: controller
                                                                        .getSelectedSports() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? CustomTextStyles
                                                                    .white412
                                                                : CustomTextStyles
                                                                    .black412,
                                                            backgroundColor: controller
                                                                        .getSelectedSports() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? null
                                                                : Colors
                                                                    .transparent,
                                                            gradientColor: controller
                                                                        .getSelectedSports() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? buildLinearGradient()
                                                                : null,
                                                            radius: 0,
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 30,
                                                            width: 1,
                                                            color: CColors
                                                                .textFieldBorderColor),
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'No',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedSports(
                                                              Questionnaire.no,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedSports() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedSports() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedSports() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                      ],
                                                    ),
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
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  height: 30,
                                                  width: context.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: CColors
                                                            .textFieldBorderColor),
                                                  ),
                                                  child: Obx(
                                                    () => Row(
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'Yes',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedAlcohol(
                                                              Questionnaire.yes,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedAlcohol() ==
                                                                  Questionnaire
                                                                      .yes
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedAlcohol() ==
                                                                  Questionnaire
                                                                      .yes
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedAlcohol() ==
                                                                  Questionnaire
                                                                      .yes
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                        Container(
                                                            height: 30,
                                                            width: 1,
                                                            color: CColors
                                                                .textFieldBorderColor),
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'No',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedAlcohol(
                                                              Questionnaire.no,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedAlcohol() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedAlcohol() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedAlcohol() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  20.ph,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
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
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  height: 30,
                                                  width: context.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: CColors
                                                            .textFieldBorderColor),
                                                  ),
                                                  child: Obx(
                                                    () => Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              CustomElevatedButton(
                                                            buttonText: 'Yes',
                                                            height: 30,
                                                            needShadow: false,
                                                            onPressedFunction:
                                                                () {
                                                              controller
                                                                  .setSelectedWantChildren(
                                                                Questionnaire
                                                                    .yes,
                                                              );
                                                            },
                                                            textStyle: controller
                                                                        .getSelectedWantChildren() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? CustomTextStyles
                                                                    .white412
                                                                : CustomTextStyles
                                                                    .black412,
                                                            backgroundColor: controller
                                                                        .getSelectedWantChildren() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? null
                                                                : Colors
                                                                    .transparent,
                                                            gradientColor: controller
                                                                        .getSelectedWantChildren() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? buildLinearGradient()
                                                                : null,
                                                            radius: 0,
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 30,
                                                            width: 1,
                                                            color: CColors
                                                                .textFieldBorderColor),
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'No',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedWantChildren(
                                                              Questionnaire.no,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedWantChildren() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedWantChildren() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedWantChildren() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                      ],
                                                    ),
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
                                                "Has Children",
                                                style:
                                                    CustomTextStyles.black514,
                                              ),
                                              10.ph,
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  height: 30,
                                                  width: context.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: CColors
                                                            .textFieldBorderColor),
                                                  ),
                                                  child: Obx(
                                                    () => Row(
                                                      children: [
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'Yes',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedHasChildren(
                                                              Questionnaire.yes,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedHasChildren() ==
                                                                  Questionnaire
                                                                      .yes
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedHasChildren() ==
                                                                  Questionnaire
                                                                      .yes
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedHasChildren() ==
                                                                  Questionnaire
                                                                      .yes
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                        Container(
                                                            height: 30,
                                                            width: 1,
                                                            color: CColors
                                                                .textFieldBorderColor),
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'No',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedHasChildren(
                                                              Questionnaire.no,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedHasChildren() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedHasChildren() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedHasChildren() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  20.ph,
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
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
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Container(
                                                  height: 30,
                                                  width: context.width,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: CColors
                                                            .textFieldBorderColor),
                                                  ),
                                                  child: Obx(
                                                    () => Row(
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              CustomElevatedButton(
                                                            buttonText: 'Yes',
                                                            height: 30,
                                                            needShadow: false,
                                                            onPressedFunction:
                                                                () {
                                                              controller
                                                                  .setSelectedSmoker(
                                                                Questionnaire
                                                                    .yes,
                                                              );
                                                            },
                                                            textStyle: controller
                                                                        .getSelectedSmoker() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? CustomTextStyles
                                                                    .white412
                                                                : CustomTextStyles
                                                                    .black412,
                                                            backgroundColor: controller
                                                                        .getSelectedSmoker() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? null
                                                                : Colors
                                                                    .transparent,
                                                            gradientColor: controller
                                                                        .getSelectedSmoker() ==
                                                                    Questionnaire
                                                                        .yes
                                                                ? buildLinearGradient()
                                                                : null,
                                                            radius: 0,
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 30,
                                                            width: 1,
                                                            color: CColors
                                                                .textFieldBorderColor),
                                                        Expanded(
                                                            child:
                                                                CustomElevatedButton(
                                                          buttonText: 'No',
                                                          height: 30,
                                                          needShadow: false,
                                                          onPressedFunction:
                                                              () {
                                                            controller
                                                                .setSelectedSmoker(
                                                              Questionnaire.no,
                                                            );
                                                          },
                                                          textStyle: controller.getSelectedSmoker() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? CustomTextStyles
                                                                  .white412
                                                              : CustomTextStyles
                                                                  .black412,
                                                          backgroundColor: controller
                                                                      .getSelectedSmoker() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? null
                                                              : Colors
                                                                  .transparent,
                                                          gradientColor: controller
                                                                      .getSelectedSmoker() ==
                                                                  Questionnaire
                                                                      .no
                                                              ? buildLinearGradient()
                                                              : null,
                                                          radius: 0,
                                                        )),
                                                      ],
                                                    ),
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
                                  20.ph,
                                  CustomElevatedButton(
                                    onPressedFunction: () {
                                      Get.back();
                                    },
                                    gradientColor: buildLinearGradient(),
                                    buttonText: "Search",
                                    height: 40,
                                    width: 200,
                                  ),
                                  20.ph,
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
