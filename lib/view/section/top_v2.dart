import 'package:flutter/material.dart';
import 'package:r0sa_profile/constants.dart';
import 'package:r0sa_profile/responsive_widget.dart';

import '../components/is_web_image.dart';

class TopV2 extends StatelessWidget {
  const TopV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);

    return Container(
      width: screen.width,
      height: screen.height,
      decoration: const BoxDecoration(
        color: IColor.background,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    path("r0sa.png"),
                  ),
                ),
              ),
            ),
            SizedBox(height: screen.height / 17),
            Padding(
              padding: isSmall
                  ? EdgeInsets.zero
                  : EdgeInsets.only(left: screen.width * 0.35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "r0sa",
                        style: isSmall ? ITextStyle.boldText : ITextStyle.title,
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: isSmall ? 18 : 30,
                        backgroundColor: IColor.textColor,
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: isSmall ? 18 : 30,
                        backgroundColor: IColor.blue,
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: isSmall ? 18 : 30,
                        backgroundColor: IColor.green,
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        radius: isSmall ? 18 : 30,
                        backgroundColor: IColor.brown,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text("関西のFlutterエンジニア。", style: ITextStyle.subTitle),
                  const SizedBox(height: 22),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: IColor.blue,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Engineering：Fluuter,React,Go,Firebase",
                          style: ITextStyle.regularText,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: IColor.green,
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Design：Figma,graphic",
                        style: ITextStyle.regularText,
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: IColor.brown,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Hobbies：watching movies,painting,petting cats.",
                          style: ITextStyle.regularText,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
