
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dating/screens/onboarding/controller/onboarding_controller.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';

class OnboardingScreen extends StatelessWidget {
   OnboardingScreen({super.key});

  final List<String>? imagesList1=[
    Assets.imagesPhoto1,
    Assets.imagesPhoto2,
    Assets.imagesPhoto3,
  ];

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: GetBuilder<OnboardingController>(
        init: OnboardingController(),
        builder: (onBoardingProvider) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Obx(()=> Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0,right: 20,top: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 2,
                        width: 75,
                        margin: const EdgeInsets.only(top: 40),
                        color: const Color(0xffF8D267),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onBoardingProvider.pageIndex.value==0?   "Meet\nnew friends" : 'Lorem\nIpsum is ',
                              style: CustomTextStyles.black430,),
                            Text("Lorem Ipsum is simply dummy text of the printing. ",style: CustomTextStyles.black316,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ) ,
                50.ph,
                CarouselSlider(
                    carouselController:
                    onBoardingProvider.carouselController,
                    options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction: 0.7,
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                      height: 400,
                      initialPage: onBoardingProvider.pageIndex.value,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) {
                        onBoardingProvider.pageIndex.value=index;
                      },
                    ),
                    items: imagesList1!
                        .map(
                          (item) => GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            item,
                            fit: BoxFit.fill,
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    )
                        .toList()
                ),

              ],
            )),
            bottomNavigationBar: buildBottomNavigationBar(),
          );
        },
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    final controller = Get.find<OnboardingController>();

    return Obx(() {
      return BottomAppBar(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                TextButton(
                  onPressed: controller.skip,
                  child:  Text('  Skip',style: CustomTextStyles.black416,),
                ),
              Row(
                children: List.generate(3, (index) {
                  return ClipRRect(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.pageIndex.value == index ? 19 : 4,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular( controller.pageIndex.value == index ? 15:100),
                        // shape: controller.pageIndex.value == index ? BoxShape.rectangle : BoxShape.circle,
                        color: controller.pageIndex.value >= index ? Colors.orange : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
                Container(
                  height: 50,
                  width: 120,
                  decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                    gradient: buildLinearGradient()
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: controller.previousPage,
                        icon: SvgPicture.asset(Assets.iconsArrowRightCircle),
                      ),
                      IconButton(
                        onPressed: controller.pageIndex.value==2? controller.skip : controller.nextPage,
                        icon: SvgPicture.asset(Assets.iconsArrowLeftCircle),
                      ),
                    ],
                  ),
                ),


            ],
          ),
        ),
      );
    });
  }
}

LinearGradient buildLinearGradient({bool leftToRight=false}) {
  return  LinearGradient(
      colors: const [
        Color(0xffED7368),
        Color(0xffF3B55B),
      ],
      begin: leftToRight? Alignment.centerLeft: Alignment.topCenter,
      end: leftToRight? Alignment.centerRight:  Alignment.bottomCenter
  );
}
