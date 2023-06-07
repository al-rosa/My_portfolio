import 'package:flutter/foundation.dart';

String path(String str) {
  return (kIsWeb) ? 'assets/$str' : str;
}
