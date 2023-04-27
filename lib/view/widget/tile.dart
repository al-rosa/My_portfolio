import 'package:flutter/material.dart';

import '../common/colors.dart';

class Tile extends StatelessWidget {
  const Tile({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 220,
        width: 340,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 340,
              height: 180,
              color: white,
            ),
            Container(
              width: 340,
              height: 40,
              color: lightGrey,
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
