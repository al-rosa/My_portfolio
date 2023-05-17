import 'dart:async';

import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';

import '../../constants.dart';
import '../../model/entity/production.dart';

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

  _myDialog(Production production) {
    showDialog(
        context: context,
        builder: (context) {
          final Size screen = MediaQuery.of(context).size;
          return Center(
            child: Container(
              decoration: BoxDecoration(
                color: IColor.white,
                border: Border.all(
                  color: IColor.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              width: screen.width * 0.66111111,
              height: screen.height * 0.57788945,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screen.width * 0.0625,
                    vertical: screen.height * 0.05025126),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      production.title,
                      style: ITextStyle.boldText,
                    ),
                    SizedBox(height: screen.height * 0.03015075),
                    ProdactionDetail(
                      screen: MediaQuery.of(context).size,
                      production: production,
                    ),
                    SizedBox(height: screen.height * 0.04522613),
                    Text(
                      production.detail,
                      style: ITextStyle.regularText,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    final List<Production> productions = [
      Production(
        title: 'pairium(Native App)',
        architecture: ["Flutter(dart)", "Firebase"],
        detail:
            " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
      ),
      Production(
        title: '日報警察(Line Bot)',
        architecture: ["Gas(JavaScript)", "LINE Messaging API", "Open AI API"],
        detail:
            " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
      ),
      Production(
        title: 'MissingCatLog(Web Page)',
        architecture: ["WordPress"],
        detail:
            " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
      ),
      Production(
        title: 'お花屋さんの予約管理システム',
        architecture: ["Gas(JavaScript)", "LINE Messaging API", "Open AI API"],
        detail:
            " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
      ),
    ];

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
        child: Padding(
            padding: EdgeInsets.only(left: screen.width * 0.2645),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screen.height * 0.05025126),
                Text(
                  Section.aboutProductions.title,
                  style: ITextStyle.boldText,
                ),
                SizedBox(height: screen.height * 0.05025126),
                Expanded(
                  child: GridView.builder(
                    itemCount: productions.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.6),
                    itemBuilder: (context, index) {
                      return ProductionCard(
                        production: productions[index],
                        screen: screen,
                        onTap: () {
                          _myDialog(productions[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class ProductionCard extends StatelessWidget {
  const ProductionCard(
      {Key? key,
      required this.onTap,
      required this.screen,
      required this.production})
      : super(key: key);

  final void Function() onTap;
  final Production production;
  final Size screen;

  @override
  Widget build(BuildContext context) {
    debugPrint("${screen.width}");
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            production.title,
            style: ITextStyle.midText,
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onTap,
            child: Container(
              width: screen.width * 0.3125,
              height: screen.height * 0.30150754,
              decoration: BoxDecoration(
                color: IColor.white,
                border: Border.all(color: IColor.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(screen.width * 0.01777778),
                child: ProdactionDetail(screen: screen, production: production),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProdactionDetail extends StatelessWidget {
  const ProdactionDetail({
    Key? key,
    required this.screen,
    required this.production,
  }) : super(key: key);

  final Size screen;
  final Production production;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'cat.png',
          width: screen.width * 0.11805556,
          height: screen.width * 0.11805556,
        ),
        SizedBox(width: screen.width * 0.01666667),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screen.height * 0.01758794),
            const Text(
              "使用技術",
              style: ITextStyle.regularText,
            ),
            SizedBox(height: screen.height * 0.01758794),
            SizedBox(
              width: screen.width * 0.13888889,
              height: screen.height * 0.11306533,
              child: ListView.builder(
                itemCount: production.architecture.length,
                padding: EdgeInsets.only(
                    left: 4, bottom: screen.height * 0.00502513),
                itemBuilder: (context, index) {
                  return Text(
                    production.architecture[index],
                    style: ITextStyle.regularText,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
