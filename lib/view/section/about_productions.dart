import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../model/emum/section.dart';
import '../../model/entity/production.dart';
import '../../responsive_widget.dart';
import '../components/is_web_image.dart';
import '../components/widget/production_card.dart';
import '../components/widget/production_dialog.dart';

class AboutProductions extends StatelessWidget {
  const AboutProductions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final double cardWSize = ResponsiveWidget.isLargeScreen(context)
        ? (screen.width * 0.36).clamp(440, 600)
        : (screen.width * 0.5).clamp(440, 600);

    final double cardHSize = ResponsiveWidget.isLargeScreen(context)
        ? (screen.height * 0.32).clamp(250, 400)
        : (screen.height * 0.22).clamp(250, 400);

    final double imageSize =
        ResponsiveWidget.isLargeScreen(context) ? 240 : 190;

    final double dialogWSize = cardWSize * 2;
    final double dialogHSize = (cardWSize * 2).clamp(210, 600);

    myDialog(Production production, width, height, imageSize) {
      showDialog(
          context: context,
          builder: (context) {
            return ProductionDialog(
              width: width,
              height: height,
              production: production,
              imageSize: imageSize,
            );
          });
    }

    return Container(
      width: screen.width > 320 ? screen.width : 400,
      height: ResponsiveWidget.isLargeScreen(context) && screen.height > 600
          ? screen.height
          : screen.width > 470
              ? screen.height + cardHSize * 3.5
              : screen.height + cardWSize * 4,
      decoration: BoxDecoration(
        color: IColor.grey,
        image: DecorationImage(
          image: AssetImage(path('rectangle.png')),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: ResponsiveWidget.isSmallScreen(context)
            ? const EdgeInsets.symmetric(horizontal: 12)
            : EdgeInsets.only(left: screen.width * 0.2),
        child: ResponsiveWidget.isLargeScreen(context) && screen.height > 600
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  Row(
                    children: [
                      Text(
                        Section.aboutProductions.title,
                        style: ITextStyle.boldText,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductionCard(
                        cardWSize: cardWSize,
                        cardHSize: cardHSize,
                        production: productions[0],
                        imageSize: imageSize,
                        onTap: () => myDialog(
                          productions[0],
                          dialogWSize,
                          dialogHSize,
                          imageSize * 1.3,
                        ),
                      ),
                      ProductionCard(
                        cardWSize: cardWSize,
                        cardHSize: cardHSize,
                        production: productions[1],
                        imageSize: imageSize,
                        onTap: () => myDialog(
                          productions[1],
                          dialogWSize,
                          dialogHSize,
                          imageSize * 1.3,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProductionCard(
                        cardWSize: cardWSize,
                        cardHSize: cardHSize,
                        production: productions[2],
                        imageSize: imageSize,
                        onTap: () {
                          return myDialog(
                            productions[2],
                            dialogWSize,
                            dialogHSize,
                            imageSize * 1.3,
                          );
                        },
                      ),
                      ProductionCard(
                        cardWSize: cardWSize,
                        cardHSize: cardHSize,
                        production: productions[3],
                        imageSize: imageSize,
                        onTap: () => myDialog(
                          productions[3],
                          dialogWSize,
                          dialogHSize,
                          imageSize * 1.3,
                        ),
                      ),
                    ],
                  ),
                  Container(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  Text(
                    Section.aboutProductions.title,
                    style: ITextStyle.boldText.copyWith(fontSize: 21),
                  ),
                  ProductionCard(
                    cardWSize: cardWSize,
                    cardHSize: cardHSize,
                    production: productions[0],
                    imageSize: imageSize,
                    onTap: () => myDialog(
                      productions[0],
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.width * 0.8
                          : dialogWSize,
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.height * 0.8
                          : dialogHSize,
                      imageSize * 1.3,
                    ),
                  ),
                  ProductionCard(
                    cardWSize: cardWSize,
                    cardHSize: cardHSize,
                    production: productions[1],
                    imageSize: imageSize,
                    onTap: () => myDialog(
                      productions[1],
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.width * 0.8
                          : dialogWSize,
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.height * 0.8
                          : dialogHSize,
                      imageSize * 1.3,
                    ),
                  ),
                  ProductionCard(
                    cardWSize: cardWSize,
                    cardHSize: cardHSize,
                    production: productions[2],
                    imageSize: imageSize,
                    onTap: () => myDialog(
                      productions[2],
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.width * 0.8
                          : dialogWSize,
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.height * 0.8
                          : dialogHSize,
                      imageSize * 1.3,
                    ),
                  ),
                  ProductionCard(
                    cardWSize: cardWSize,
                    cardHSize: cardHSize,
                    production: productions[3],
                    imageSize: imageSize,
                    onTap: () => myDialog(
                      productions[3],
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.width * 0.8
                          : dialogWSize,
                      ResponsiveWidget.isSmallScreen(context)
                          ? screen.height * 0.8
                          : dialogHSize,
                      imageSize * 1.3,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
