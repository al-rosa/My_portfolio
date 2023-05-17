import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';
import 'package:r0sa_profile/responsive_widget.dart';

import '../../constants.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isLarge = ResponsiveWidget.isLargeScreen(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);

    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Center(
        child: Padding(
          padding: isSmall
              ? const EdgeInsets.symmetric(horizontal: 14)
              : EdgeInsets.only(
                  left: screen.width * 0.2645,
                  right: screen.width * 0.1984,
                ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Section.aboutMe.title,
                style: ITextStyle.boldText,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  isSmall
                      ? Image.asset(
                          'cat.png',
                          width: screen.width * 0.35897436,
                          height: screen.width * 0.35897436,
                        )
                      : Image.asset(
                          'cat.png',
                          width: screen.width * 0.11243386,
                          height: screen.width * 0.11243386,
                        ),
                  SizedBox(width: isSmall ? 14 : 26),
                  isSmall
                      ? const SmallAboutMe()
                      : const LargeAboutMe()
                ],
              ),
              const SizedBox(height: 36),
              const Text(
                "大阪生まれ大阪育ちのエンジニア。大学時代に情報理工学を専攻。大学の授業をきっかけに、Flutterでアプリを開発。その他にも、「Webデザイン・制作」、「イベント予約システムの構築」、「LINE BOT制作」など、主にフロントサイドを中心に活動してきました。",
                style: ITextStyle.regularText,
              ),
              if (!isSmall)
                const Divider(
                  color: IColor.grey,
                  thickness: 1,
                  height: 50,
                  indent: 20,
                  endIndent: 20,
                ),
              if (!isSmall)
                const Text(
                  "Engineer born and raised in Osaka. Majored in Information Science and Engineering at university. His university classes led him to develop apps with Flutter. In addition, he has worked mainly on the front side, including \"Web design and production,\" \"building event reservation systems,\" and \"LINE BOT production.\"",
                  style: ITextStyle.regularText,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallAboutMe extends StatelessWidget {
  const SmallAboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "About Me",
                style: ITextStyle.minBoldText,
              ),
              Text(
                "「like sunglasses」",
                style: ITextStyle.minMidText,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "About Me",
                  style: ITextStyle.minBoldText,
                ),
                Text(
                  "「love avocado」",
                  style: ITextStyle.minMidText,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "About Me",
                  style: ITextStyle.minBoldText,
                ),
                Text(
                  "「adore cat」",
                  style: ITextStyle.minMidText,
                )
              ],
            ),
          ),
        ],
      );
  }
}

class LargeAboutMe extends StatelessWidget {
  const LargeAboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "About Me",
              style: ITextStyle.boldText,
            ),
            Text(
              "「like sunglasses」",
              style: ITextStyle.midText,
            )
          ],
        ),
        Row(
          children: const [
            Text(
              "About Me",
              style: ITextStyle.boldText,
            ),
            Text(
              "「love avocado」",
              style: ITextStyle.midText,
            )
          ],
        ),
        Row(
          children: const [
            Text(
              "About Me",
              style: ITextStyle.boldText,
            ),
            Text(
              "「adore cat」",
              style: ITextStyle.midText,
            )
          ],
        ),
      ],
    );
  }
}
