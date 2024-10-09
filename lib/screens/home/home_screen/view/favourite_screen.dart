import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/screens/home/home_screen/controller/home_controller.dart';
import 'package:dating/screens/home/home_screen/view/favrt_conntroller.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../reusable_components/buttons/custom_elevated_button.dart';
import '../../../../reusable_components/text_field/simple_text_field_without_height.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../onboarding/views/onboarding_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    final favrtController =Get.find<FavouriteController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Favorites",
              backButton: true,
              favButton: true,
              onTap: () {
                Get.back();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              //No Fav
              /*  Column(
                children: [

                  //No Favourite
                  CustomTextField(
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
                  20.ph,
                  Center(
                      child: Text(
                    "No favorites added yet !",
                    style: CustomTextStyles.black520,
                  )),
                  5.ph,
                  Center(
                      child: Text("Explore the app to find like minded people",
                          style: CustomTextStyles.black414)),
                  30.ph,
                  const Spacer(),
                  // SvgPicture.asset(Assets.imagesNoFav),
                  CustomElevatedButton(
                    onPressedFunction: () {
                      Get.to(()=> HomeScreen());
                    },
                    height: 60,
                    radius: 13,
                    gradientColor: buildLinearGradient(leftToRight: true),
                    buttonText: "Add User",
                    width: context.width,
                  ),
                  50.ph,
                ],
              ),*/

              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.favourite.value = true;
                              },
                              child: Container(
                                height: 40,
                                width: 164,
                                decoration: BoxDecoration(
                                    gradient: controller.favourite.value
                                        ? buildLinearGradient()
                                        : null,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    'Favorites',
                                    style: controller.favourite.value
                                        ? CustomTextStyles.white518
                                        : CustomTextStyles.black518,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.favourite.value = false;
                              },
                              child: Container(
                                height: 40,
                                width: 164,
                                decoration: BoxDecoration(
                                    gradient: controller.favourite.value
                                        ? null
                                        : buildLinearGradient(),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Center(
                                  child: Text(
                                    'Picked by',
                                    style: controller.favourite.value
                                        ? CustomTextStyles.black518
                                        : CustomTextStyles.white518,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            width: 164 * 2,
                            color: CColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    20.ph,
      Expanded(
        child: FutureBuilder<void>(
          future: favrtController.fetchItems(), // Use the fetch method from controller
          builder: (context, snapshot) {
            if (favrtController.isLoading.value) {
              // Show a loading indicator while data is loading
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                ),
                itemCount: favrtController.items.length, // Use the fetched items length
                itemBuilder: (context, index) {
                  final userItem = favrtController.items[index]; // Get the specific item
                  return Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: userItem.user.userImage!=null
                              ? Center(
                            child: Image.network(
                              height: 230,
                              width: context.width,
                              fit: BoxFit.cover,
                              userItem.user.userImage.toString(),
                              // Placeholder to display while the image is loading
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return Center(
                                      child:
                                      child); // When the image has loaded successfully
                                }
                                return Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                        null
                                        ? loadingProgress
                                        .cumulativeBytesLoaded /
                                        (loadingProgress
                                            .expectedTotalBytes ??
                                            1)
                                        : null,
                                  ),
                                );
                              },
                              // Error handling for when the image fails to load
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
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
                          )
                              : Image.asset(
                            Assets.imagesPhoto,
                            height: 222,
                            width: context.width,
                            fit: BoxFit.cover,
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.asset(
                          Assets.imagesPhoto,
                          height: 222,
                          width: context.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        left: 10,
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xffFFFFFF).withOpacity(0.50),
                                const Color(0xffFFFFFF).withOpacity(0.155),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                userItem.user.name, // Use the actual property
                                style: CustomTextStyles.white513,
                              ),
                              const Spacer(),
                              Container(
                                height: 30,
                                width: 1,
                                color: Colors.black,
                              ),
                              5.pw,
                              Text(
                                userItem.user.age, // Use the actual property for age or similar
                                style: CustomTextStyles.white412,
                              ),
                              5.pw,
                              Obx(() => controller.favourite.value
                                  ? const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20,
                              )
                                  : const SizedBox.shrink()),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: SvgPicture.asset(
                          Assets.iconsClear,
                          height: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(child: Text("Error loading data"));
            }
          },
        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
