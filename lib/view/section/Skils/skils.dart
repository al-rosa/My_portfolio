import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/emum/section.dart';
import '../../../model/entity/skil.dart';
import '../../../responsive_widget.dart';
import '../../components/widget/vertical_stick.dart';
import 'widget/skil_level.dart';

class Skils extends StatelessWidget {
  const Skils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final bool isLarge = ResponsiveWidget.isLargeScreen(context);

    final double skilLvW = isLarge ? screen.width / 3 : screen.width / 1.3;
    final double circleR = isLarge ? 130 : 80;
    return Container(
      width: screen.width,
      height: isSmall ? screen.height * 1.3 : screen.height,
      color: IColor.background,
      child: Padding(
        padding: isLarge
            ? EdgeInsets.only(
                left: (screen.width * 0.2).clamp(200, 450),
                top: screen.height * 0.08)
            : EdgeInsets.only(left: 12, right: 12, top: screen.height * 0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalStick(
                  child: Text(
                    Section.skils.title,
                    style:
                        isSmall ? ITextStyle.minBoldText : ITextStyle.boldText,
                  ),
                ),
                Text(
                  "主なスキルです。",
                  style: isSmall
                      ? ITextStyle.minRegularText
                      : ITextStyle.regularText,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkilsLevel(
                        width: skilLvW, skil: skils[0], isSmall: isSmall),
                    SkilsLevel(
                        width: skilLvW, skil: skils[1], isSmall: isSmall),
                    SkilsLevel(
                        width: skilLvW, skil: skils[2], isSmall: isSmall),
                    if (!isLarge)
                      SkilsLevel(
                          width: skilLvW, skil: skils[3], isSmall: isSmall),
                    if (!isLarge)
                      SkilsLevel(
                          width: skilLvW, skil: skils[4], isSmall: isSmall),
                    if (!isLarge) Container()
                  ],
                ),
                if (isLarge)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SkilsLevel(
                          width: skilLvW, skil: skils[3], isSmall: isSmall),
                      SkilsLevel(
                          width: skilLvW, skil: skils[4], isSmall: isSmall),
                    ],
                  ),
                Container(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: circleR * 2,
                  height: circleR * 2,
                  child: CustomPaint(
                    painter: isLarge ? LCirclePainter() : SCirclePainter(),
                  ),
                ),
                const SizedBox(width: 22),
                if (isSmall)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GraphicCategory(title: "programming", isSmall: isSmall),
                      const SizedBox(height: 12),
                      GraphicCategory(
                          title: "design", isSmall: isSmall, isEngineer: false),
                    ],
                  ),
                if (!isSmall)
                  GraphicCategory(title: "programming", isSmall: isSmall),
                if (!isSmall) const SizedBox(width: 18),
                if (!isSmall)
                  GraphicCategory(
                      title: "design", isSmall: isSmall, isEngineer: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GraphicCategory extends StatelessWidget {
  const GraphicCategory({
    Key? key,
    required this.isSmall,
    required this.title,
    this.isEngineer = true,
  }) : super(key: key);

  final bool isSmall;
  final String title;
  final bool isEngineer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isEngineer ? IColor.blue : IColor.green,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: isSmall
              ? ITextStyle.regularText.copyWith(fontWeight: FontWeight.bold)
              : ITextStyle.midText.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class LCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double designerRate() {
      double designer = 0;
      double engineer = 0;
      for (var index in skils) {
        if (index.isEngineering) {
          engineer += index.level;
        } else {
          designer += index.level;
        }
      }
      double rate = designer / (engineer + designer);

      return rate;
    }

    final paint = Paint();

    canvas.translate(size.width / 2, size.height / 2);
    Offset offSet = const Offset(0, 0);
    const double radias = 130;

    final rect = Rect.fromCenter(
      center: offSet,
      width: radias * 2,
      height: radias * 2,
    );
    const startAngle = pi * 3.5;
    final sweepAngle = pi * 2 * designerRate();
    const useCenter = true;

    paint.color = IColor.blue;
    canvas.drawCircle(
      offSet,
      radias,
      paint,
    );

    paint.color = IColor.green;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class SCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double designerRate() {
      double designer = 0;
      double engineer = 0;
      for (var index in skils) {
        if (index.isEngineering) {
          engineer += index.level;
        } else {
          designer += index.level;
        }
      }
      double rate = designer / (engineer + designer);

      return rate;
    }

    final paint = Paint();

    canvas.translate(size.width / 2, size.height / 2);
    Offset offSet = const Offset(0, 0);
    const double radias = 80;

    final rect = Rect.fromCenter(
      center: offSet,
      width: radias * 2,
      height: radias * 2,
    );
    const startAngle = pi * 3.5;
    final sweepAngle = pi * 2 * designerRate();
    const useCenter = true;

    paint.color = IColor.blue;
    canvas.drawCircle(
      offSet,
      radias,
      paint,
    );

    paint.color = IColor.green;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
