import 'package:flutter/material.dart';

import '../../../constants.dart';

class Frame extends StatelessWidget {
  const Frame({
    required this.width,
    required this.height,
    required this.frameWidth,
    required this.child,
    required this.shadowSize,
    this.childPadding = const EdgeInsets.all(8.0),
    Key? key,
  }) : super(key: key);

  final double width;
  final double height;
  final double frameWidth;
  final Widget child;
  final double shadowSize;
  final EdgeInsetsGeometry childPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width + frameWidth,
      height: height + frameWidth,
      decoration:  BoxDecoration(
        color: IColor.brown,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: shadowSize,
            blurRadius: shadowSize,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: IColor.white.withAlpha(180),
              ),
               BoxShadow(
                color: const Color(0xFFFEFEFE),
                spreadRadius: -shadowSize,
                blurRadius: shadowSize,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Padding(
            padding: childPadding,
            child: child,
          ),
        ),
      ),
    );
  }
}
