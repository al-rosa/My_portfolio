import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class ContactFrom extends StatelessWidget {
  const ContactFrom({
    Key? key,
    required this.email,
    required this.onTapEmail,
    required this.onTapTwitter,
    required this.isSmall,
    required this.isLarge,
    required this.screen,
  }) : super(key: key);

  final String email;
  final Function() onTapEmail;
  final Function() onTapTwitter;
  final bool isSmall;
  final bool isLarge;
  final Size screen;

  @override
  Widget build(BuildContext context) {
    final double fontSize = (screen.width / 50).clamp(21, 40);
    return RichText(
      textAlign: isSmall ? TextAlign.end : TextAlign.start,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
              text: email,
              style: ITextStyle.regularText.copyWith(
                color: IColor.background,
                fontSize: fontSize,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapEmail),
          const TextSpan(text: "\n"),
          const TextSpan(text: "\n"),
          TextSpan(
            text: "or ",
            style: ITextStyle.regularText.copyWith(
              color: IColor.background,
              fontSize: fontSize,
            ),
          ),
          TextSpan(
            text: "Twitter",
            style: ITextStyle.regularText.copyWith(
              color: IColor.background,
              fontSize: fontSize,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTapTwitter,
          ),
        ],
      ),
    );
  }
}
