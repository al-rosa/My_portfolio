import 'package:flutter/material.dart';

import '../common/colors.dart';

class Fotter extends StatelessWidget {
  const Fotter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      width: screen.width,
      height: screen.height / 4,
      color: grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              color: lightBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              color: lightBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              color: lightBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              color: lightBlue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mail,
              color: lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
