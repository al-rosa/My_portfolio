import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../model/entity/skil.dart';

class SkilsLevel extends StatelessWidget {
  const SkilsLevel({
    required this.width,
    required this.skil,
    this.padding = const EdgeInsets.only(bottom: 28),
    this.isSmall = false,
    Key? key,
  }) : super(key: key);

  final double width;
  final Skil skil;
  final EdgeInsets padding;
  final bool isSmall;
  @override
  Widget build(BuildContext context) {
    final borderW = width - 200;
    final colorBorderW = borderW * (skil.level / 5);

    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  skil.title,
                  style:
                      ITextStyle.midText.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: colorBorderW,
                      height: 4,
                      color: skil.isEngineering ? IColor.blue : IColor.green,
                    ),
                    CircleAvatar(
                      radius: isSmall ? 8 : 12,
                      backgroundColor:
                          skil.isEngineering ? IColor.blue : IColor.green,
                    ),
                    Container(
                      width: borderW - colorBorderW,
                      height: 2,
                      color: IColor.grey,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      "Lv${skil.level}",
                      style: ITextStyle.midText
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: !isSmall ? 14 : 6),
            Text(
              skil.text,
              style:  ITextStyle.detailText,
            ),
          ],
        ),
      ),
    );
  }
}
