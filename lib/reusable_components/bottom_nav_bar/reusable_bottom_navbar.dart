//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../models/bottom_navigation_bar_model/bottom_navigation_bar_model.dart';
// import '../../utils/colors/app_colors.dart';
// import '../../utils/constants/constant_lists.dart';
// import '../../utils/text_styles/text_styles.dart';
//
// class CustomBottomAppBar extends StatelessWidget {
//   final int selectedIndex;
//
//   const CustomBottomAppBar({super.key, required this.selectedIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       color: Colors.white,
//       elevation: 50,
//       height: 70,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           for (int index = 0;
//               index < ConstantLists.bottomBarList.length;
//               index++) ...[
//             Expanded(
//               flex: 1,
//               child: BottomNavBarComponent(
//                 selectedIndex: selectedIndex,
//                 bottomBarModel: ConstantLists.bottomBarList[index],
//               ),
//             )
//           ]
//         ],
//       ),
//     );
//   }
// }
//
// class BottomNavBarComponent extends StatelessWidget {
//   final int selectedIndex;
//   final BottomNavigationBarModel bottomBarModel;
//
//   const BottomNavBarComponent({
//     super.key,
//     required this.selectedIndex,
//     required this.bottomBarModel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(
//         12,
//       ),
//       onTap: selectedIndex == bottomBarModel.itemIndex
//           ? null
//           : bottomBarModel.itemIndex == 0
//               ? () {
//                   Get.offAll(
//                     () => const PortfolioScreen(),
//                     transition: Constants.appTransition,
//                   );
//                 }
//               : bottomBarModel.itemIndex == 1
//                   ? () {
//                       Get.offAll(
//                         () => const MarketScreen(),
//                         transition: Constants.appTransition,
//                       );
//                     }
//                   : bottomBarModel.itemIndex == 2
//                       ? () {
//                           Get.offAll(
//                             () => const AlertsScreen(),
//                             transition: Constants.appTransition,
//                           );
//                         }
//                       : () {
//                               Get.offAll(
//                                 () => const PremiumScreen(),
//                                 transition: Constants.appTransition,
//                               );
//                             },
//       child: Padding(
//         padding: const EdgeInsets.all(2),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//              Image.asset(
//                     bottomBarModel.assetString,
//                     height: 22,
//                     width: 22,
//                     color: selectedIndex == bottomBarModel.itemIndex
//                         ? CColors.iconEnableColor
//                         : CColors.iconDisableColor,
//                   ),
//             2.ph,
//             Flexible(
//               child: Text(
//                 bottomBarModel.title.tr,
//                 style: selectedIndex == bottomBarModel.itemIndex
//                     ? CustomTextStyles.black712
//                     : CustomTextStyles.grey412Color,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
