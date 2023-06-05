import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';
import 'package:r0sa_profile/responsive_widget.dart';
import 'package:r0sa_profile/view/section/v2/AboutProuction/about_productions.dart';
import 'package:r0sa_profile/view/section/v2/Contact/contact_v2.dart';
import 'package:r0sa_profile/view/section/v2/Skils/skils.dart';
import 'package:r0sa_profile/view/section/v2/Top/top_v2.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../constants.dart';
import 'components/widget/menu_button.dart';
import 'section/v2/AboutMe/about_me_v2.dart';

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

  void scrollTo(int index) {
    setState(() {
      currentSection = index;
    });
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  bool isOpenAbout = false;
  bool isOpenMenu = false;

  int currentSection = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final bool isLarge = ResponsiveWidget.isLargeScreen(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: IColor.background,
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: IColor.blue,
          child: ListView.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 22, top: 24),
                child: MenuButton(
                  onTap: () => scrollTo(index),
                  title: Section.values[index].title,
                ),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            ScrollablePositionedList.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) => sections[index],
              itemScrollController: _itemScrollController,
              itemPositionsListener: _itemPositionsListener,
            ),
            isSmall
                ? Positioned(
                    top: 30,
                    right: 30,
                    child: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : isLarge
                    ? Container(
                        width: 246,
                        height: screen.height,
                        color: IColor.blue,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 12, top: screen.height * 3 / 5),
                          child: ListView.builder(
                              itemCount: sections.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 17),
                                  child: MenuButton(
                                      onTap: () => scrollTo(index),
                                      title: Section.values[index].title),
                                );
                              })),
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.only(left: 32),
                        width: screen.width,
                        height: 60,
                        color: IColor.blue,
                        child: ListView.builder(
                          itemCount: sections.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 32),
                              child: MenuButton(
                                onTap: () => scrollTo(index),
                                title: Section.values[index].title,
                              ),
                            );
                          },
                        ),
                      ),
            isSmall
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: currentSection == 0
                          ? nextSectionButton()
                          : currentSection == sections.length - 1
                              ? previousSectionButton()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    previousSectionButton(),
                                    nextSectionButton()
                                  ],
                                ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  IconButton nextSectionButton() {
    return IconButton(
        onPressed: (() {
          scrollTo(currentSection + 1);
        }),
        icon: const Icon(Icons.keyboard_arrow_down));
  }

  IconButton previousSectionButton() {
    return IconButton(
        onPressed: (() {
          scrollTo(currentSection - 1);
        }),
        icon: const Icon(Icons.keyboard_arrow_up));
  }

  List<Widget> sections = [
    const TopV2(),
    const AboutMeV2(),
    const AboutProductions(),
    const Skils(),
    const ContactV2(),
  ];
}
