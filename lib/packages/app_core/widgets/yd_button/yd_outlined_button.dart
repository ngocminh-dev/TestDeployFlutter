import 'package:flutter/material.dart';

import '../../../index.dart';

class YDOutlinedButton extends StatelessWidget {
  const YDOutlinedButton({
    super.key,
    required this.label,
    this.buttonStyle,
    this.onPressed,
    this.size,
  });

  final Widget label;

  /// Use Size because we want to give the constraints to other type of
  /// buttons, such as [YDOutlinedButton.small]
  final Size? size;

  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height,
      width: size?.width,
      child: OutlinedButton(
        onPressed: onPressed,
        style: buttonStyle ?? YDButtonStyle.defaultOutlinedStyle,
        child: label,
      ),
    );
  }

  factory YDOutlinedButton.small({
    Key? key,
    required Widget label,
    ButtonStyle? buttonStyle,
    VoidCallback? onPressed,
  }) {
    return YDOutlinedButton(
      key: key,
      label: label,
      size: const Size.fromHeight(AppStyleConstant.smallButtonHeight),
      buttonStyle: YDButtonStyle.smallOutlinedButtonStyle,
      onPressed: onPressed,
    );
  }

  factory YDOutlinedButton.withIcon({
    required Widget label,
    VoidCallback? onPressed,
    Widget suffixPadding = AppStyleConstant.buttonContentPaddingWithIcon,
    Widget prefixPadding = AppStyleConstant.buttonContentPaddingWithIcon,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonStyle? buttonStyle,
    Size? size,
  }) {
    return YDOutlinedButton(
      onPressed: onPressed,
      size: size,
      buttonStyle: buttonStyle,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon,
          if (prefixIcon != null) prefixPadding,
          label,
          if (suffixIcon != null) suffixPadding,
          if (suffixIcon != null) suffixIcon,
        ],
      ),
    );
  }
}
