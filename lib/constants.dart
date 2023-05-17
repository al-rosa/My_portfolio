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

  static const TextStyle title =
      TextStyle(fontSize: 210, fontWeight: FontWeight.w100);
  static const TextStyle subTitle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.w100);
}

class IColor {
  static const Color textColor = Color(0xff666666);
  static const Color background = Color(0xffffffff);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color grey = Color(0xffd9d9d9);
}
