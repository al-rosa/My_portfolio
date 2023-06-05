import 'package:flutter/material.dart';
import 'package:r0sa_profile/constants.dart';
import 'package:r0sa_profile/responsive_widget.dart';

import '../../components/is_web_image.dart';
import '../../components/widget/vertical_stick.dart';

class TopV2 extends StatelessWidget {
  const TopV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);

    final EdgeInsetsGeometry contentPadding = screen.width < 600
        ? const EdgeInsets.all(14)
        : EdgeInsets.only(left: screen.width * 0.25);

    return Container(
      width: screen.width,
      height: screen.height,
      decoration: const BoxDecoration(
        color: IColor.background,
      ),
      child: Padding(
        padding: contentPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: isSmall
                  ? EdgeInsets.only(left: screen.width / 5)
                  : EdgeInsets.only(left: screen.width / 20),
              child: Container(
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
            ),
            SizedBox(height: screen.height / 17),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                VerticalStick(
                  child: Text(
                    "r0sa",
                    style: isSmall ? ITextStyle.boldText : ITextStyle.title,
                  ),
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
    );
  }
}
