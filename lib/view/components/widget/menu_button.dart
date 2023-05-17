import 'package:flutter/material.dart';

import '../../../constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: ITextStyle.midText,
        ),
      ),
    );
  }
}
