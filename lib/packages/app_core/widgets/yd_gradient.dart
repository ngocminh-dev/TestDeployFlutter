import 'package:flutter/material.dart';

import '../themes/index.dart';

class YDGradient {
  const YDGradient._();

  static const List<Color> orange = [
    AppColor.gradientStart1,
    AppColor.gradientEnd1
  ];
  static const List<Color> green = [
    AppColor.gradientStart2,
    AppColor.gradientEnd2
  ];
  static const List<Color> purple = [
    AppColor.gradientStart3,
    AppColor.gradientEnd3
  ];
  static const List<Color> teal = [
    AppColor.gradientStart4,
    AppColor.gradientEnd4
  ];
  static const List<Color> blue = [
    AppColor.gradientStart5,
    AppColor.gradientEnd5
  ];
  static const List<Color> indigo = [
    AppColor.gradientStart6,
    AppColor.gradientEnd6
  ];

  static const bgColors = <String, List<Color>>{
    "gradient-orange": [AppColor.gradientStart1, AppColor.gradientEnd1],
    "gradient-green": [AppColor.gradientStart2, AppColor.gradientEnd2],
    "gradient-purple": [AppColor.gradientStart3, AppColor.gradientEnd3],
    "gradient-teal": [AppColor.gradientStart4, AppColor.gradientEnd4],
    "gradient-blue": [AppColor.gradientStart5, AppColor.gradientEnd5],
    "gradient-indigo": [AppColor.gradientStart6, AppColor.gradientEnd6],
  };

  static const defaultBg = [AppColor.gradientStart1, AppColor.gradientEnd1];

  static const defaultColorName = "gradient-orange";

  static List<String> get colorsName => bgColors.keys.toList();

  static List<List<Color>> get colorsValues => bgColors.values.toList();
}
