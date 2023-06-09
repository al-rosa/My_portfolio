import 'package:flutter/material.dart';

import 'next_section_button.dart';
import 'previous_section_button.dart';

class BottomScrollButton extends StatelessWidget {
  const BottomScrollButton({
    super.key,
    required this.section,
    required this.sections,
    required this.onPressedPrevious,
    required this.onPressedNext,
  });

  final ValueNotifier<int> section;
  final List<Widget> sections;
  final Function onPressedPrevious;
  final Function onPressedNext;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: section.value == 0
            ? nextSectionButton(onPressed: onPressedNext)
            : section.value == sections.length - 1
                ? previousSectionButton(onPressed: onPressedPrevious)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      previousSectionButton(onPressed: onPressedPrevious),
                      nextSectionButton(onPressed: onPressedNext)
                    ],
                  ),
      ),
    );
  }
}
