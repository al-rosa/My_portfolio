import 'package:flutter/material.dart';

import '../common/color.dart';

class Tile extends StatelessWidget {
  const Tile({
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 340,
          height: 180,
          color: Colors.white,
        ),
        Container(
          width: 340,
          height: 40,
          color: lightGrey,
          child: Text(
            title,
            style: const TextStyle(fontSize: 24),
          ),
        )
      ],
    );
  }
}
