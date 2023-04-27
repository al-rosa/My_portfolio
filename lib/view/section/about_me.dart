import 'package:flutter/material.dart';
import 'package:r0sa_profile/view/common/contents.dart';

import '../common/colors.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Contents.aboutMe.title,
            style: const TextStyle(fontSize: 64, color: textColor),
          ),
          const Text(
            'flutterでios,web制作をしている者です。\nWebデザインも行っています。',
            style: TextStyle(fontSize: 32, color: textColor),
          ),
        ],
      ),
    );
  }
}
