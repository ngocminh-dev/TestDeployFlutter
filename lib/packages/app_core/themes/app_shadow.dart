import 'package:flutter/material.dart';

extension AppShadowExt on BuildContext {
  static const bottomShadow = [
    BoxShadow(
      color: Color(0x0F2D3239),
      blurRadius: 6,
      offset: Offset(0, -2),
      spreadRadius: 0,
    )
  ];
  static const appbarShadow = [
    BoxShadow(
      color: Color(0x0F2D3239),
      blurRadius: 6,
      offset: Offset(0, 1),
      spreadRadius: 0,
    )
  ];

  static const depth4Shadow = [
    BoxShadow(
      offset: Offset(0, 1.6),
      blurRadius: 3.6,
      color: Color.fromRGBO(0, 0, 0, 0.13),
    ),
    BoxShadow(
      offset: Offset(0, 3),
      blurRadius: 0.9,
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
  ];

  static const depth8Shadow = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 4,
      color: Color.fromRGBO(0, 0, 0, 0.25),
    ),
  ];

  static const depth16Shadow = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 14.4,
      color: Color.fromRGBO(0, 0, 0, 0.13),
    ),
    BoxShadow(
      offset: Offset(0, 1.2),
      blurRadius: 3.6,
      color: Color.fromRGBO(0, 0, 0, 0.1),
    ),
  ];

  static const depth64Shadow = [
    BoxShadow(
      offset: Offset(0, 25.6),
      blurRadius: 57.6,
      color: Color.fromRGBO(0, 0, 0, 0.08),
    ),
    BoxShadow(
      offset: Offset(0, 4.8),
      blurRadius: 14.4,
      color: Color.fromRGBO(0, 0, 0, 0.08),
    ),
  ];
}
