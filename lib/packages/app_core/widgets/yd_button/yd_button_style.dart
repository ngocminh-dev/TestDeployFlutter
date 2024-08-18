import 'package:flutter/material.dart';

import '../../../index.dart';

class YDButtonStyle with MaterialColorMixin {
  const YDButtonStyle._();

  /// Default style for YDSolidButton, contains style config for multiple states
  /// such as [active], [pressed], and [disabled].
  ///
  /// Tip: to disable a button, set onPressed to null.
  static final defaultSolidStyle = ButtonStyle(
    textStyle: MaterialStatePropertyAll(AppTextStyle.button1),
    backgroundColor: MaterialColorMixin.getMaterialProps(
        active: AppColor.primary,
        pressed: AppColor.primaryPressed,
        disabled: AppColor.backgroundDisabled),
    foregroundColor: MaterialColorMixin.getMaterialProps(
        active: AppColor.textTitle,
        pressed: AppColor.secondary,
        disabled: AppColor.textDisabled),
    iconColor: MaterialColorMixin.getMaterialProps(
        active: AppColor.textTitle,
        pressed: AppColor.secondary,
        disabled: AppColor.textDisabled),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppStyleConstant.buttonBorderRadius))),
    padding: const MaterialStatePropertyAll(
        AppStyleConstant.solidButtonStylePadding),
  );

  static final smallSolidButtonStyle = defaultSolidStyle.copyWith(
    textStyle: MaterialStatePropertyAll(AppTextStyle.button3),
    padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: YDSpacing.padding12X)),
  );

  /// Default style for YDOutlinedButton, contains style config for multiple states
  /// such as [active], [pressed], and [disabled].
  ///
  /// Tip: to disable a button, set onPressed to null.
  static final defaultOutlinedStyle = ButtonStyle(
    textStyle: MaterialStatePropertyAll(AppTextStyle.button1),
    backgroundColor: MaterialColorMixin.getMaterialProps(
      active: AppColor.backgroundWhite,
      pressed: AppColor.primaryPressed,
      disabled: AppColor.backgroundWhite,
    ),
    foregroundColor: MaterialColorMixin.getMaterialProps(
      active: AppColor.textTitle,
      pressed: AppColor.secondary,
      disabled: AppColor.textDisabled,
    ),
    iconColor: MaterialColorMixin.getMaterialProps(
      active: AppColor.textTitle,
      pressed: AppColor.secondary,
      disabled: AppColor.textDisabled,
    ),
    shape: MaterialColorMixin.getMaterialProps(
      active: RoundedRectangleBorder(
          side: const BorderSide(
              width: AppStyleConstant.buttonBorderWidth,
              color: AppColor.textTitle),
          borderRadius:
              BorderRadius.circular(AppStyleConstant.buttonBorderRadius)),
      pressed: RoundedRectangleBorder(
          side: const BorderSide(
              width: AppStyleConstant.buttonBorderWidth,
              color: AppColor.secondary),
          borderRadius:
              BorderRadius.circular(AppStyleConstant.buttonBorderRadius)),
      disabled: RoundedRectangleBorder(
          side: const BorderSide(
              width: AppStyleConstant.buttonBorderWidth,
              color: AppColor.textDisabled),
          borderRadius:
              BorderRadius.circular(AppStyleConstant.buttonBorderRadius)),
    ),
    padding: const MaterialStatePropertyAll(
        AppStyleConstant.outlinedButtonStylePadding),
  );

  static final smallOutlinedButtonStyle = defaultOutlinedStyle.copyWith(
    textStyle: MaterialStatePropertyAll(AppTextStyle.button3),
    padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(horizontal: YDSpacing.padding12X)),
  );

  /// Default style for YDTextButton, contains style config for multiple states
  /// such as [active], [pressed], and [disabled].
  ///
  /// Tip: to disable a button, set onPressed to null.
  static final defaultTextStyle = ButtonStyle(
    textStyle: MaterialStatePropertyAll(AppTextStyle.button1),
    backgroundColor: MaterialColorMixin.getMaterialProps(
        active: AppColor.backgroundWhite,
        pressed: AppColor.primary,
        disabled: AppColor.backgroundWhite),
    foregroundColor: MaterialColorMixin.getMaterialProps(
        active: AppColor.alertInfo,
        pressed: AppColor.secondary,
        disabled: AppColor.textDisabled),
    iconColor: MaterialColorMixin.getMaterialProps(
        active: AppColor.alertInfo,
        pressed: AppColor.secondary,
        disabled: AppColor.textDisabled),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(AppStyleConstant.buttonBorderRadius))),
    padding:
        const MaterialStatePropertyAll(AppStyleConstant.textButtonStylePadding),
  );

  static final noPaddingTextStyle = defaultTextStyle.copyWith(
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      minimumSize: const MaterialStatePropertyAll(Size.zero),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(side: BorderSide.none),
      ));
}
