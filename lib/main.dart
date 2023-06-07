import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r0sa_profile/constants.dart';

import 'view/body.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: IColor.background,
        textTheme:
            GoogleFonts.courierPrimeTextTheme(Theme.of(context).textTheme),
      ),
      home: const BodyV2(),
    );
  }
}
