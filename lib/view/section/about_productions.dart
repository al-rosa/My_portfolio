import 'package:flutter/material.dart';
import 'package:r0sa_profile/view/common/contents.dart';
import 'package:r0sa_profile/view/common/text.dart';

import '../common/colors.dart';

class AboutProductions extends StatelessWidget {
  const AboutProductions({
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
          width: screen.width * 0.67063492,
          height: screen.height * 0.80346232,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Contents.aboutProductions.title,
                style: boldText,
              ),
              Row(
                children: [ProductionCard(), ProductionCard()],
              ),
              Row(
                children: [ProductionCard(), ProductionCard()],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductionCard extends StatelessWidget {
  const ProductionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width * 0.33134921,
      height: screen.height * 0.31262729,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("pairium(Nativde App)", style: midText),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {},
            child: Container(
              width: screen.width * 0.30621693,
              height: screen.height * 0.25254582,
              decoration: BoxDecoration(
                border: Border.all(color: grey),
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
                      children: [
                        Text("使用技術", style: regularText),
                        Text(
                          "Flutter(dart)",
                          style: detailText,
                        ),
                        Text(
                          "Firebase",
                          style: detailText,
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
