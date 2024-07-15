

import 'package:dating/generated/assets.dart';
import 'package:dating/models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';

class ConstantLists {
  ConstantLists._();

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
