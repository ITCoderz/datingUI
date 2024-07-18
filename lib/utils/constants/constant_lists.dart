

import 'package:dating/generated/assets.dart';
import 'package:dating/models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
import 'package:dating/models/messgae_model/message_model.dart';

class ConstantLists {
  ConstantLists._();

  static List<MessagesModel> messagesList = [
    MessagesModel(
      isUserMessage: true,
      messages: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry."',
      messageType: "isText",
      number: "+6012 777 8888",
    ),
    MessagesModel(
       
      isUserMessage: true,
      messages: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry."',
      messageType: "isText",
      number: "+6012 777 8888",
    ),
    MessagesModel(
      isUserMessage: true,
      messages: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
      messageType: "isText",
      number: "+6012 777 8888",
    ),
    MessagesModel(
      isUserMessage: false,
      messages: "The item is available.",
      messageType: "isText",
      number: "",
    ),
    MessagesModel(
       
      isUserMessage: true,
      messages:
      "Do you have size XL and be able to customise as my size? what is the minimum quantity?",
      messageType: "isText",
      number: "+6012 777 8888",
    ),
  ];


  static List<BottomNavigationBarModel> bottomBarList = [
    BottomNavigationBarModel(
      itemIndex: 0,
      assetString: Assets.iconsChatBubble,
      title: "",
    ),
    BottomNavigationBarModel(
      itemIndex: 1,
      assetString: Assets.iconsChatBubble,
      title: "",
    ),
    BottomNavigationBarModel(
      itemIndex: 2,
      assetString: Assets.iconsUser,
      title: "",
    ),
  ];

}
