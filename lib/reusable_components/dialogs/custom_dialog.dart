import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialogs {
  static customDialog({
    required BuildContext context,
    required String titleImage,
    required String titleText,
    required String subtitle,
    required Widget buttonWidget,

  }) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            insetPadding: const EdgeInsets.symmetric(horizontal: 30),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                borderSide: const BorderSide(color: Colors.transparent)),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const SizedBox(
                  height: 235,
                  width: 321,
                ),
                
               Positioned(
                 bottom: 0,
                 left: 0,
                 right: 0,
                 child:  Container(
                 height: 210,
                 width: 321,
                 decoration: BoxDecoration(boxShadow: [
                   BoxShadow(
                       color: CColors.blackTextColor.withOpacity(0.26),
                       blurRadius: 60,
                       spreadRadius: 0,
                       offset: const Offset(0, 4))
                 ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
                 child: Stack(
                   children: [
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 15),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           25.ph,
                           Center(
                             child: Text(
                               titleText,
                               style: CustomTextStyles.black616,
                             ),
                           ),
                           10.ph,
                           Center(
                             child: Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10),
                               child: Text(subtitle,
                                 textAlign: TextAlign.center,
                                 style: GoogleFonts.roboto(
                                   fontSize: 13,
                                   fontWeight: FontWeight.w400,
                                   color: const Color(0xff808080)
                               ),),
                             ),
                           ),
                           20.ph,
                           buttonWidget,
                           10.ph,
                           10.ph,
                         ],
                       ),
                     ),
                    Padding(
                       padding: const EdgeInsets.only(top: 5, right: 5),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           IconButton(
                               onPressed: () {
                                 Get.back();
                               },
                               icon: const Icon(
                                 Icons.clear,
                                 size: 17,
                                 color: Color(0xff808080),
                               )),
                         ],
                       ),
                     )

                   ],
                 ),
               ),),
                Positioned(
                    top: 0,
                    child: SvgPicture.asset(titleImage,height: 50,width: 50,))
              ],
            ));
      },
    );
  }
}