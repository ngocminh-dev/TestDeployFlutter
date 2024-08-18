import 'package:flutter/material.dart';

import '../../index.dart';

class YDTextButton extends StatelessWidget {
  const YDTextButton({
    super.key,
    required this.label,
    this.buttonStyle,
    this.onPressed,
  });

  final Widget label;
  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: buttonStyle ?? YDButtonStyle.defaultTextStyle,
        child: label);
  }

  factory YDTextButton.withIcon({
    required Widget label,
    VoidCallback? onPressed,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return YDTextButton(
      onPressed: onPressed,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) prefixIcon,
          if (prefixIcon != null) AppStyleConstant.buttonContentPaddingWithIcon,
          label,
          if (suffixIcon != null) AppStyleConstant.buttonContentPaddingWithIcon,
          if (suffixIcon != null) suffixIcon,
        ],
      ),
    );
  }
}
