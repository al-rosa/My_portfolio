import 'package:flutter/material.dart';

import '../common/color.dart';
import '../widget/tile.dart';

class Work extends StatelessWidget {
  const Work({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: screen.width / 5, top: screen.height / 8),
      child: SizedBox(
        width: screen.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Work',
              style: TextStyle(fontSize: 76, color: textColor),
            ),
            SizedBox(height: screen.height / 10),
            LimitedBox(
              maxWidth: 1200,
              maxHeight: 340,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Tile(
                      title: 'work',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Tile(
                      title: 'work',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Tile(
                      title: 'work',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Tile(
                      title: 'work',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Tile(
                      title: 'work',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
