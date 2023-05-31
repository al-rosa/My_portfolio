import 'package:flutter/material.dart';
import 'package:r0sa_profile/constants.dart';
import 'package:r0sa_profile/responsive_widget.dart';
import 'package:r0sa_profile/view/components/is_web_image.dart';

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
    final Size screen = ResponsiveWidget.getScreenSize(context);

    return SizedBox(
      height: screen.height,
      width: screen.width,
      child: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: RotationTransition(
                turns: _turns,
                alignment: Alignment.center,
                child: Image.asset(
                  path('record.png'),
                  width: 360,
                  height: 360,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'r0sa',
                    style: ResponsiveWidget.isLargeScreen(context)
                        ? ITextStyle.title
                        : ITextStyle.title.copyWith(
                            fontSize: 140,
                          ),
                  ),
                  ResponsiveWidget.isLargeScreen(context)
                      ? const Text(
                          'Predict,Understanding,Agreement',
                          style: ITextStyle.subTitle,
                        )
                      : Text(
                          'Predict\nUnderstanding\nAgreement',
                          textAlign: TextAlign.center,
                          style: ITextStyle.subTitle.copyWith(fontSize: 32),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
