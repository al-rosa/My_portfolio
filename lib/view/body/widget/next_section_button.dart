import 'package:flutter/material.dart';

IconButton nextSectionButton({required onPressed}) {
  return IconButton(
      onPressed: onPressed, icon: const Icon(Icons.keyboard_arrow_down));
}
