import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class CustomTextStyles {
  CustomTextStyles._();

  static TextStyle _textStyle({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    FontStyle? fontStyle,
    Color? color,
    TextDecoration? decoration,

    Color? decorationColor,
  }) {
    return GoogleFonts.roboto(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle _textStylePopins({
    FontWeight fontWeight = FontWeight.w400,
    double? fontSize,
    FontStyle? fontStyle,
    Color? color,
    TextDecoration? decoration,

    Color? decorationColor,
  }) {
    return GoogleFonts.poppins(
      fontWeight: fontWeight,
      fontSize: fontSize,
      fontStyle: fontStyle,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
    );
  }

  static TextStyle blackColor412Italic = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontStyle: FontStyle.italic,
    color: CColors.blackTextColor,
  );
  static TextStyle redColor414 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.primaryColor,
  );
  static TextStyle redColor411 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: CColors.primaryColor,
  );
  static TextStyle redColor512 = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: const Color(0xffDF786A),
  );
  static TextStyle red926 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 26,
    color: CColors.primaryColor,
  );
  static TextStyle redColor724 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: CColors.primaryColor,
  );
  static TextStyle redColor716 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: CColors.primaryColor,
  );
  static TextStyle redColor916 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 16,
    color: CColors.primaryColor,
  );
  static TextStyle redColor718 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: CColors.primaryColor,
  );
  static TextStyle redColor712 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: CColors.primaryColor,
  );
  static TextStyle black712 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: CColors.blackTextColor,
  );
  static TextStyle grey612 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: CColors.iconDisableColor,
  );
  static TextStyle pinkColor510 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor514 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor416UnderLine = _textStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: CColors.primaryColor,
      decoration: TextDecoration.underline,
      decorationColor: CColors.primaryColor);
  static TextStyle pinkColor416 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.primaryColor,
  );

  static TextStyle blackOpac512 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: CColors.blackTextColor.withOpacity(0.6),
  );
  static TextStyle blackOpac413 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    color: CColors.blackTextColor.withOpacity(0.6),
  );
  static TextStyle blackGrey712 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: Colors.black,
  );
  static TextStyle blackGrey911 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 11,
    color: CColors.hintColor,
  );
  static TextStyle blackGrey414 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.greyTextColor,
  );
  static TextStyle black716 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: CColors.blackTextColor,
  );
  static TextStyle black715 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: CColors.blackTextColor,
  );
  static TextStyle black714 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black718 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: CColors.blackTextColor,
  );
  static TextStyle black430 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 30,
    color: CColors.blackTextColor,
  );
  static TextStyle black722 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: const Color(0xff212121),
  );
  static TextStyle black724 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: const Color(0xff212121),
  );
  static TextStyle black730 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: const Color(0xff212121),
  );
  static TextStyle black742 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 42,
    color: const Color(0xff212121),
  );
  static TextStyle black720 = _textStyle(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: const Color(0xff212121));
  static TextStyle blackOpac510 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: CColors.blackTextColor.withOpacity(0.6),
  );
  static TextStyle black414 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black414poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle grey412Color = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: CColors.darkBorderColor,
  );
  static TextStyle grey414Color = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.darkBorderColor,
  );
  static TextStyle grey415poppins= _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle grey411Color = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: CColors.greyTextColor,
  );
  static TextStyle grey512Color = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: CColors.darkBorderColor,
  );
  static TextStyle grey512Poppins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: CColors.darkBorderColor,
  );
  static TextStyle darkGrey513Color = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: const Color(0xff374151),
  );
  static TextStyle grey416 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.greyTextColor,
  );
  static TextStyle grey416poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.greyTextColor,
  );
  static TextStyle grey418 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: CColors.greyTextColor,
  );
  static TextStyle grey418Poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: CColors.greyTextColor,
  );
  static TextStyle grey916 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 16,
    color: CColors.greyTextColor,
  );
  static TextStyle grey914 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 14,
    color: const Color(0xff9CA3AF),
  );
  static TextStyle black410 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: CColors.blackTextColor,
  );
  static TextStyle black410poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: CColors.blackTextColor.withOpacity(0.68),
  );
  static TextStyle black412 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: CColors.blackTextColor,
  );
  static TextStyle black415 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: CColors.blackTextColor,
  );
  static TextStyle black411 = _textStyle(
    fontWeight: FontWeight.w300,
    fontSize: 11,
    color: CColors.blackTextColor,
  );
  static TextStyle black414Opacity = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.blackTextColor.withOpacity(0.54),
  );
  static TextStyle black416 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.blackTextColor,
  );
  static TextStyle blackGrey416 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: Color(0xff121212),
  );
  static TextStyle black616 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: CColors.blackTextColor,
  );
  static TextStyle primary618 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: CColors.primaryColor,
  );
  static TextStyle primary515 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: CColors.primaryColor,
  );
  static TextStyle primary520 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: CColors.primaryColor,
  );
  static TextStyle primary516 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: CColors.primaryColor,
  );
  static TextStyle primary415 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: CColors.primaryColor,
  );
  static TextStyle primary722 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    color: CColors.primaryColor,
  );
  static TextStyle black618 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: CColors.blackTextColor,
  );
  static TextStyle blackUnderlined616 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: CColors.blackTextColor,
    decoration: TextDecoration.underline,
    decorationColor: CColors.blackTextColor,
  );
  static TextStyle black962 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 62,
    color: CColors.blackTextColor,
  );
  static TextStyle black622Roboto = GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 22,
    color: CColors.blackTextColor,
  );
  static TextStyle black414Roboto = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black914 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black628 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 28,
    color: CColors.blackTextColor,
  );
  static TextStyle black620 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: CColors.blackTextColor,
  );
  static TextStyle black624 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: CColors.blackTextColor,
  );
  static TextStyle black915 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 15,
    color: CColors.blackTextColor,
  );
  static TextStyle black924 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 24,
    color: CColors.blackTextColor,
  );

  static TextStyle black918 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 18,
    color: CColors.blackTextColor,
  );
  static TextStyle black822 = GoogleFonts.nunito(
    fontWeight: FontWeight.w800,
    fontSize: 22,
    color: CColors.blackTextColor,
  );
  static TextStyle black824 = GoogleFonts.nunito(
    fontWeight: FontWeight.w800,
    fontSize: 24,
    color: CColors.blackTextColor,
  );
  static TextStyle black817 = _textStyle(
    fontWeight: FontWeight.w800,
    fontSize: 17,
    color: CColors.blackTextColor,
  );
  static TextStyle black614 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black614poppins = _textStylePopins(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black613Poppins = _textStylePopins(
    fontWeight: FontWeight.w600,
    fontSize: 13,
    color: CColors.blackTextColor,
  );
  static TextStyle black612 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    color: CColors.blackTextColor,
  );
  static TextStyle green832 = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    fontSize: 32,
    color: CColors.greenColor,
  );
  static TextStyle green827 = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    fontSize: 27,
    color: CColors.greenColor,
  );
  static TextStyle green730 =  GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: CColors.greenColor,
  );
  static TextStyle green411 =  GoogleFonts.poppins(
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: CColors.greenColor,
  );
  static TextStyle green614 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,

    color: CColors.greenColor,
  );
  static TextStyle red730 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: const Color(0xffE43636),
  );
  static TextStyle poppinsgreen836 = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    fontSize: 36,
    color: const Color(0xff00E500),
  );
  static TextStyle poppinsgreen833 = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    fontSize: 30,
    color: const Color(0xff00E500),
  );
  static TextStyle poppinsgreen827 = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    fontSize: 27,
    color: const Color(0xff00E500),
  );
  static TextStyle poppinsgreen825 = GoogleFonts.poppins(
    fontWeight: FontWeight.w800,
    fontSize: 25,
    color: const Color(0xff00E500),
  );
  static TextStyle black416hintColor = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.hintColor,
  );
  static TextStyle black416poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.blackTextColor,
  );
  static TextStyle black416Lightpoppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: CColors.blackTextColor.withOpacity(0.8),
  );
  static TextStyle black515 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: CColors.blackTextColor,
  );
  static TextStyle black515Popins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: CColors.blackTextColor,
  );
  static TextStyle black514 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black514poppins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black513 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: CColors.blackTextColor,
  );
  static TextStyle black316 = _textStyle(
    fontWeight: FontWeight.w300,
    fontSize: 16,
    color: CColors.blackTextColor,
  );
  static TextStyle black314= _textStyle(
    fontWeight: FontWeight.w300,
    fontSize: 14,
    color: CColors.blackTextColor,
  );
  static TextStyle black512poppins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: CColors.blackTextColor,
  );
  static TextStyle black513poppins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: CColors.blackTextColor,
  );
  static TextStyle black511 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: CColors.blackTextColor,
  );
  static TextStyle black510 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: CColors.blackTextColor,
  );
  static TextStyle black510Poppins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: CColors.blackTextColor,
  );
  static TextStyle black509 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 09,
    color: CColors.blackTextColor,
  );
  static TextStyle black520 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20,
    color: CColors.blackTextColor,
  );
  static TextStyle black522 = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 22,
    color: CColors.blackTextColor,
  );
  static TextStyle black524poppins = _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    color: CColors.blackTextColor,
  );
  static TextStyle darkGreen515= _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: const Color(0xff716735),
  );
  static TextStyle darkGreen512= _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: const Color(0xff716735),
  );
  static TextStyle green512= _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: CColors.greenColor,
  );
  static TextStyle green512poppins= _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: CColors.greenColor,
  );
  static TextStyle darkGrey515= _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle darkGrey511= _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 11,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle darkGrey510Poppins= _textStylePopins(
    fontWeight: FontWeight.w500,
    fontSize: 10,
    color: const Color(0xffA5A5A5),
  );
  static TextStyle black519 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 19,
    color: CColors.blackTextColor,
  );
  static TextStyle black418 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: CColors.blackTextColor,
  );
  static TextStyle black418Poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: CColors.blackTextColor,
  );
  static TextStyle white535 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 35,
    color: CColors.whiteColor,
  );
  static TextStyle white525 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 25,
    color: CColors.whiteColor,
  );
  static TextStyle white620 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: CColors.whiteColor,
  );
  static TextStyle white624 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
    color: CColors.whiteColor,
  );
  static TextStyle white615 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: CColors.whiteColor,
  );
  static TextStyle white618 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    color: CColors.whiteColor,
  );
  static TextStyle white914 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 14,
    color: CColors.whiteColor,
  );
  static TextStyle white911 = _textStyle(
    fontWeight: FontWeight.w900,
    fontSize: 11,
    color: CColors.whiteColor,
  );
  static TextStyle white515 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
    color: CColors.whiteColor,
  );
  static TextStyle white514 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: CColors.whiteColor,
  );
  static TextStyle white518 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: CColors.whiteColor,
  );
  static TextStyle white518popins = GoogleFonts.poppins(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    color: CColors.whiteColor,
  );
  static TextStyle white513 = _textStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
    color: CColors.whiteColor,
  );

  static TextStyle underlineDark = _textStyle(
    color: CColors.primaryColor,
    decoration: TextDecoration.underline,
    decorationColor: CColors.primaryColor,
  );

  static TextStyle underlineDark18 = _textStyle(
    color: CColors.primaryColor,
    fontSize: 18,
    decoration: TextDecoration.underline,
    decorationColor: CColors.primaryColor,
  );

  static TextStyle underline416Dark = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    decoration: TextDecoration.underline,
    color: CColors.blackTextColor,
  );
  static TextStyle darkAccent415 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: CColors.blackTextColor,
  );
  static TextStyle tweet414 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: const Color(0xff666A6B),
  );
  static TextStyle pinkColor620Inter = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor718 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor714 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor716Inter = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor615 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor614 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: CColors.primaryColor,
  );
  static TextStyle pinkColor620 = _textStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20,
    color: CColors.primaryColor,
  );
  static TextStyle white718 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: CColors.whiteColor,
  );

  static TextStyle lato720 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: CColors.whiteColor,
  );
  static TextStyle white717 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 17,
    color: CColors.whiteColor,
  );
  static TextStyle white716 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: CColors.whiteColor,
  );
  static TextStyle latoWhite718 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: CColors.whiteColor,
  );
  static TextStyle white414 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: CColors.whiteColor,
  );
  static TextStyle white412 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: CColors.whiteColor,
  );
  static TextStyle white410 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: CColors.whiteColor,
  );
  static TextStyle white409 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9,
    color: CColors.whiteColor,
  );
  static TextStyle white407 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 7,
    color: CColors.whiteColor,
  );
  static TextStyle white408 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 8,
    color: CColors.whiteColor,
  );
  static TextStyle white735 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 35,
    color: CColors.whiteColor,
  );
  static TextStyle white728 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 25,
    color: CColors.whiteColor,
  );
  static TextStyle white730 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: CColors.whiteColor,
  );
  static TextStyle white822 =_textStyle(
    fontWeight: FontWeight.w800,
    fontSize: 22,
    color: CColors.whiteColor,
  );
  static TextStyle white724Popins = GoogleFonts.poppins(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    color: CColors.whiteColor,
  );
  static TextStyle latoWhite732 = _textStyle(
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: CColors.whiteColor,
  );
  static TextStyle white418 = _textStyle(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: CColors.whiteColor,
  );
  static TextStyle white418poppins = _textStylePopins(
    fontWeight: FontWeight.w400,
    fontSize: 18,
    color: CColors.whiteColor,
  );
}
