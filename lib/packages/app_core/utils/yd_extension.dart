import 'package:flutter/material.dart';

extension AddDivider on Widget {
  /// Puts the current widget inside a Column and add the [divider] after it.
  /// Uses when we want to add a horizontal divider.
  Widget addHDivider(Widget divider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [this, divider],
    );
  }

  /// Puts the current widget inside a Row and add the [divider] after it (on the
  /// right side).
  /// Uses when we want to add a vertical divider.
  Widget addVDivider(Widget divider) {
    return Row(children: [this, divider]);
  }
}

extension StringExt on String {
  Size textSize(TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: this, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}


extension NumExt on num? {
  String get convertNumToString {
    if (this == null) {
      return '';
    }
    if (this! >= 10) {
      return "$this";
    }
    return "0$this";
  }
}
