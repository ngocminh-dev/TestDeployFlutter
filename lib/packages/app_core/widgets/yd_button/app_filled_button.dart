import 'package:flutter/material.dart';

import '../../index.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.child,
    this.buttonStyle,
    this.onPressed,
    this.active,
    this.pressed,
    this.disabled,
    this.height,
    this.width,
  });

  final Color? active;
  final Color? pressed;
  final Color? disabled;
  final Widget child;

  /// Use Size because we want to give the constraints to other type of
  /// buttons, such as [YDSolidButton.small]
  final double? width;
  final double? height;

  final ButtonStyle? buttonStyle;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: FilledButton(
        onPressed: onPressed,
        style: buttonStyle ??
            YDButtonStyle.defaultSolidStyle.copyWith(
              backgroundColor: _createBackgroundColor(),
            ),
        child: child,
      ),
    );
  }

  MaterialStateProperty<Color?>? _createBackgroundColor() {
    if (active != null) {
      return MaterialColorMixin.getMaterialProps(
        active: active,
        pressed: pressed,
        disabled: disabled,
      );
    }
    return YDButtonStyle.defaultSolidStyle.backgroundColor;
  }

  factory AppFilledButton.small({
    Key? key,
    required Widget child,
    ButtonStyle? buttonStyle,
    VoidCallback? onPressed,
  }) {
    return AppFilledButton(
      key: key,
      height: AppStyleConstant.smallButtonHeight,
      buttonStyle: YDButtonStyle.smallSolidButtonStyle,
      onPressed: onPressed,
      child: child,
    );
  }

  factory AppFilledButton.withIcon({
    required Widget label,
    VoidCallback? onPressed,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return AppFilledButton(
      onPressed: onPressed,
      child: Row(
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
