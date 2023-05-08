import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';
import 'package:r0sa_profile/view/section/about_productions.dart';
import 'package:r0sa_profile/view/section/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import 'section/about_me.dart';
import 'section/top.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scroll(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  bool test = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return sections[index];
            },
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 3 / 5,
              left: 10,
              child: menu()),
        ],
      ),
    );
  }

  List<Widget> sections = [
    const Top(),
    const AboutMe(),
    const AboutProductions(),
    const Contact(),
  ];

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: SizedBox(
        height: 30 * (sections.length + 1),
        child: Stack(
          children: [
            MenuButton(
                title: Section.top.title,
                onTap: () => _scroll(Section.top.num)),
            Positioned(
              top: 30,
              child: MenuButton(
                title: "About ...",
                onTap: () {
                  setState(() {
                    test = !test;
                  });
                },
              ),
            ),
            Positioned(
              top: 60,
              child: AnimatedOpacity(
                opacity: test ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MenuButton(
                    title: Section.aboutMe.title,
                    onTap: () {
                      setState(() {
                        test = !test;
                      });
                      _scroll(Section.aboutMe.num);
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              child: AnimatedOpacity(
                opacity: test ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MenuButton(
                    title: Section.aboutProductions.title,
                    onTap: () {
                      setState(() {
                        test = !test;
                      });
                      _scroll(Section.aboutProductions.num);
                    },
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: test ? 120 : 60,
              child: MenuButton(
                title: Section.contact.title,
                onTap: () => _scroll(Section.contact.num),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      child: SizedBox(
        width: 300,
        height: 30,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: ITextStyle.midText,
          ),
        ),
      ),
    );
  }
}
