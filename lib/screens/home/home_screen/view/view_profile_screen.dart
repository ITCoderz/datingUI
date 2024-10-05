import 'package:dating/generated/assets.dart';
import 'package:dating/models/api_models/get_all_user_list_model.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/screens/home/chat/message_screen/views/message_screen.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../reusable_components/buttons/custom_elevated_button.dart';
import '../../../onboarding/views/onboarding_screen.dart';

class ViewProfileScreen extends StatelessWidget {
  UserProfileDataObj userObj;

  ViewProfileScreen(this.userObj);

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
        body: ListView(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: context.height - 95,
                  width: context.width,
                ),ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child:userObj.media.length>0?
                    Center(
                      child: Image.network(
                        height: 470,
                        width: context.width,
                        fit: BoxFit.cover,
                        userObj.media[0].originalUrl,
                        // Placeholder to display while the image is loading
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return Center(child: child); // When the image has loaded successfully
                          }
                          return Align(
                            alignment: Alignment.center,
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
                      ),
                    ):
                    Image.asset(
                      Assets.imagesPhoto,
                      height: 470,
                      width: context.width,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  top: context.height * 0.42,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: context.height * 0.45,
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
                                  userObj.name,
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
                                  userObj.city,
                                  style: CustomTextStyles.black412,
                                ),
                                const Spacer(),
                                Text(
                                  userObj.age + " year",
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
                              userObj.about.toString(),
                              style: CustomTextStyles.black314,
                            ),
                            10.ph,
                            Text(
                              'Photos',
                              style: CustomTextStyles.primary520,
                            ),

                            Column(
                              children: [
                                5.ph,
                                // GridView with two items per row
                                userObj.media.length>0 ?     SizedBox(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(), // Disable scrolling inside GridView
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, // Two items per row
                                      crossAxisSpacing: 10, // Spacing between items horizontally
                                      mainAxisSpacing: 10, // Spacing between items vertically
                                      childAspectRatio: 1, // Adjust for image aspect ratio
                                    ),
                                    itemCount: userObj.media.length, // Total number of images (adjust based on your needs)
                                    itemBuilder: (context, index) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          userObj.media[index].originalUrl,
                                          // Placeholder to display while the image is loading
                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                            if (loadingProgress == null) {
                                              return Center(child: child); // When the image has loaded successfully
                                            }
                                            return Align(
                                              alignment: Alignment.center,
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
                                        )
                                      );
                                    },
                                  ),
                                ):Text('No Images Uploaded yet'),
                                30.ph,
                                CustomElevatedButton(
                                  onPressedFunction: () {},
                                  height: 60,
                                  radius: 13,
                                  gradientColor: buildLinearGradient(leftToRight: true),
                                  buttonText: "Block User",
                                  width: context.width,
                                ),
                              ],
                            )
,
                            50.ph,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: context.height * 0.37,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const WhiteContainer(
                        icon: Assets.iconsClear,
                        padding: 20,
                        shadow: true,
                        height: 58,
                        width: 58,
                      ),
                      20.pw,
                      GestureDetector(
                        onTap: () {
                          Get.to(() => MessageScreen());
                        },
                        child: const WhiteContainer(
                          icon: Assets.iconsChatBubble,
                          shadow: false,
                          padding: 15,
                          height: 73,
                          width: 73,
                          borderColor: CColors.textFieldBorderColor,
                        ),
                      ),
                      20.pw,
                      const WhiteContainer(
                        icon: Assets.iconsStar,
                        shadow: true,
                        padding: 15,
                        height: 58,
                        width: 58,
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
