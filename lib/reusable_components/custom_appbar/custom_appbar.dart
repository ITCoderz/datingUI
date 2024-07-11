
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CCAppbar {
  CCAppbar._();

  static AppBar customAppbar(
      {required title,
      bool backIcon = false,
      bool moreIcon = false,
      bool onTapReview = false,
      bool updatingPriceFunction = false,
      bool editIcon = false,
      bool doctorEditIcon = false,
      bool agreement = false}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: const IconThemeData(color: Colors.transparent),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    agreement
                        ? const SizedBox.shrink()
                        : Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 65),
                              child: FittedBox(
                                child: Text(
                                  "$title".tr,
                                  style: CustomTextStyles.black720,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
                backIcon
                    ? GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 25,
                          width: 28,
                          margin: const EdgeInsets.only(left: 24),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.025),
                                    offset: const Offset(0, 1),
                                    blurRadius: 2,
                                    spreadRadius: 2)
                              ]),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            15.ph,
            agreement
                ? const SizedBox.shrink()
                : Divider(
                    color: Colors.black.withOpacity(0.25),
                    height: 1,
                  ),
          ],
        ),
      ),
    );
  }
}
//
