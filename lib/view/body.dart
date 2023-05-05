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
                  _scroll(Section.top.num);
                },
                child: Text(
                  Section.top.title,
                  style: ITextStyle.midText,
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
                  style: ITextStyle.midText,
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
                              _scroll(Section.aboutMe.num);
                            },
                            child: const Text(
                              "About me",
                              style: ITextStyle.midText,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              _scroll(Section.aboutProductions.num);
                            },
                            child: const Text(
                              "About production",
                              style: ITextStyle.midText,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              TextButton(
                onPressed: () {
                  _scroll(Section.contact.num);
                },
                child: Text(
                  Section.contact.title,
                  style: ITextStyle.midText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
