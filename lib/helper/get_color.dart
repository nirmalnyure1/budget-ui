import 'package:flutter/material.dart';

Color getColor(BuildContext context, percent) {
  if (percent >= 0.5) {
    return Colors.green.shade400;
  } else if (percent >= 0.25) {
    return Colors.blue.shade400;
  }
  return Theme.of(context).primaryColor;
}
