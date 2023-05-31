import 'package:flutter/material.dart';
import 'package:r0sa_profile/view/components/is_web_image.dart';

import '../../../constants.dart';
import '../../../model/entity/production.dart';
import '../../../responsive_widget.dart';
import 'border_card.dart';

class ProductionDialog extends StatelessWidget {
  const ProductionDialog({
    Key? key,
    required this.width,
    required this.height,
    required this.imageSize,
    required this.production,
  }) : super(key: key);

  final double width;
  final double height;
  final double imageSize;
  final Production production;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BorderCard(
      cardWSize: width,
      cardHSize: height,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: ResponsiveWidget.isSmallScreen(context)
            ? Text(production.detail)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    production.title,
                    style: ITextStyle.boldText,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        path(production.image),
                        width: imageSize,
                        height: imageSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "使用技術",
                              style: ITextStyle.boldText.copyWith(fontSize: 24),
                            ),
                            SizedBox(
                              width: width - imageSize - 2 - 27 - 30 * 2 - 80,
                              height: imageSize,
                              child: ListView.builder(
                                  itemCount: production.architecture.length,
                                  itemBuilder: ((context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 17),
                                      child: Text(
                                        production.architecture[index],
                                        style: ITextStyle.midText,
                                      ),
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    production.detail,
                    style: ITextStyle.detailText,
                  )
                ],
              ),
      ),
    ));
  }
}
