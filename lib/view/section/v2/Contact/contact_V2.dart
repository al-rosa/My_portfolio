import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../../../constants.dart';
import '../../../../model/emum/section.dart';
import '../../../../responsive_widget.dart';
import 'widget/vertical_stick.dart';

class ContactV2 extends StatelessWidget {
  const ContactV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final bool isLarge =
        ResponsiveWidget.isLargeScreen(context) && screen.height > 700;

    const String email = "alan21delarosa21@gmail.com";
    const String name = "Aran Sekimoto";

    return Container(
      color: IColor.blue,
      width: screen.width,
      height: screen.height,
      child: Padding(
        padding: isSmall
            ? EdgeInsets.only(left: 14, right: 14, top: screen.height * 0.05)
            : EdgeInsets.only(
                left: (screen.width * 0.2).clamp(200, 450),
                right: (screen.width * 0.05).clamp(0, 450),
                top: screen.height * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalStick(
                  color: IColor.background,
                  child: Text(
                    Section.contact.title,
                    style: isSmall
                        ? ITextStyle.minBoldText
                            .copyWith(color: IColor.background)
                        : ITextStyle.boldText
                            .copyWith(color: IColor.background),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "ここまでご覧いただいてありがとうございました。\n当サイトや私自身についてコメントがございましたら下記のフォームからご連絡ください。また、お仕事の依頼も待っております。",
                  style: isSmall
                      ? ITextStyle.regularText
                          .copyWith(color: IColor.background, fontSize: 17)
                      : ITextStyle.minMidText
                          .copyWith(color: IColor.background),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLarge)
                  Text(
                    "Click here --->  ",
                    style: ITextStyle.regularText.copyWith(
                      color: IColor.background,
                      fontSize: isSmall ? 24 : 42,
                    ),
                  ),
                if (!isLarge)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Click here ▼",
                        style: ITextStyle.regularText.copyWith(
                          color: IColor.background,
                          fontSize: isSmall ? 21 : 42,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ContactFrom(
                        email: email,
                        onTapEmal: () {},
                        isSmall: isSmall,
                        isLarge: isLarge,
                        screen: screen,
                      ),
                    ],
                  ),
                if (isLarge)
                  ContactFrom(
                    email: email,
                    onTapEmal: () {},
                    isLarge: isLarge,
                    isSmall: isSmall,
                    screen: screen,
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  name,
                  style: ITextStyle.minBoldText.copyWith(
                    color: IColor.background,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class ContactFrom extends StatelessWidget {
  const ContactFrom({
    Key? key,
    required this.email,
    required this.onTapEmal,
    required this.isSmall,
    required this.isLarge,
    required this.screen,
  }) : super(key: key);

  final String email;
  final Function() onTapEmal;
  final bool isSmall;
  final bool isLarge;
  final Size screen;

  @override
  Widget build(BuildContext context) {
    final double fontSize = (screen.width / 50).clamp(21, 40);
    return RichText(
      textAlign: isSmall ? TextAlign.end : TextAlign.start,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText2,
        children: [
          TextSpan(
              text: email,
              style: ITextStyle.regularText.copyWith(
                color: IColor.background,
                fontSize: fontSize,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapEmal),
          const TextSpan(text: "\n"),
          const TextSpan(text: "\n"),
          TextSpan(
            text: "or ",
            style: ITextStyle.regularText.copyWith(
              color: IColor.background,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: "Twitter",
            style: ITextStyle.regularText.copyWith(
              color: IColor.background,
              fontSize: fontSize,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                debugPrint("or Twitter");
              },
          ),
        ],
      ),
    );
  }
}
