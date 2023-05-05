import 'package:flutter/material.dart';
import 'package:r0sa_profile/model/emum/section.dart';

import '../../constants.dart';

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return SizedBox(
      width: screen.width,
      height: screen.height,
      child: Center(
        child: SizedBox(
          width: screen.width * 0.51058201,
          height: screen.height * 0.33808554,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Section.contact.title,
                style: ITextStyle.boldText,
              ),
              const Text(
                "ここまでご覧いただいてありがとうございました。当サイトや私自身についてコメントがございましたら下記のフォームからご連絡ください。また、お仕事の依頼も待っております。",
                style: ITextStyle.regularText,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: screen.width * 0.24537037,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Name."),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: screen.width * 0.24537037,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Email."),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
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
