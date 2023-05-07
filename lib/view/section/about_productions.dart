import 'dart:async';

import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';

import '../../constants.dart';

class AboutProductions extends StatefulWidget {
  const AboutProductions({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutProductions> createState() => _AboutProductionsState();
}

class _AboutProductionsState extends State<AboutProductions> {
  CrossFadeState crossFadeStateValue = CrossFadeState.showFirst;
  late Timer crossFadeTimer;

  _myDialog() {
    debugPrint("text");
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          decoration: const BoxDecoration(color: IColor.white),
          width: 500,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "pairium(Nativde App)",
                style: ITextStyle.boldText,
              ),
              Row(
                children: [
                  Image.asset(
                    'cat.png',
                    width: 300,
                    height: 300,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "使用技術",
                        style: ITextStyle.regularText,
                      ),
                      Text(
                        "Flutter(dart)",
                        style: ITextStyle.detailText,
                      ),
                      Text(
                        "Firebase",
                        style: ITextStyle.detailText,
                      ),
                    ],
                  ),
                ],
              ),
              const Text(
                " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
                style: ITextStyle.regularText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Container(
        decoration: const BoxDecoration(
          color: IColor.grey,
          image: DecorationImage(
            //TODO(画像がガビガビになるアニメーションを追加)
            image: AssetImage('rectangle.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: screen.width * 0.67063492,
            height: screen.height * 0.80346232,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Section.aboutProductions.title,
                  style: ITextStyle.boldText,
                ),
                Row(
                  children: [
                    ProductionCard(onTap: _myDialog),
                    ProductionCard(onTap: _myDialog)
                  ],
                ),
                Row(
                  children: [
                    ProductionCard(onTap: _myDialog),
                    ProductionCard(onTap: _myDialog)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductionCard extends StatelessWidget {
  const ProductionCard({Key? key, required this.onTap}) : super(key: key);

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "pairium(Nativde App)",
            style: ITextStyle.midText,
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: IColor.white,
                border: Border.all(color: IColor.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.all(screen.width * 0.02579365),
                child: Row(
                  children: [
                    Image.asset(
                      'cat.png',
                      width: screen.width * 0.11243386,
                      height: screen.width * 0.11243386,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "使用技術",
                          style: ITextStyle.regularText,
                        ),
                        Text(
                          "Flutter(dart)",
                          style: ITextStyle.detailText,
                        ),
                        Text(
                          "Firebase",
                          style: ITextStyle.detailText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
