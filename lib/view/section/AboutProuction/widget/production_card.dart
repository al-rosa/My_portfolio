import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../model/entity/production.dart';
import '../../../../responsive_widget.dart';
import '../../../components/is_web_image.dart';
import '../../../components/widget/border_card.dart';

class ProductionCard extends StatelessWidget {
  const ProductionCard({
    Key? key,
    required this.cardWSize,
    required this.cardHSize,
    required this.onTap,
    required this.production,
    required this.imageSize,
    this.childPadding = 30,
  }) : super(key: key);

  final double cardWSize;
  final double cardHSize;
  final Function onTap;
  final Production production;
  final double imageSize;
  final double childPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            production.title,
            style: cardWSize < 580 ? ITextStyle.minMidText : ITextStyle.midText,
          ),
          const SizedBox(height: 12),
          ResponsiveWidget.getScreenSize(context).width > 470
              ? BorderCard(
                  cardWSize: cardWSize,
                  cardHSize: cardHSize,
                  child: Padding(
                    padding: EdgeInsets.all(childPadding),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          path(production.image),
                          width: imageSize,
                          height: imageSize,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 21),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "使用技術",
                                style: ITextStyle.regularText,
                              ),
                              SizedBox(
                                height: imageSize - 18 - childPadding * 2,
                                width: cardWSize -
                                    imageSize -
                                    2 -
                                    8 * 2 -
                                    21 -
                                    childPadding * 2,
                                child: ListView.builder(
                                  itemCount: production.architecture.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 12),
                                      child: Text(
                                        production.architecture[index],
                                        style: ITextStyle.detailText,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : BorderCard(
                  cardWSize: cardHSize,
                  cardHSize: cardWSize,
                  child: Padding(
                    padding: EdgeInsets.all(childPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          path(production.image),
                          width: imageSize,
                          height: imageSize,
                        ),
                        const SizedBox(height: 12),
                        const Text("使用技術"),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: imageSize,
                          height: cardWSize -
                              imageSize -
                              childPadding * 2 -
                              42 -
                              8 * 2,
                          child: ListView.builder(
                            itemCount: production.architecture.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 12, top: 12),
                                child: Text(
                                  production.architecture[index],
                                  style: ITextStyle.detailText,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
