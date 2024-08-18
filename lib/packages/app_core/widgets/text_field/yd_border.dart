import 'package:flutter/material.dart';

import '../../themes/app_color.dart';
import '../../themes/app_style_constants.dart';

class YDBorder {
  const YDBorder._();

  static const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
        Radius.circular(AppStyleConstant.textFieldBorderRadius)),
    borderSide: BorderSide(width: 1, color: AppColor.borderBorder),
  );

  static OutlineInputBorder createOutlineInputBorder(double borderRadius) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: const BorderSide(width: 1, color: AppColor.borderBorder),
      );
}
