import 'package:flutter/material.dart';
import 'package:r0sa_profile/view/common/contents.dart';
import 'package:r0sa_profile/view/section/about_productions.dart';
import 'package:r0sa_profile/view/section/contact.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'common/colors.dart';
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
    const AboutProductions(),
    const Contact(),
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
                  setState(() {
                    test = !test;
                  });
                },
                child: const Text(
                  "About ...",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w100),
                ),
              ),
              test
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              _scroll(Contents.aboutMe.num);
                            },
                            child: const Text(
                              "About me",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _scroll(Contents.aboutProductions.num);
                            },
                            child: const Text(
                              "About production",
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w100),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              TextButton(
                onPressed: () {
                  _scroll(Contents.contact.num);
                },
                child: Text(
                  Contents.contact.title,
                  style: const TextStyle(
                      color: textColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
