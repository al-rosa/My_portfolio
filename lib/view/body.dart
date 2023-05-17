import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';
import 'package:r0sa_profile/responsive_widget.dart';
import 'package:r0sa_profile/view/section/about_productions.dart';
import 'package:r0sa_profile/view/section/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import 'components/widget/menu_button.dart';
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

  bool isOpenAbout = false;

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);

    return Scaffold(
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) => sections[index],
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
          ),
          ResponsiveWidget.isLargeScreen(context)
              ? Positioned(
                  top: screen.height * 3 / 5,
                  left: 10,
                  child: menu(),
                )
              : Positioned(
                  top: 30,
                  child: topMenu(screen),
                ),
        ],
      ),
    );
  }

  Widget topMenu(Size screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 30,
        width: screen.width - 12,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: IColor.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: MenuButton(
                    onTap: () => _scroll(index),
                    title: Section.values[index].title,
                  ),
                ),
              ),
            );
          },
        ),
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
            SizedBox(
              width: 300,
              height: 30,
              child: MenuButton(
                  title: Section.top.title,
                  onTap: () => _scroll(Section.top.num)),
            ),
            AnimatedPositioned(
              top: isOpenAbout ? 60 : 30,
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                opacity: isOpenAbout ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    width: 300,
                    height: 30,
                    child: MenuButton(
                        title: Section.aboutMe.title,
                        onTap: () {
                          setState(() {
                            isOpenAbout = !isOpenAbout;
                          });
                          _scroll(Section.aboutMe.num);
                        }),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              top: isOpenAbout ? 90 : 30,
              duration: const Duration(milliseconds: 200),
              child: AnimatedOpacity(
                opacity: isOpenAbout ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: SizedBox(
                    width: 300,
                    height: 30,
                    child: MenuButton(
                        title: Section.aboutProductions.title,
                        onTap: () {
                          setState(() {
                            isOpenAbout = !isOpenAbout;
                          });
                          _scroll(Section.aboutProductions.num);
                        }),
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: isOpenAbout ? 120 : 60,
              child: SizedBox(
                width: 300,
                height: 30,
                child: MenuButton(
                    title: Section.contact.title,
                    onTap: () => _scroll(Section.contact.num)),
              ),
            ),
            Positioned(
              top: 30,
              child: SizedBox(
                width: 300,
                height: 30,
                child: MenuButton(
                  title: "About ...",
                  onTap: () {
                    setState(() {
                      isOpenAbout = !isOpenAbout;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
