import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantUi {
  Color colorDefaultBg = const Color(0xffFAF4EA);

  Color colorBlackButton = const Color(0xff191919);

  Color ctLight = const Color(0xff757575);
  Color colorBorderGrey = const Color(0xffEEEEEE);
  Color colorOrangeAccent = const Color(0xffFEAA6C);

  Color colorWhite = Colors.white;
  Color colorBlack = Colors.black;

  double textSizeSmallOne = 14.0;
  double textSizeSmallTwo = 16.0;

  double textSizeMedOne = 18.0;
  double textSizeMedTwo = 20.0;

  double textSizeLargeOne = 22.0;
  double textSizeLargeTwo = 24.0;
  double textSizeLargeThree = 40.0;

  FontWeight fontWeightLight = FontWeight.w400;
  FontWeight fontWeightMed = FontWeight.w500;
  FontWeight fontWeightBold = FontWeight.w600;

  TextStyle textStlInter({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) =>
      GoogleFonts.inter(
        textStyle: TextStyle(
          color: color ?? ctLight,
          fontWeight: fontWeight ?? fontWeightMed,
          fontSize: fontSize ?? textSizeSmallTwo,
        ),
      );

  TextStyle textStlHaffer({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) =>
      GoogleFonts.inter(
        textStyle: TextStyle(
          color: color ?? ctLight,
          fontWeight: fontWeight ?? fontWeightMed,
          fontSize: fontSize ?? textSizeSmallTwo,
        ),
      );
}
