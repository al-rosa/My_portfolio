import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../model/emum/section.dart';
import '../../../model/entity/production.dart';
import '../../../responsive_widget.dart';
import '../../components/is_web_image.dart';
import '../../components/widget/vertical_stick.dart';
import 'widget/production_card.dart';
import 'widget/production_dialog.dart';

class AboutProductions extends StatelessWidget {
  const AboutProductions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isLarge = ResponsiveWidget.isLargeScreen(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);

    final EdgeInsetsGeometry contentPadding = isSmall
        ? const EdgeInsets.symmetric(horizontal: 12)
        : EdgeInsets.only(
            left: (screen.width * 0.08).clamp(14, 450),
            top: isLarge ? screen.height * 0.08 : screen.height * 0.12);

    final double cardWSize = isLarge
        ? (screen.width * 0.33).clamp(400, 600)
        : (screen.width * 0.5).clamp(440, 580);

    final double cardHSize = isLarge
        ? (screen.height * 0.32).clamp(250, 400)
        : (screen.height * 0.22).clamp(250, 400);

    final double imageSize =
        isLarge ? (screen.width * 0.1).clamp(170, 190) : 190;

    final double dialogWSize = cardWSize * 2;
    final double dialogHSize = (cardWSize * 2).clamp(210, 500);

    final String backgroudImage = path("mathematics.png");

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
      height: isLarge && screen.height > 600
          ? screen.height
          : screen.width > 470
              ? screen.height + cardHSize * 3.5
              : screen.height + cardWSize * 4,
      decoration: BoxDecoration(
        color: IColor.background,
        image: DecorationImage(
          image: AssetImage(backgroudImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: contentPadding,
        child: isLarge && screen.height > 600
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(),
                  VerticalStick(
                    child: Text(
                      Section.aboutProductions.title,
                      style: ITextStyle.boldText,
                    ),
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
                  VerticalStick(
                    child: Text(
                      Section.aboutProductions.title,
                      style: isSmall
                          ? ITextStyle.minBoldText
                          : ITextStyle.boldText,
                    ),
                  ),
                  ProductionCard(
                    cardWSize: cardWSize,
                    cardHSize: cardHSize,
                    production: productions[0],
                    imageSize: imageSize,
                    onTap: () => myDialog(
                      productions[0],
                      isSmall ? screen.width * 0.8 : dialogWSize,
                      isSmall ? screen.height * 0.8 : dialogHSize,
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
                      isSmall ? screen.width * 0.8 : dialogWSize,
                      isSmall ? screen.height * 0.8 : dialogHSize,
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
                      isSmall ? screen.width * 0.8 : dialogWSize,
                      isSmall ? screen.height * 0.8 : dialogHSize,
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
                      isSmall ? screen.width * 0.8 : dialogWSize,
                      isSmall ? screen.height * 0.8 : dialogHSize,
                      imageSize * 1.3,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
