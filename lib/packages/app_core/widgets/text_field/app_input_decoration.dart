import 'package:flutter/material.dart';
import '../../../index.dart';

class AppInputDecoration {
  static InputDecoration normal(
    BuildContext context, {
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    // Icon before and outside of the TextFormField border
    Widget? icon,
    EdgeInsets? contentPadding,
    bool enabled = true,
    bool filled = false,
    Color? fillColor,
    double? borderRadius,
    String? counterText,
    TextStyle? counterStyle,
    String? helperText,
    TextStyle? helperStyle,
    TextStyle? errorStyle,
    BoxConstraints? prefixIconConstraints,
  }) {
    return ((InputDecoration(
      counterText: counterText ?? "",
      border: borderRadius != null
          ? YDBorder.createOutlineInputBorder(borderRadius)
          : YDBorder.outlineInputBorder,
      focusedBorder: YDBorder.outlineInputBorder.copyWith(
        borderSide: const BorderSide(
          width: AppStyleConstant.textFieldBorderWidth,
          color: AppColor.alertInfoBorder,
        ),
      ),
      focusedErrorBorder: YDBorder.outlineInputBorder.copyWith(
        borderSide: const BorderSide(
          width: AppStyleConstant.textFieldBorderWidth,
          color: AppColor.alertError,
        ),
      ),
      enabledBorder: YDBorder.outlineInputBorder,
      disabledBorder: YDBorder.outlineInputBorder.copyWith(
        borderSide: const BorderSide(
          width: AppStyleConstant.textFieldBorderWidth,
          color: AppColor.gray40,
        ),
      ),
      labelText: labelText,
      labelStyle: context.label1.copyWith(color: context.color.textTitle),

      // helperStyle & hintStyle need to have the same line height to avoid
      // layout shifting.
      helperStyle: helperStyle ?? context.subtitle4.copyWith(height: 1.0),

      helperText: helperText ?? ' ',
      // set default helperText to avoid layout shift
      errorStyle: errorStyle ??
          context.subtitle4.copyWith(
            color: context.color.alertErrorSub,
            height: 1.0,
          ),
      counterStyle: counterStyle ?? context.subtitle3,
      hintText: hintText,
      hintStyle: context.body3.copyWith(
        color: context.color.textPlaceholder,
        height: 1.0,
      ),
      contentPadding: contentPadding,
      prefixIcon: Padding(
        padding:
            const EdgeInsets.only(left: AppStyleConstant.textFieldHPadding),
        child: prefixIcon,
      ),
      prefixIconConstraints:
          prefixIconConstraints ?? AppStyleConstant.textFieldConstraints,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 0),
        child: suffixIcon,
      ),
      suffixIconConstraints: AppStyleConstant.textFieldConstraints,
      icon: icon,
      fillColor: fillColor ?? AppColor.gray40,
      filled: filled,
      enabled: enabled,
    )));
  }
}
