import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AppColor{
  static const Color primaryRedColor=Color(0xffed1c24);
  static Color  scaffoldBackgroundColor= Colors.grey.shade200;
  static const Color scaffoldBackgroundColorTwo=Color(0xfffef5e4);
  static const Color unfocusedLanguageBoxBgColor =Color(0xff3d1414);
  static const Color focusedLanguageBoxBgColor =Color(0xff69050c);
  static const  Color blackColor= Colors.black;
  static const  Color whiteColor= Colors.white;
  static const Color activeButtonGreenColor= Color(0xff00a123);
  static const Color textGoldenColor= Color(0xffa17700);
  static const Color textGreyColor= Colors.black54;
  static const Color textBlueColor= Color(0xff0047AB);
  static const Gradient lightToDarkRedGradient= LinearGradient(colors: [Color(0xffb70723),Color(0xff6b0111)], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient darkRedToBlackGradient= LinearGradient(colors: [Color(0xff6b0111), AppColor.blackColor], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient darkRedToBlackGradientTwo= LinearGradient(colors: [Color(0xff6b0111), AppColor.blackColor,AppColor.blackColor], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient redGradient= LinearGradient(colors: [Colors.white,Color(0xffed1c24),Color(0xffed1c24),Color(0xffed1c24),Colors.white], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient greenGradient= LinearGradient(colors: [Colors.white,Color(0xff00a123),Color(0xff00a123),Color(0xff00a123),Colors.white], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient grayGradient= LinearGradient(colors: [Colors.white,AppColor.textGreyColor,AppColor.textGreyColor,AppColor.textGreyColor,Colors.white], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient blueGradient= LinearGradient(colors: [Colors.white,AppColor.textBlueColor,AppColor.textBlueColor,AppColor.textBlueColor,Colors.white], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.mirror);
  static const Gradient greenWhiteGradient= LinearGradient(colors: [Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Color(0xffb3efc0)], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.decal);
  static const Gradient greenWhiteGradient2= LinearGradient(colors: [Colors.white,Colors.white,Color(0xffb3efc0)], begin: Alignment.centerLeft, end: FractionalOffset.centerRight, tileMode: TileMode.decal);
}