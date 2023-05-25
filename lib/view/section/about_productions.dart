import 'dart:async';

import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';

import '../../constants.dart';
import '../../model/entity/production.dart';
import '../../responsive_widget.dart';

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

  _myDialog(Production production, isSmall) {
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
              width: screen.width * 0.86111111,
              height: screen.height * 0.57788945,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screen.width * 0.0625,
                    vertical: screen.height * 0.05025126),
                child: isSmall
                    ? Text(production.detail)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            production.title,
                            style: ITextStyle.boldText,
                          ),
                          SizedBox(height: screen.height * 0.03015075),
                          isSmall
                              ? MinProdactionDetail(
                                  screen: screen,
                                  production: production,
                                )
                              : ProdactionDetail(
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
    final Size screen = ResponsiveWidget.getScreenSize(context);

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

    final bool isSmallScreen = ResponsiveWidget.isSmallScreen(context);
    final bool isMediumScreen = ResponsiveWidget.isMediumScreen(context);
    final bool isLargeScreen = ResponsiveWidget.isLargeScreen(context);

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
            padding: isLargeScreen || isMediumScreen
                ? EdgeInsets.only(left: screen.width * 0.2645)
                : EdgeInsets.only(top: screen.height * 0.11160714, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isSmallScreen
                    ? const SizedBox(height: 0)
                    : isMediumScreen
                        ? const SizedBox(height: 120)
                        : SizedBox(height: screen.height * 0.05025126),
                Text(
                  Section.aboutProductions.title,
                  style: ITextStyle.boldText,
                ),
                SizedBox(height: screen.height * 0.05025126),
                Expanded(
                  child: isLargeScreen
                      ? GridView.builder(
                          itemCount: productions.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 11,
                          ),
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 300,
                              height: 300,
                              child: ProductionCard(
                                production: productions[index],
                                screen: screen,
                                onTap: () =>
                                    _myDialog(productions[index], false),
                              ),
                            );
                          },
                        )
                      : ListView.builder(
                          itemCount: productions.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: SizedBox(
                                width: 260,
                                height: 423,
                                child: ProductionCard(
                                  onTap: () => _myDialog(
                                    productions[index],
                                    true,
                                  ),
                                  screen: screen,
                                  production: productions[index],
                                  isSmallScreen: true,
                                ),
                              ),
                            );
                          }),
                        ),
                ),
              ],
            )),
      ),
    );
  }
}

class ProductionCard extends StatelessWidget {
  const ProductionCard({
    Key? key,
    required this.onTap,
    required this.screen,
    required this.production,
    this.isSmallScreen = false,
    this.childPadding = 24,
  }) : super(key: key);

  final void Function() onTap;
  final Production production;
  final Size screen;

  final bool isSmallScreen;
  final double childPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            production.title,
            style: ITextStyle.midText,
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: IColor.white,
                border: Border.all(color: IColor.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(childPadding),
                child: isSmallScreen
                    ? MinProdactionDetail(
                        screen: screen,
                        production: production,
                      )
                    : ProdactionDetail(
                        screen: screen,
                        production: production,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MinProdactionDetail extends StatelessWidget {
  const MinProdactionDetail({
    Key? key,
    required this.screen,
    required this.production,
  }) : super(key: key);

  final Size screen;
  final Production production;

  @override
  Widget build(BuildContext context) {
    const double minImageSize = 180;
    const double maxImageSize = 180;
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: minImageSize,
            minHeight: minImageSize,
            maxWidth: maxImageSize,
            maxHeight: maxImageSize,
          ),
          child: Image.asset(
            'cat.png',
            width: screen.width * 0.37837838,
            height: screen.width * 0.37837838,
          ),
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
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 130),
              child: SizedBox(
                width: screen.width * 0.51062802,
                height: screen.width * 0.41062802,
                child: ListView.builder(
                  itemCount: production.architecture.length,
                  padding: EdgeInsets.only(
                      left: 4, bottom: screen.height * 0.00502513),
                  itemBuilder: (context, index) {
                    return Text(
                      "- ${production.architecture[index]}",
                      style: ITextStyle.regularText,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
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
    const double minImageSize = 100;
    const double maxImageSize = 180;
    return Row(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: minImageSize,
            minHeight: minImageSize,
            maxWidth: maxImageSize,
            maxHeight: maxImageSize,
          ),
          child: Image.asset(
            'cat.png',
            width: screen.width * 0.37837838,
            height: screen.width * 0.37837838,
          ),
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
