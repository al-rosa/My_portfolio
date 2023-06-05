import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/emum/section.dart';
import '../../../responsive_widget.dart';
import '../../components/is_web_image.dart';
import '../../components/widget/frame.dart';
import '../../components/widget/vertical_stick.dart';
import 'widget/about_me_text.dart';

class AboutMeV2 extends StatelessWidget {
  const AboutMeV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isLarge =
        ResponsiveWidget.isLargeScreen(context) && screen.height > 700;
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);

    final imageSize = isLarge
        ? 190.0
        : isSmall
            ? 140.0
            : 190.0;

    final frameWSize =
        isSmall ? screen.width * 0.9 : (screen.width * 0.6).clamp(700.0, 950.0);
    final frameHSize = isLarge
        ? (screen.height * 0.6).clamp(580.0, 600.0)
        : (screen.height * 0.75).clamp(120.0, 560.0);
    final frameP = isSmall
        ? const EdgeInsets.all(12)
        : const EdgeInsets.symmetric(horizontal: 66, vertical: 46);
    final frameW = isSmall ? 21.0 : 32.0;
    final shadowSize = isSmall ? 5.0 : 10.0;

    final EdgeInsetsGeometry contentPadding = isSmall
        ? EdgeInsets.only(left: 8, right: 8, top: screen.height * 0.05)
        : EdgeInsets.only(
            left: (screen.width * 0.08).clamp(14, 450),
            top: isLarge ? screen.height * 0.08 : screen.height * 0.12);

    debugPrint("width:${screen.width}");
    debugPrint("heith:${screen.height}");
    return Container(
      width: screen.width,
      height: screen.height,
      color: IColor.background,
      child: Padding(
        padding: contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalStick(
              child: Text(
                Section.aboutMe.title,
                style: isSmall ? ITextStyle.minBoldText : ITextStyle.boldText,
              ),
            ),
            const SizedBox(height: 24),
            Frame(
              width: frameWSize,
              height: frameHSize,
              frameWidth: frameW,
              shadowSize: shadowSize,
              childPadding: frameP,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(),
                  if (isSmall) Container(),
                  Row(
                    children: [
                      Image.asset(
                        path('cat.png'),
                        width: imageSize,
                        height: imageSize,
                      ),
                      const SizedBox(width: 7),
                      SizedBox(
                        height: imageSize,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AboutMeText(
                              aboutMe: "「like sunglasses」",
                              isLarge: isLarge,
                              isSmall: isSmall,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: AboutMeText(
                                aboutMe: "love avocado」",
                                isLarge: isLarge,
                                isSmall: isSmall,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 24 * 2),
                              child: AboutMeText(
                                aboutMe: "「adore cat」",
                                isLarge: isLarge,
                                isSmall: isSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "大阪生まれ大阪育ちのエンジニア。大学時代に情報理工学を専攻。大学の授業をきっかけに、Flutterでアプリを開発。その他にも、「Webデザイン・制作」、「イベント予約システムの構築」、「LINE BOT制作」など、主にフロントサイドを中心に活動してきました。",
                        style: isSmall
                            ? ITextStyle.minRegularText
                            : ITextStyle.regularText,
                      ),
                      const Divider(
                        color: IColor.textColor,
                        thickness: 1,
                        height: 30,
                        indent: 20,
                        endIndent: 20,
                      ),
                      Text(
                        "Engineer born and raised in Osaka. Majored in Information Science and Engineering at university. His university classes led him to develop apps with Flutter. In addition, he has worked mainly on the front side, including Web design and production, building event reservation systems, and LINE BOT production.",
                        style: isSmall
                            ? ITextStyle.minRegularText
                            : ITextStyle.regularText,
                      ),
                    ],
                  ),
                  Container(),
                  if (isSmall) Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
