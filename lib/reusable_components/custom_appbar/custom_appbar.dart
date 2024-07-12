import 'package:dating/generated/assets.dart';
import 'package:dating/screens/home/home_screen/view/favourite_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget(
      {super.key,
      this.title,
      this.onTap,
      this.backButton = false,
      this.addButton = false,
      this.favButton = false,
      this.drawer = false,
      this.addTap,
      });

  String? title;
  Function()? onTap, addTap;
  bool backButton, addButton, favButton,drawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: SizedBox(
        height: 97,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(-4,1),
                blurRadius: 10
              )
            ],
            gradient: buildLinearGradient(leftToRight: true)
          ),
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    drawer == true
                        ? Padding(
                      padding: const EdgeInsets.only(top: 15,left: 10),
                      child: GestureDetector(
                          onTap: onTap,
                          child: const Icon(
                            Icons.menu,
                            size: 24,
                            color: Colors.white,
                          )),
                    )
                        : const SizedBox(),
                    backButton == true
                        ? GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 15,left: 10),
                              child: SvgPicture.asset(Assets.iconsBackIcon),
                            ),
                        )
                        : const SizedBox(),
                    const Spacer(),

                    favButton == true
                        ? Padding(
                            padding: const EdgeInsets.only(right: 10,top: 15),
                            child: InkWell(
                              onTap: (){
                                Get.to(()=> const FavouriteScreen());
                              },
                              child: SvgPicture.asset(
                                 Assets.iconsFav,
                                width: 30,
                                height: 30,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    favButton == true
                        ? favButton == true ? 16.ph : 0.ph
                        : const SizedBox.shrink(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$title",
                        style:CustomTextStyles.white624,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
//
