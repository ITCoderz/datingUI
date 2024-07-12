import 'dart:ui';

import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              30.ph,
              //No Favourite
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
              SvgPicture.asset(Assets.imagesNoFav)
              /*Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    crossAxisCount: 2,  // Adjust as needed
                    childAspectRatio: 1 / 1.5,  // Adjust the aspect ratio to fit the height
                  ),

                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(Assets.imagesPhoto,height: 470,width: context.width,fit: BoxFit.cover,)),
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
                                      const Color(0xffFFFFFF).withOpacity(0.5),
                                      const Color(0xffFFFFFF).withOpacity(0.155),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Name here",style: CustomTextStyles.white513,),
                                const Spacer(),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                5.pw,
                                Text("21",style: CustomTextStyles.white412,),
                                5.pw,
                                const Icon(Icons.favorite,color: Colors.white,size: 20,)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: SvgPicture.asset(Assets.iconsClear,height: 15,color: Colors.white,),
                        )
                      ],
                    );
                  },
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
