import 'package:flutter/material.dart';

/// Modified from [https://stackoverflow.com/questions/71527018/how-to-make-a-custom-bubble-shape-in-flutter].
class YDToolTipShape extends ShapeBorder {
  final bool usePadding;

  const YDToolTipShape({this.usePadding = false});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 0));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 4)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(8, 6)
      ..relativeLineTo(8, -6)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
