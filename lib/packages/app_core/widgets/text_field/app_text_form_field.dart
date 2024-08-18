import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../index.dart';

/// This TextFormField will have a default spacing of 20px below it, as we inserted
/// a blank hintText to avoid layout shifting.
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
    this.contentPadding,
    this.enabled = true,
    this.autofocus = false,
    this.width,
    this.height,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.focusNode,
    this.obscureText = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.scrollPhysics,
    this.inputDecoration,
    this.autovalidateMode,
    this.borderRadius,
    this.obscuringCharacter,
    this.filled = false,
    this.fillColor,
    this.style,
    this.counterText,
    this.counterStyle,
    this.maxLines,
    this.helperText,
    this.helperStyle,
    this.prefixIconConstraints,
    this.errorStyle,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final InputDecoration? inputDecoration;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final bool enabled;
  final bool filled;
  final Color? fillColor;
  final bool autofocus;
  final double? width;
  final double? height;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ScrollPhysics? scrollPhysics;
  final AutovalidateMode? autovalidateMode;
  final double? borderRadius;
  final TextStyle? style;
  final String? obscuringCharacter;
  final String? counterText;
  final String? helperText;
  final TextStyle? counterStyle;
  final TextStyle? helperStyle;
  final TextStyle? errorStyle;
  final int? maxLines;
  final BoxConstraints? prefixIconConstraints;

  /// Icon before and outside of the TextFormField border
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style ??
          context.body3.copyWith(
            color: enabled ? context.color.textTitle : context.color.gray90,
          ),
      textAlignVertical: TextAlignVertical.center,
      controller: controller,
      autofocus: autofocus,
      maxLines: maxLines,
      focusNode: focusNode,
      autovalidateMode: autovalidateMode,
      decoration: inputDecoration ??
          AppInputDecoration.normal(
            context,
            prefixIconConstraints: prefixIconConstraints,
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            icon: icon,
            contentPadding:
                contentPadding ?? AppStyleConstant.textFieldContentPadding,
            enabled: enabled,
            filled: filled,
            fillColor: fillColor,
            borderRadius: borderRadius,
            counterText: counterText,
            counterStyle: counterStyle,
            helperText: helperText,
            helperStyle: helperStyle,
            errorStyle: errorStyle,
          ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      textInputAction: textInputAction,
      initialValue: initialValue,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter ?? "*",
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onTapOutside: onTapOutside,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      inputFormatters: inputFormatters,
      scrollPhysics: scrollPhysics,
    );
  }
}
