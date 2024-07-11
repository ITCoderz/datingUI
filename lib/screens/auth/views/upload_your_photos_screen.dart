import 'dart:io';

import 'package:dating/generated/assets.dart';
import 'package:dating/reusable_components/buttons/custom_elevated_button.dart';
import 'package:dating/reusable_components/dropdown/custom_dropdown.dart';
import 'package:dating/reusable_components/text_field/simple_text_field_without_height.dart';
import 'package:dating/screens/auth/controllers/auth_controllers.dart';
import 'package:dating/screens/auth/views/create_password_screen.dart';
import 'package:dating/screens/auth/views/login_screen.dart';
import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/colors/app_colors.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadYourPhotosScreen extends StatelessWidget {
  const UploadYourPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                  Center(
                    child: Image.asset(
                      Assets.imagesLogo,
                      height: 100,
                    ),
                  ),
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
                                  color: CColors.lightYellowColor.withOpacity(0.5),
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
                                ),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                    CColors.lightYellowColor.withOpacity(0.5),
                                  ),
                                ),
                                Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                    CColors.lightYellowColor.withOpacity(0.5),
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
                     padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6.5),
                     child: Row(children: [
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             controller.selectImage();
                           },
                           child: DottedBorder(
                             borderType: BorderType.RRect,
                             strokeWidth: 1,
                             radius: const Radius.circular(13),
                             color: CColors.textFieldBorderColor,
                             padding: const EdgeInsets.all(1),
                             child: ClipRRect(
                               borderRadius: const BorderRadius.all(Radius.circular(13)),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 color: CColors.textFieldBorderColor,
                                 child:Obx(()=>  controller.images.length>=1 ? controller.images.value[0]==null? const Center(
                                   child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                 ) : Stack(
                                   children: [
                                     Image.file(File( controller.images[0]),fit: BoxFit.cover,height: 155,width: 155,),
                                     Positioned(
                                       right: 8,
                                       top: 8,
                                       child: GestureDetector(
                                         onTap: (){
                                           controller.images.removeAt(0);
                                         },
                                         child: Container(
                                           height: 30,
                                           width: 30,
                                           padding: const EdgeInsets.all(3),
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(5),
                                             color: Colors.white,
                                             boxShadow: [
                                               BoxShadow(
                                                 color: Colors.grey.withOpacity(0.2),
                                                 offset: const Offset(4,4),
                                                 blurRadius: 10
                                               )
                                             ]
                                           ),
                                           child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                         ),
                                       ),
                                     )
                                   ],
                                 ) : const Center(
                                   child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                 )),
                               ),
                             ),
                           ),
                         ),
                       ),
                       15.pw,
                       Expanded(
                         child: GestureDetector(
                           onTap: (){
                             controller.selectImage();
                           },
                           child: DottedBorder(
                             borderType: BorderType.RRect,
                             strokeWidth: 1,
                             radius: const Radius.circular(13),
                             color: CColors.textFieldBorderColor,
                             padding: const EdgeInsets.all(1),
                             child: ClipRRect(
                               borderRadius: const BorderRadius.all(Radius.circular(13)),
                               child: Container(
                                 height: 150,
                                 width: 150,
                                 color: CColors.textFieldBorderColor,
                                 child:Obx(()=>  controller.images.length>=2 ? controller.images.value[1]==null? const Center(
                                   child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                 ) : Stack(
                                   children: [
                                     Image.file(File( controller.images[1]),fit: BoxFit.cover,height: 155,width: 155,),
                                     Positioned(
                                       right: 8,
                                       top: 8,
                                       child: GestureDetector(
                                         onTap: (){
                                           controller.images.removeAt(1);
                                         },
                                         child: Container(
                                           height: 30,
                                           width: 30,
                                           padding: const EdgeInsets.all(3),
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(5),
                                               color: Colors.white,
                                               boxShadow: [
                                                 BoxShadow(
                                                     color: Colors.grey.withOpacity(0.2),
                                                     offset: const Offset(4,4),
                                                     blurRadius: 10
                                                 )
                                               ]
                                           ),
                                           child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                         ),
                                       ),
                                     )
                                   ],
                                 ) : const Center(
                                   child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                 )),
                               ),
                             ),
                           ),
                         ),
                       ),

                                       ],),
                   ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6.5),
                    child: Row(children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=3 ? controller.images.value[2]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[2]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(2);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.pw,
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=4 ? controller.images.value[3]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[3]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(3);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6.5),
                    child: Row(children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=5 ? controller.images.value[4]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[4]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(4);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.pw,
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=6 ? controller.images.value[5]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[5]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(5);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6.5),
                    child: Row(children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=7 ? controller.images.value[6]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[6]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(6);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.pw,
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=8 ? controller.images.value[7]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[7]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(7);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6.5),
                    child: Row(children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=9 ? controller.images.value[8]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[8]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(8);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      15.pw,
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.selectImage();
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            strokeWidth: 1,
                            radius: const Radius.circular(13),
                            color: CColors.textFieldBorderColor,
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(13)),
                              child: Container(
                                height: 150,
                                width: 150,
                                color: CColors.textFieldBorderColor,
                                child:Obx(()=>  controller.images.length>=10 ? controller.images.value[9]==null? const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                ) : Stack(
                                  children: [
                                    Image.file(File( controller.images[9]),fit: BoxFit.cover,height: 155,width: 155,),
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.images.removeAt(9);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          padding: const EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.2),
                                                    offset: const Offset(4,4),
                                                    blurRadius: 10
                                                )
                                              ]
                                          ),
                                          child: const Icon(Icons.delete,color: CColors.primaryColor,),
                                        ),
                                      ),
                                    )
                                  ],
                                ) : const Center(
                                  child: Icon(Icons.add,size: 36,color: CColors.primaryColor,),
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    child: CustomElevatedButton(
                      onPressedFunction: () {
                        Get.to(()=> CreatePasswordScreen());
                      },
                      height: 60,
                      radius: 13,
                      gradientColor: buildLinearGradient(leftToRight: true),
                      buttonText: "Next",
                      width: context.width,
                    ),
                  ),
                  20.ph,
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> const LoginScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: CustomTextStyles.black415,
                          ),
                          Text(
                            'Login',
                            style: CustomTextStyles.primary515,
                          ),
                        ],
                      ),
                    ),
                  ),
                  30.ph,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
