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
                              controller.selectImage();
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
                                child:  Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery
                                    if (controller.images.length > 0) {
                                      if (controller.images[0] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[0]),
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
                                                  controller.images.removeAt(0);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 0) {
                                      return Image.network(
                                        controller.user!.media[0].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                child:  Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() {
                                    // Check if images are picked from gallery
                                    if (controller.images.length > 3) {
                                      if (controller.images[3] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[3]),
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
                                                  controller.images.removeAt(3);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 3) {
                                      return Image.network(
                                        controller.user!.media[2].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                    if (controller.images.length > 4) {
                                      if (controller.images[4] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[4]),
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
                                                  controller.images.removeAt(4);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 4) {
                                      return Image.network(
                                        controller.user!.media[4].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                    if (controller.images.length > 5) {
                                      if (controller.images[5] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[5]),
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
                                                  controller.images.removeAt(5);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 5) {
                                      return Image.network(
                                        controller.user!.media[5].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                    if (controller.images.length > 6) {
                                      if (controller.images[6] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[6]),
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
                                                  controller.images.removeAt(6);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 6) {
                                      return Image.network(
                                        controller.user!.media[6].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                    if (controller.images.length > 7) {
                                      if (controller.images[7] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[7]),
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
                                                  controller.images.removeAt(7);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 7) {
                                      return Image.network(
                                        controller.user!.media[7].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                    if (controller.images.length > 8) {
                                      if (controller.images[8] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[8]),
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
                                                  controller.images.removeAt(8);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 8) {
                                      return Image.network(
                                        controller.user!.media[8].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
                              controller.selectImage();
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
                                    if (controller.images.length > 9) {
                                      if (controller.images[9] != null) {
                                        return Stack(
                                          children: [
                                            Image.file(
                                              File(controller.images[9]),
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
                                                  controller.images.removeAt(9);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  padding:
                                                  const EdgeInsets.all(3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        5),
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
                                    }
                                    // If no gallery image, check for network image
                                    if (controller.user!.media.length > 9) {
                                      return Image.network(
                                        controller.user!.media[9].originalUrl
                                            .toString(), // Show network image
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
                                      );
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
