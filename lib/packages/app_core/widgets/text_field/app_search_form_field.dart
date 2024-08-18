import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_ai/packages/index.dart';

import '../../../../generated/assets.dart';

class AppSearchFormField extends FormField<String> {
  final TextEditingController? textEditingController;

  AppSearchFormField({
    super.key,
    String? hint,
    int? maxLines = 1,
    int? maxLength = 1000,
    super.onSaved,
    TextInputType keyboardType = TextInputType.text,
    this.textEditingController,
    ValueChanged<String>? onChanged,
    Function(String)? onSubmitted,
    VoidCallback? onEditingComplete,
    VoidCallback? onCancel,
    super.validator,
    List<TextInputFormatter>? textInputFormatter,
    Color? backgroundColor,
    Color? borderColor,
    Color? hintColor,
    Color? textColor,
    Color? iconColor,
    bool? readOnly,
    bool autofocus = false,
    Widget? suffixIcon,
    // prefix icon
    bool hasPrefix = true,
    double borderRadius = 40,
    String prefixIcon = Assets.customSearchNormal,
    double prefixIconSize = 24,
    Color? prefixIconColor,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Function()? onTap,
  }) : super(
          builder: (field) {
            final state = field as _SearchFormFieldState;
            return CupertinoTextField(
              autofocus: autofocus,
              onTap: onTap,
              cursorColor: field.context.color.textTitle,
              readOnly: readOnly ?? false,
              controller: state.textEditingController,
              textInputAction: TextInputAction.search,
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: 16,
                right: 12,
              ),
              maxLines: maxLines,
              maxLength: maxLength,
              placeholder: hint,
              placeholderStyle: field.context.placeholder2.copyWith(
                color: hintColor ?? field.context.color.textPlaceholder,
                height: 1.0,
              ),
              onChanged: (value) {
                if (onChanged != null) {
                  onChanged(value);
                }
                field.didChange(value);
              },
              onEditingComplete: () {
                FocusScope.of(field.context).unfocus();
                if (onEditingComplete != null) {
                  onEditingComplete();
                }
              },
              onSubmitted: onSubmitted,
              decoration: BoxDecoration(
                color: backgroundColor ?? field.context.color.backgroundLight2,
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  color: borderColor ?? field.context.color.borderBorder,
                  width: 1,
                ),
              ),
              style: field.context.placeholder2.copyWith(
                color: field.context.color.textTitle,
                height: 1.0,
              ),
              inputFormatters: textInputFormatter,
              prefix: !hasPrefix
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(left: field.context.padding12X),
                      child: InkWell(
                        onTap: () {
                          if (onEditingComplete != null) {
                            onEditingComplete();
                          }
                        },
                        child: AppImage(
                          asset: prefixIcon,
                          width: prefixIconSize,
                          height: prefixIconSize,
                          color:
                              prefixIconColor ?? field.context.color.textTitle,
                        ),
                      ),
                    ),
              suffix: suffixIcon ??
                  (state.textEditingController.text.isNotEmpty
                      ? SizedBox(
                          width: 40,
                          height: 32,
                          child: IconButton(
                            splashRadius: 20,
                            icon: AppImage(
                              asset: Assets.boldCloseCircle,
                              width: 20,
                              height: 20,
                              fit: BoxFit.scaleDown,
                              color: field.context.color.textSubtitle,
                            ),
                            onPressed: () {
                              // ignore: invalid_use_of_protected_member
                              state.setState(() {
                                state.textEditingController.clear();
                              });
                              if (onCancel != null) {
                                onCancel();
                              }
                            },
                          ),
                        )
                      : null),
            );
          },
        );

  @override
  FormFieldState<String> createState() {
    return _SearchFormFieldState();
  }
}

class _SearchFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController =
        (widget as AppSearchFormField).textEditingController ??
            TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
