import 'package:flutter/material.dart';

class ITextStyle {
  static const TextStyle regularText =
      TextStyle(fontSize: 17, color: IColor.textColor);
  static const TextStyle midText =
      TextStyle(fontSize: 21, color: IColor.textColor);
  static const TextStyle boldText = TextStyle(
      fontSize: 33, color: IColor.textColor, fontWeight: FontWeight.bold);
  static const TextStyle detailText =
      TextStyle(fontSize: 14, color: IColor.textColor);

  static const TextStyle minBoldText = TextStyle(
      fontSize: 22, color: IColor.textColor, fontWeight: FontWeight.bold);
  static const TextStyle minMidText =
      TextStyle(fontSize: 17, color: IColor.textColor);

  static const TextStyle title = TextStyle(
      fontSize: 33, fontWeight: FontWeight.w100, color: IColor.textColor);
  static const TextStyle subTitle = TextStyle(
      fontSize: 20, color: IColor.textColor);
}

class IColor {
  static const Color transColor = Color(0x00666666);
  static const Color textColor = Color(0xff393939);
  static const Color background = Color(0xffFEFEFE);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffd9d9d9);
  static const Color blue = Color(0xff3F77A8);
  static const Color green = Color(0xff556622);
  static const Color brown = Color(0xff413C39);
}
