
import 'package:dating/generated/assets.dart';
import 'package:dating/screens/home/chat/message_screen/views/chat_screen.dart';
import 'package:dating/screens/home/home_screen/view/home_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/constants/constant_lists.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomAppBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 100,
          width: context.width,
          color: Colors.transparent,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BottomAppBar(
            color: Colors.white,
            elevation: 20,
            height: 60,
            notchMargin: 0,
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int index = 0;
                index < ConstantLists.bottomBarList.length;
                index++) ...[
                  Expanded(
                    flex: 1,
                    child: BottomNavBarComponent(
                      selectedIndex: selectedIndex,
                      bottomBarModel: ConstantLists.bottomBarList[index],
                    ),
                  )
                ]
              ],
            ),
          ),
        ),
        Positioned(
          bottom:30,
          left: 0,
          right: 0,
          child: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(15),
          decoration:  BoxDecoration(
              shape: BoxShape.circle,
              gradient: buildLinearGradient(),
              border: Border.all(color: Colors.white),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    offset: Offset(0,0),
                    blurRadius: 10

                )
              ]
          ),
          child: SvgPicture.asset(Assets.iconsSearch,height: 35,),
        ),)
      ],
    );
  }
}

class BottomNavBarComponent extends StatelessWidget {
  final int selectedIndex;
  final BottomNavigationBarModel bottomBarModel;

  const BottomNavBarComponent({
    super.key,
    required this.selectedIndex,
    required this.bottomBarModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        12,
      ),
      onTap: selectedIndex == bottomBarModel.itemIndex
          ? null
          : bottomBarModel.itemIndex == 0
              ? () {
                  Get.offAll(
                    () => const ChatScreen(),
                    transition: Constants.appTransition,
                  );
                }
              : bottomBarModel.itemIndex == 1
                  ? () {
                      Get.offAll(
                        () => const HomeScreen(),
                        transition: Constants.appTransition,
                      );
                    }
                      : () {
                              Get.offAll(
                                () => const HomeScreen(),
                                transition: Constants.appTransition,
                              );
                            },
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            bottomBarModel.itemIndex==1? const Text(''):
             SvgPicture.asset(
                    bottomBarModel.assetString,
                    height: 25,
                    width: 25,
                    color: selectedIndex == bottomBarModel.itemIndex
                        ? CColors.iconEnableColor
                        : CColors.iconDisableColor,
                  ),
          ],
        ),
      ),
    );
  }
}
