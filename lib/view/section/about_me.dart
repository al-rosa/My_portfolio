import 'package:flutter/material.dart';

import '../common/color.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width,
      child: Padding(
        padding:
            EdgeInsets.only(left: screen.width / 5, top: screen.height / 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Avout Me',
              style: TextStyle(fontSize: 76, color: textColor),
            ),
            Text(
              'flutterでios,web制作をしている者です。',
              style: TextStyle(fontSize: 32, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
