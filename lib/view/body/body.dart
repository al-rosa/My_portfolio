import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants.dart';
import '../../model/emum/section.dart';
import '../../responsive_widget.dart';
import '../components/widget/menu_button.dart';
import '../section/AboutMe/about_me.dart';
import '../section/AboutProuction/about_productions.dart';
import '../section/Contact/contact.dart';
import '../section/Skils/skils.dart';
import '../section/Top/top.dart';
import 'widget/bottom_scroll_button.dart';

class Body extends HookWidget {
  Body({super.key});

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [
      const Top(),
      const AboutMe(),
      const AboutProductions(),
      const Skils(),
      const Contact(),
    ];
    final itemScrollController = useMemoized(() => ItemScrollController());
    final itemPositionsListener =
        useMemoized(() => ItemPositionsListener.create());

    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final bool isLarge = ResponsiveWidget.isLargeScreen(context);

    const double leftMenuSizeW = 256;

    final section = useState(0);

    void scrollTo(int index) {
      itemScrollController.scrollTo(
        index: index,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

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
                  onTap: () {
                    section.value = index;
                    scrollTo(section.value);
                  },
                  title: Section.values[index].title,
                ),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: screen.width,
              height: screen.height,
              child: Row(
                children: [
                  if (isLarge)
                    Container(
                      width: leftMenuSizeW,
                      height: screen.height,
                      color: IColor.blue,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 17, top: screen.height * 3 / 5),
                        child: ListView.builder(
                            itemCount: sections.length,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 17),
                                child: MenuButton(
                                    onTap: () {
                                      section.value = index;
                                      scrollTo(section.value);
                                    },
                                    title: Section.values[index].title),
                              );
                            })),
                      ),
                    ),
                  Expanded(
                    child: ScrollablePositionedList.builder(
                      itemCount: sections.length,
                      itemBuilder: (context, index) => sections[index],
                      itemScrollController: itemScrollController,
                      itemPositionsListener: itemPositionsListener,
                    ),
                  ),
                ],
              ),
            ),
            if (isSmall)
              Positioned(
                top: 30,
                right: 30,
                child: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu),
                ),
              ),
            if (isSmall)
              BottomScrollButton(
                section: section,
                sections: sections,
                onPressedPrevious: () {
                  section.value--;
                  scrollTo(section.value);
                },
                onPressedNext: () {
                  section.value++;
                  scrollTo(section.value);
                },
              ),
            if (!isLarge && !isSmall)
              Container(
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
          ],
        ),
      ),
    );
  }
}
