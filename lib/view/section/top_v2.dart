import 'package:flutter/material.dart';
import 'package:r0sa_profile/constants.dart';
import 'package:r0sa_profile/responsive_widget.dart';

import '../components/is_web_image.dart';

class TopV2 extends StatelessWidget {
  const TopV2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);

    return Container(
      width: screen.width,
      height: screen.height,
      decoration: const BoxDecoration(
        color: IColor.background,
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: screen.height / 4,
            left: screen.width / 3,
            right: screen.width / 3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 160,
                  height: 160,
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    "r0sa",
                    style: ITextStyle.title,
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: IColor.textColor,
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: IColor.blue,
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: IColor.green,
                  ),
                  SizedBox(width: 12),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: IColor.brown,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "関西のFlutterエンジニア。\nengineering：Fluuter,React,Go,Firebase\ndesign：Figma,graphic\nHobbies：watching movies,painting,petting cats.",
                style: ITextStyle.subTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
