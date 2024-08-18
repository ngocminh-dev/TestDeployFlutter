import 'package:flutter/material.dart';

import 'app_spacing.dart';

class AppStyleConstant {
  const AppStyleConstant._();

  static const double hPagePadding = 16;

  // TextFormField/TextField
  static const double textFieldBorderWidth = 1;
  static const double textFieldBorderRadius = 12;
  static const double textFieldHeight = 48;
  static const EdgeInsets textFieldContentPadding =
      EdgeInsets.fromLTRB(16, 10, 16, 10);
  static const double textFieldHPadding = 16;
  static const BoxConstraints textFieldConstraints =
      BoxConstraints(minWidth: 20, maxWidth: 36, minHeight: 20, maxHeight: 48);

  // Button
  static const Widget buttonContentPaddingWithIcon = YDSpacing.width8X;
  static const double buttonBorderRadius = 12;
  static const double buttonBorderWidth = 1.2;
  static const EdgeInsets solidButtonStylePadding =
      EdgeInsets.symmetric(vertical: 12, horizontal: 16);
  static const EdgeInsets outlinedButtonStylePadding =
      EdgeInsets.symmetric(vertical: 0, horizontal: 16);
  static const EdgeInsets textButtonStylePadding =
      EdgeInsets.symmetric(vertical: 0, horizontal: 16);

  static const EdgeInsets solidButtonStylePaddingButton =
      EdgeInsets.symmetric(vertical: 12, horizontal: 54);

  static const double buttonHeight = 48;
  static const double smallButtonHeight = 40;

  // ModalBottomSheet
  static const double sheetBarrierColorOpacity = 0.6;
  static const double sheetMaxDistanceFromTop = 84;
  static const double sheetTopBorderRadius = 20;

  // Toast
  static const int toastDuration = 2250;

  /// rounding
  ///
  static const double noRounding = 0;
  static const double extraSmallRounding = 6;
  static const double smallRounding = 8;
  static const double mediumRounding = 12;
  static const double largeRounding = 16;
  static const double extraLargeRounding = 28;
  static const double maxLargeRounding = 32;

  static final borderExtraSmall = BorderRadius.circular(extraSmallRounding);
  static final borderSmall = BorderRadius.circular(smallRounding);
  static final borderMedium = BorderRadius.circular(mediumRounding);
  static final borderLarge = BorderRadius.circular(largeRounding);
  static final borderExtraLarge = BorderRadius.circular(extraLargeRounding);
  static final borderMaxLarge = BorderRadius.circular(maxLargeRounding);

  static BoxShadow shadow = BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 4,
    spreadRadius: 0,
    offset: const Offset(0, 2), // shadow direction: bottom right
  );

  static List<BoxShadow> floatingButtonShadow = [
    const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 57.60,
      offset: Offset(0, 25.60),
      spreadRadius: 0,
    ),
    const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 14.40,
      offset: Offset(0, 4.80),
      spreadRadius: 0,
    )
  ];

  static const sizeImageCache = 1080;

  static const double appBarHeight = 64;

  static const double homeImageRatio = 3 / 4;
  static const double homeProductHeightAdded = 110;

  static const double articleImageRatio = 4 / 3;
}
