


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowLargeImage extends StatelessWidget {
  const ShowLargeImage({super.key,required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
        alignment: Alignment.center,
        children: [
          Center(child: Image.network(image,fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
              return Container(color: Colors.grey.shade200,);
            },
          )),
          Positioned(
            left: 20,top: 0,
            child: IconButton(onPressed: (){
              Get.back();
            }, icon:const Icon(Icons.clear,color: Colors.black,)),
          )
        ],
    ),
      ),);
  }
}
