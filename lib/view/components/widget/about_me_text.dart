import 'package:flutter/material.dart';

import '../../../constants.dart';

class AboutMeText extends StatelessWidget {
  const AboutMeText({
    Key? key,
    required this.isLarge,
    this.isSmall = false,
    required this.aboutMe,
  }) : super(key: key);

  final bool isLarge;
  final bool isSmall;
  final String aboutMe;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: Theme.of(context).textTheme.bodyText2, children: [
        TextSpan(
          text: "About Me",
          style: isLarge
              ? ITextStyle.boldText.copyWith(color: IColor.blue)
              : isSmall
                  ? ITextStyle.minBoldText
                      .copyWith(color: IColor.blue)
                      .copyWith(fontSize: 17)
                  : ITextStyle.minBoldText.copyWith(color: IColor.blue),
        ),
        if (!isLarge) const TextSpan(text: "\n"),
        TextSpan(
          text: aboutMe,
          style: isLarge
              ? ITextStyle.midText
              : isSmall
                  ? ITextStyle.minMidText.copyWith(fontSize: 14)
                  : ITextStyle.minMidText,
        ),
      ]),
    );
  }
}
