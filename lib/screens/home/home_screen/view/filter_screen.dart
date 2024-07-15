//
//
// import 'package:flutter/material.dart';
// class FilterScreen extends StatelessWidget {
//   const FilterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Age",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700),
//             ),
//             Text(controller.filterlowerValue.round().toString() +
//                 "-" +
//                 controller.filterupperValue.round().toString()),
//           ],
//         ),
//       ),
//       Container(
//         height: 50,
//         padding: const EdgeInsets.only(right: 10),
//         child: RangeSliderFlutter(
//           values: [
//             controller.filterlowerValue,
//             controller.filterupperValue
//           ],
//           handler: RangeSliderFlutterHandler(
//               decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.shade300.withOpacity(0.8),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                         offset: Offset(0.5, 0.5))
//                   ],
//                   color: textcolor,
//                   border: Border.all(color: Colors.white, width: 3),
//                   shape: BoxShape.circle)),
//           rightHandler: RangeSliderFlutterHandler(
//               child: Text(""),
//               decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.shade300.withOpacity(0.8),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                         offset: Offset(0.5, 0.5))
//                   ],
//                   color: textcolor,
//                   border: Border.all(color: Colors.white, width: 3),
//                   shape: BoxShape.circle)),
//           tooltip: RangeSliderFlutterTooltip(
//               alwaysShowTooltip: false, disabled: true),
//           trackBar: RangeSliderFlutterTrackBar(
//               activeTrackBarHeight: 6,
//               inactiveTrackBarHeight: 6,
//               activeDisabledTrackBarColor: Colors.grey.shade200,
//               inactiveDisabledTrackBarColor: Colors.grey.shade200,
//               inactiveTrackBar: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(25)),
//               activeTrackBar: BoxDecoration(
//                 color: textcolor,
//               )),
//           rangeSlider: true,
//           jump: true,
//           max: 80,
//           min: 18,
//           fontSize: 15,
//           onDragging: (handlerIndex, lowerValue, upperValue) {
//             controller.filterlowerValue = lowerValue;
//             controller.filterupperValue = upperValue;
//             log(controller.filterlowerValue.round().toString());
//             controller.update();
//           },
//         ),
//       ),
//      20.ph,
//
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 18),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Distance",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700),
//             ),
//             Text(controller.selectedMilesRange.round().toString() + "km"),
//           ],
//         ),
//       ),
//       SliderTheme(
//         data: SliderTheme.of(context).copyWith(
//           trackHeight: 6.0,
//           activeTickMarkColor: textcolor,
//           inactiveTickMarkColor: Colors.grey.shade200,
//           trackShape: RoundedRectSliderTrackShape(),
//           activeTrackColor: textcolor,
//           inactiveTrackColor: Colors.grey.shade200,
//           thumbShape: RoundSliderThumbShape(
//             enabledThumbRadius: 16.0,
//             pressedElevation: 8.0,
//           ),
//           minThumbSeparation: 5,
//           thumbColor: textcolor,
//           overlayColor: Colors.pink.withOpacity(0.2),
//           overlayShape: RoundSliderOverlayShape(overlayRadius: 32.0),
//           valueIndicatorShape: PaddleSliderValueIndicatorShape(),
//           valueIndicatorColor: textcolor,
//           valueIndicatorTextStyle: TextStyle(
//             color: Colors.white,
//             fontSize: 20.0,
//           ),
//         ),
//         child: Slider(
//             value: controller.selectedMilesRange,
//             onChanged: (value) {
//               controller.selectedMilesRangeFunction(value);
//             },
//             min: 0,
//             max: 3000,
//             divisions: 60,
//             autofocus: true,
//             label: controller.selectedMilesRange.round().toString()),
//       ),
//     ],);
//   }
// }
