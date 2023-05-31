import 'package:flutter/material.dart';

import '../../../constants.dart';

class BorderCard extends StatelessWidget {
  const BorderCard({
    Key? key,
    required this.cardWSize,
    required this.cardHSize,
    required this.child,
  }) : super(key: key);

  final double cardWSize;
  final double cardHSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWSize,
      height: cardHSize,
      decoration: BoxDecoration(
        color: IColor.white,
        border: Border.all(color: IColor.brown, width: 8),
      ),
      child: child,
    );
  }
}
