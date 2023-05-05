import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:r0sa_profile/constants.dart';

class Top extends StatefulWidget {
  const Top({
    Key? key,
  }) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _turns;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _turns = _animationController
        .drive(
          CurveTween(curve: Curves.linear),
        )
        .drive(
          Tween<double>(begin: 0, end: 1),
        );

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    int typeSpeed = 100;

    return SizedBox(
      height: screen.height,
      width: screen.width,
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            RotationTransition(
              turns: _turns,
              alignment: Alignment.center,
              child: Image.asset(
                'record.png',
                width: 360,
                height: 360,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('r0sa', style: ITextStyle.title),
                AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText('Predict,Understanding,Agreement',
                        speed: Duration(milliseconds: typeSpeed),
                        textStyle: ITextStyle.subTitle)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
