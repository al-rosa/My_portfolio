import 'package:flutter/material.dart';

import '../common/colors.dart';
import '../common/contents.dart';
import '../widget/tile.dart';

class Other extends StatelessWidget {
  const Other({
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
            Contents.other.title,
            style: const TextStyle(fontSize: 64, color: textColor),
          ),
          SizedBox(height: screen.height / 10),
          LimitedBox(
            maxWidth: 1200,
            maxHeight: 340,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 24),
                  child: Tile(
                    title: 'other',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Tile(
                    title: 'other',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Tile(
                    title: 'other',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Tile(
                    title: 'other',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Tile(
                    title: 'other',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
