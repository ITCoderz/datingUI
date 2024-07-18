import 'package:dating/reusable_components/custom_appbar/custom_appbar.dart';
import 'package:dating/utils/gaps/gaps.dart';
import 'package:dating/utils/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(context.width, 57),
            child: AppbarWidget(
              title: "Privacy Policy",
              backButton: true,
              favButton: false,
              onTap: () {
                Get.back();
              },
            )),

        body: Column(
          children: [
            20.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: Text("Privacy Policy",style: CustomTextStyles.primary618,)),

                ],),
            ),
            20.ph,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse a nisl vel nibh sagittis lacinia. Pellentesque habitant morbi tristique senectus et netus et malesuadafames ac turpis egestas.\n\nInteger varius ante sit amet antesollicitudin laoreet a vel tellus. Aliquam rutrum posuere orci, vel ",style: CustomTextStyles.black416,
                textAlign: TextAlign.justify,),
            ),
            10.ph,
            Padding(padding: EdgeInsets.only(left: 30,right: 20),child: Text("\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: CustomTextStyles.black416,),)
            ,10.ph,
            Padding(padding: EdgeInsets.only(left: 30,right: 20),child: Text("\u2022 Maecenas sollicitudin tellus id lectus iaculis congue.",style: CustomTextStyles.black416,),)
            ,10.ph,
            Padding(padding: EdgeInsets.only(left: 30,right: 20),child: Text("\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: CustomTextStyles.black416,),)
            ,10.ph,
            Padding(padding: EdgeInsets.only(left: 30,right: 20),child: Text("\u2022 Maecenas sollicitudin tellus id lectus iaculis congue.",style: CustomTextStyles.black416,),)
            ,10.ph,
            Padding(padding: EdgeInsets.only(left: 30,right: 20),child: Text("\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit.",style: CustomTextStyles.black416,),)
            ,10.ph,
            Padding(padding: EdgeInsets.only(left: 30,right: 20),child: Text("\u2022 Maecenas sollicitudin tellus id lectus iaculis congue.",style: CustomTextStyles.black416,),)

          ],
        ),
      ),
    );
  }
}
