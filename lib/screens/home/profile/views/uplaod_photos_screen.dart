import 'dart:io';

import 'package:dating/generated/assets.dart';
import 'package:dating/models/api_models/user_profile_model.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/screens/home/profile/controllers/edit_profile_controllers.dart';
import 'package:dating/screens/home/profile/views/password_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../reusable_components/custom_appbar/custom_appbar.dart';

class EditUploadYourPhotosScreen extends StatelessWidget {
  final controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Edit Profile",
              backButton: true,
              favButton: true,
              onTap: () {
                Get.back();
              },
            )),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Center(
                      child: SizedBox(
                        width: 216,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 108,
                                  height: 2,
                                  color: CColors.lightYellowColor,
                                ),
                                Container(
                                  width: 108,
                                  height: 2,
                                  color: CColors.textFieldBorderColor
                                      .withOpacity(0.5),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CColors.lightYellowColor,
                                  ),
                                  child: SvgPicture.asset(Assets.iconsEditIcon),
                                ),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CColors.lightYellowColor,
                                  ),
                                  child: SvgPicture.asset(Assets.iconsEditIcon),
                                ),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CColors.textFieldBorderColor
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  30.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Upload Your Photos',
                      style: CustomTextStyles.black624,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  20.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 6.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(0);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery (index 0)
                                    if (controller.selectedImage0.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage0.value!.path),
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(0);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    // If no gallery image, check for network image (index 0)
                                    if (controller.user!.media.isNotEmpty) {
                                      return controller.isDeleted0.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ): Stack(
                                        children: [
                                          Image.network(
                                            controller
                                                .user!.media[0].originalUrl
                                                .toString(),
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Center(
                                                child: Icon(
                                                  Icons.error,
                                                  color: CColors.primaryColor,
                                                ),
                                              );
                                            },
                                          ),

                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setDeleted(true, 0,controller
                                                    .user!.media[0].id);
                                                // controller.setImagesAsNull(0);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                      const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      );
                                    }

                                    // Fallback widget
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Add some spacing between the widgets
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(1);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery (index 1)
                                    if (controller.selectedImage1.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage1.value!.path),
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(1);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    // If no gallery image, check for network image (index 1)
                                    if (controller.user!.media.length > 1) {
                                      return controller.isDeleted1.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ): Stack(children: [

                                        Image.network(
                                          controller.user!.media[1].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 1,controller
                                                  .user!.media[1].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }

                                    // Fallback widget
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 6.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(2);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery

                                    if (controller.selectedImage2.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage2.value!.path),
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(2);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                    if (controller.user!.media.length > 2) {
                                      return controller.isDeleted2.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ):
                                      Stack(children: [

                                        Image.network(
                                          controller.user!.media[2].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 2,controller
                                                  .user!.media[2].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        15.pw,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(3);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery

                                    if (controller.selectedImage3.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage3.value!.path),
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(3);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                    if (controller.user!.media.length > 3) {
                                      return controller.isDeleted3.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ):
                                      Stack(children: [

                                        Image.network(
                                          controller.user!.media[3].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 3,controller
                                                  .user!.media[3].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 6.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(4);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery

                                    if (controller.selectedImage4.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage4.value!.path),
                                            // Show picked image
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(4);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 4) {
                                      return controller.isDeleted4.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ):
                                      Stack(children: [

                                        Image.network(
                                          controller.user!.media[4].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 4,controller
                                                  .user!.media[4].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }

                                    // If neither, show a fallback widget
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        15.pw,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(5);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery

                                    if (controller.selectedImage5.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage5.value!.path),
                                            // Show picked image
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(5);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 5) {
                                      return controller.isDeleted5.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ):
                                      Stack(children: [

                                        Image.network(
                                          controller.user!.media[5].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 5,controller
                                                  .user!.media[5].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }

                                    // If neither, show a fallback widget
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 6.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(6);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery

                                    if (controller.selectedImage6.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage6.value!.path),
                                            // Show picked image
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(6);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 6) {
                                      return controller.isDeleted6.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ):
                                      Stack(children: [

                                        Image.network(
                                          controller.user!.media[6].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 6,controller
                                                  .user!.media[6].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }

                                    // If neither, show a fallback widget
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                        15.pw,
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.selectImage(7);
                            },
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              strokeWidth: 1,
                              radius: const Radius.circular(13),
                              color: CColors.textFieldBorderColor,
                              padding: const EdgeInsets.all(1),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(13)),
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery

                                    if (controller.selectedImage7.value !=
                                        null) {
                                      return Stack(
                                        children: [
                                          Image.file(
                                            File(controller
                                                .selectedImage7.value!.path),
                                            // Show picked image
                                            fit: BoxFit.cover,
                                            height: 155,
                                            width: 155,
                                          ),
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.setImagesAsNull(7);
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                padding:
                                                    const EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      offset:
                                                          const Offset(4, 4),
                                                      blurRadius: 10,
                                                    ),
                                                  ],
                                                ),
                                                child: const Icon(
                                                  Icons.delete,
                                                  color: CColors.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                    // If no gallery image, check for network image

                                    if (controller.user!.media.length > 7) {
                                      return controller.isDeleted7.value? Center(
                                        child: Icon(
                                          Icons.add,
                                          size: 36,
                                          color: CColors.primaryColor,
                                        ),
                                      ):
                                      Stack(children: [

                                        Image.network(
                                          controller.user!.media[7].originalUrl
                                              .toString(),
                                          fit: BoxFit.cover,
                                          height: 155,
                                          width: 155,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Center(
                                              child: Icon(
                                                Icons.error,
                                                color: CColors.primaryColor,
                                              ),
                                            );
                                          },
                                        ),

                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.setDeleted(true, 7,controller
                                                  .user!.media[7].id);
                                              // controller.setImagesAsNull(0);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              padding:
                                              const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    offset:
                                                    const Offset(4, 4),
                                                    blurRadius: 10,
                                                  ),
                                                ],
                                              ),
                                              child: const Icon(
                                                Icons.delete,
                                                color: CColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],);
                                    }

                                    // If neither, show a fallback widget
                                    return const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 36,
                                        color: CColors.primaryColor,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.ph,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: CustomElevatedButton(
                      onPressedFunction: () {
                        Get.to(() => const EditCreatePasswordScreen());
                      },
                      height: 60,
                      radius: 13,
                      gradientColor: buildLinearGradient(leftToRight: true),
                      buttonText: "Update",
                      width: context.width,
                    ),
                  ),
                  150.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
