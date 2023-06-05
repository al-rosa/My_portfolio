import 'package:flutter/material.dart';

import '../../../../constants.dart';

class VerticalStick extends StatelessWidget {
  const VerticalStick({
    Key? key,
    required this.child,
    this.color = IColor.textColor,
  }) : super(key: key);

  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 12),
        child,
      ],
    );
  }
}
