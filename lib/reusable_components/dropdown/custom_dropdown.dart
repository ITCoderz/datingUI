import 'package:dating/generated/assets.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/text_styles/text_styles.dart';

class CustomDropDown extends StatelessWidget {
  final Function(String?)? onChanged;
  final List mappingList;
  final String label;
  final Color? borderColor;
  final double?
      borderRadius;
  final String hint;
  final bool small;
  final String? Function(String?)? validatorFunction;
  final String value;
  const CustomDropDown({
    super.key,
    required this.onChanged,
    required this.label,
    this.small = false,
    this.hint = '',
    this.borderColor,
    this.borderRadius,
    required this.mappingList,
    this.validatorFunction,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField2(

        decoration: InputDecoration(
          isDense: true,
          label: small
              ? null
              : Text(
                  label,
                  style: CustomTextStyles.grey412Color,
                ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.only(left: 0, right: 5),
          enabled: true,
          filled: false,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.greyBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 12),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.greyBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 12),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? CColors.greyBorderColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius ?? 12),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CColors.redColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 12,
              ),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CColors.redColor, width: 1),
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius ?? 12,
              ),
            ),
          ),
        ),
        isExpanded: true,
        hint: Text(
          hint,
          style: CustomTextStyles.black414,
        ),
        items: mappingList
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item,
                    style: CustomTextStyles.black414,
                  ),
                ))
            .toList(),
        isDense: true,
        menuItemStyleData: const MenuItemStyleData(
          overlayColor: MaterialStatePropertyAll(CColors.whiteColor),
        ),
        validator: validatorFunction,
        onChanged: onChanged,

        buttonStyleData: const ButtonStyleData(
          height: 60,
        ),
        iconStyleData:  IconStyleData(
          icon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(Assets.iconsArrowDown2,height: 10,),
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
