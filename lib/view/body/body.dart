import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'widget/next_section_button.dart';
import 'widget/previous_section_button.dart';

final currentSectionProvider = StateProvider((ref) => 0);
final nextSectionProvider = Provider((ref) {
  final nextSection = ref.watch(currentSectionProvider);
  return nextSection + 1;
});
final previousSectionProvider = Provider((ref) {
  final previousSection = ref.watch(currentSectionProvider);
  return previousSection - 1;
});

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends ConsumerState<Body> with TickerProviderStateMixin {
  late final ItemScrollController _itemScrollController =
      ItemScrollController();
  late final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
  }

  void scrollTo(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final int sectionIndex = ref.watch(currentSectionProvider);
    final int nextSection = ref.watch(nextSectionProvider);
    final int previousSection = ref.watch(previousSectionProvider);

    final Size screen = ResponsiveWidget.getScreenSize(context);
    final bool isSmall = ResponsiveWidget.isSmallScreen(context);
    final bool isLarge = ResponsiveWidget.isLargeScreen(context);

    const double leftMenuSizeW = 256;

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
                    ref.read(currentSectionProvider.notifier).update(
                          (state) => state = index,
                        );
                    scrollTo(index);
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
                                      ref
                                          .read(currentSectionProvider.notifier)
                                          .update(
                                            (state) => state = index,
                                          );
                                      scrollTo(index);
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
                      itemScrollController: _itemScrollController,
                      itemPositionsListener: _itemPositionsListener,
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
            isSmall
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: sectionIndex == 0
                          ? nextSectionButton(
                              onPressed: () {
                                ref
                                    .read(currentSectionProvider.notifier)
                                    .update(
                                      (state) => state + 1,
                                    );
                                scrollTo(nextSection);
                              },
                            )
                          : sectionIndex == sections.length - 1
                              ? previousSectionButton(
                                  onPressed: () {
                                    ref
                                        .read(currentSectionProvider.notifier)
                                        .update(
                                          (state) => state - 1,
                                        );
                                    scrollTo(previousSection);
                                  },
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    previousSectionButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                                currentSectionProvider.notifier)
                                            .update(
                                              (state) => state - 1,
                                            );
                                        scrollTo(previousSection);
                                      },
                                    ),
                                    nextSectionButton(
                                      onPressed: () {
                                        ref
                                            .read(
                                                currentSectionProvider.notifier)
                                            .update(
                                              (state) => state + 1,
                                            );
                                        scrollTo(nextSection);
                                      },
                                    )
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




  List<Widget> sections = [
    const Top(),
    const AboutMe(),
    const AboutProductions(),
    const Skils(),
    const Contact(),
  ];
}
