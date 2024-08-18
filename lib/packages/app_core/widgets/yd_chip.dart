import 'package:flutter/material.dart';

import '../index.dart';

class YDChip extends StatelessWidget {
  const YDChip({
    super.key,
    this.color,
    this.backgroundColor,
    this.prefixIcon,
    this.onTap,
    required this.label,
    this.style,
  });

  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 26,
        padding: EdgeInsets.symmetric(
          horizontal: context.padding12X,
        ),
        decoration: ShapeDecoration(
          color: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: color ?? context.color.textTitle,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIcon ?? const SizedBox.shrink(),
            if (prefixIcon != null) context.width4X,
            AppText(
              label,
              style: style ??
                  context.subtitle3.copyWith(
                    color: color ?? context.color.textTitle,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
