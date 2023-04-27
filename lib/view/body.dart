import 'package:flutter/material.dart';
import 'package:r0sa_profile/view/common/contents.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'common/colors.dart';
import 'section/about_me.dart';
import 'section/engineering_design.dart';
import 'section/fotter.dart';
import 'section/other.dart';
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

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: sections.length,
            itemBuilder: (context, index) {
              if (index == 0 || index == sections.length - 1) {
                return sections[index];
              } else {
                return Padding(
                  padding: EdgeInsets.only(
                      left: screen.width / 4, top: screen.height / 8),
                  child: sections[index],
                );
              }
            },
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionsListener,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: menu(),
          ),
        ],
      ),
    );
  }

  List<Widget> sections = [
    const Top(),
    const AboutMe(),
    const EngineeringDesign(),
    const Other(),
    const Fotter(),
  ];

  Widget menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _scroll(Contents.top.num);
                },
                child: Text(
                  Contents.top.title,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w100),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scroll(Contents.aboutMe.num);
                },
                child: Text(
                  Contents.aboutMe.title,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w100),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scroll(Contents.engineeringDesign.num);
                },
                child: Text(
                  Contents.engineeringDesign.title,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w100),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scroll(Contents.other.num);
                },
                child: Text(
                  Contents.other.title,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 62),
          child: TextButton(
            onPressed: () {
              _scroll(Contents.account.num);
            },
            child: Text(
              Contents.account.title,
              style: const TextStyle(
                color: textColor,
                fontSize: 27,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
