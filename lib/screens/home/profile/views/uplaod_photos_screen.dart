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

  List<Media> mediaList=[];
  Map userMapData={};
  EditUploadYourPhotosScreen(this.mediaList,this.userMapData);


  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
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
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  color: CColors.whiteColor,
                                  child: Obx(() => controller.images.isNotEmpty
                                      ?controller.mediaList.isNotEmpty?
                                      Image.network(mediaList[0].originalUrl.toString())
                                      : controller.images[0] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[0]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(0);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>
                                  controller.mediaList.length>1?
                                  Image.network(mediaList[1].originalUrl.toString()):

                                  controller.images.length >= 2

                                      ? controller.images[1] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[1]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(1);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>

                                  controller.mediaList.length>3?
                                  Image.network(mediaList[2].originalUrl.toString()):

                                  controller.images.length >= 3
                                      ? controller.images[2] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[2]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(2);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>
                                  controller.mediaList.length>4?
                                  Image.network(mediaList[3].originalUrl.toString()):


                                  controller.images.length >= 4
                                      ? controller.images[3] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[3]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(3);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>
                                  controller.mediaList.length>5?
                                  Image.network(mediaList[4].originalUrl.toString()):

                                  controller.images.length >= 5
                                      ? controller.images[4] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[4]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(4);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>

                                  controller.mediaList.length>6?
                                  Image.network(mediaList[5].originalUrl.toString()):

                                  controller.images.length >= 6
                                      ? controller.images[5] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[5]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(5);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>

                                  controller.mediaList.length>7?
                                  Image.network(mediaList[6].originalUrl.toString()):

                                  controller.images.length >= 7
                                      ? controller.images[6] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[6]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(6);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>

                                  controller.mediaList.length>8?
                                  Image.network(mediaList[7].originalUrl.toString()):


                                  controller.images.length >= 8
                                      ?

                                  controller.images[7] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[7]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(7);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>

                                  controller.mediaList.length>9?
                                  Image.network(mediaList[8].originalUrl.toString()):


                                  controller.images.length >= 9
                                      ? controller.images[8] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[8]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(8);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
                                  child: Obx(() =>

                                  controller.mediaList.length>10?
                                  Image.network(mediaList[9].originalUrl.toString()):



                                  controller.images.length >=
                                          10
                                      ? controller.images[9] == null
                                          ? const Center(
                                              child: Icon(
                                                Icons.add,
                                                size: 36,
                                                color: CColors.primaryColor,
                                              ),
                                            )
                                          : Stack(
                                              children: [
                                                Image.file(
                                                  File(controller.images[9]),
                                                  fit: BoxFit.cover,
                                                  height: 155,
                                                  width: 155,
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  top: 8,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller.images
                                                          .removeAt(9);
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              3),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.2),
                                                                offset:
                                                                    const Offset(
                                                                        4, 4),
                                                                blurRadius: 10)
                                                          ]),
                                                      child: const Icon(
                                                        Icons.delete,
                                                        color: CColors
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )
                                      : const Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 36,
                                            color: CColors.primaryColor,
                                          ),
                                        )),
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
