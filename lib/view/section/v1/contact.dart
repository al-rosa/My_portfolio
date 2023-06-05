import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';
import 'package:r0sa_profile/responsive_widget.dart';

import '../../../constants.dart';

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = ResponsiveWidget.getScreenSize(context);

    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Center(
        child: SizedBox(
          width: ResponsiveWidget.isSmallScreen(context)
              ? screen.width * 0.9
              : screen.width * 0.51058201,
          height: ResponsiveWidget.isSmallScreen(context)
              ? screen.height * 0.4
              : screen.height * 0.33808554,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Section.contact.title,
                style: ITextStyle.boldText,
              ),
              const SizedBox(height: 12),
              Text(
                "ここまでご覧いただいてありがとうございました。当サイトや私自身についてコメントがございましたら下記のフォームからご連絡ください。また、お仕事の依頼も待っております。",
                style: ResponsiveWidget.isSmallScreen(context)
                    ? ITextStyle.minMidText
                    : ITextStyle.regularText,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: ResponsiveWidget.isSmallScreen(context)
                        ? EdgeInsets.zero
                        : const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? screen.width * 0.4
                          : screen.width * 0.24537037,
                      child: TextFormField(
                        cursorColor: IColor.grey,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: IColor.grey, width: 1)),
                          labelStyle: ITextStyle.regularText,
                          label: Text("Name."),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: ResponsiveWidget.isSmallScreen(context)
                        ? EdgeInsets.zero
                        : const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? screen.width * 0.4
                          : screen.width * 0.24537037,
                      child: TextFormField(
                        cursorColor: IColor.grey,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: IColor.grey, width: 1)),
                          labelStyle: ITextStyle.regularText,
                          label: Text("Email."),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              TextFormField(
                cursorColor: IColor.grey,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: IColor.grey, width: 1)),
                  labelStyle: ITextStyle.regularText,
                  label: Text("Comment."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
