import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'view/body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            GoogleFonts.courierPrimeTextTheme(Theme.of(context).textTheme),
      ),
      home: const Body(),
    );
  }
}
