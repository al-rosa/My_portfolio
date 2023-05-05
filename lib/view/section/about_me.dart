import 'package:flutter/material.dart';
import 'package:r0sa_profile/view/common/contents.dart';
import 'package:r0sa_profile/view/common/text.dart';

import '../common/colors.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Center(
        child: SizedBox(
          width: screen.width * 0.51058201,
          height: screen.height * 0.52851324,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Contents.aboutMe.title,
                style: boldText,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Image.asset(
                    'cat.png',
                    width: screen.width * 0.11243386,
                    height: screen.width * 0.11243386,
                  ),
                  const SizedBox(width: 26),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "About Me",
                            style: boldText,
                          ),
                          Text(
                            "「like sunglasses」",
                            style: midText,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "About Me",
                            style: boldText,
                          ),
                          Text(
                            "「love avocado」",
                            style: midText,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "About Me",
                            style: boldText,
                          ),
                          Text(
                            "「adore cat」",
                            style: midText,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 36),
              Text(
                "大阪生まれ大阪育ちのエンジニア。大学時代に情報理工学を専攻。大学の授業をきっかけに、Flutterでアプリを開発。その他にも、「Webデザイン・制作」、「イベント予約システムの構築」、「LINE BOT制作」など、主にフロントサイドを中心に活動してきました。",
                style: regularText,
              ),
              const Divider(
                color: grey,
                thickness: 1,
                height: 50,
                indent: 20,
                endIndent: 20,
              ),
              Text(
                "Engineer born and raised in Osaka. Majored in Information Science and Engineering at university. His university classes led him to develop apps with Flutter. In addition, he has worked mainly on the front side, including \"Web design and production,\" \"building event reservation systems,\" and \"LINE BOT production.\"",
                style: regularText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
