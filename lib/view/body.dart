import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'common/color.dart';
import 'section/about_me.dart';
import 'section/fotter.dart';
import 'section/other.dart';
import 'section/top.dart';
import 'section/work.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    const Work(),
    const Other(),
    const Fotter(),
  ];

  Widget menu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  _scroll(0);
                },
                child: const Text(
                  'top',
                  style: TextStyle(color: textColor, fontSize: 32),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scroll(1);
                },
                child: const Text(
                  'About Me',
                  style: TextStyle(color: textColor, fontSize: 32),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scroll(2);
                },
                child: const Text(
                  'Work',
                  style: TextStyle(color: textColor, fontSize: 32),
                ),
              ),
              TextButton(
                onPressed: () {
                  _scroll(3);
                },
                child: const Text(
                  'Other',
                  style: TextStyle(color: textColor, fontSize: 32),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 62, top: 62),
          child: TextButton(
            onPressed: () {
              _scroll(4);
            },
            child: const Text(
              'Account',
              style: TextStyle(color: textColor, fontSize: 32),
            ),
          ),
        ),
      ],
    );
  }
}
