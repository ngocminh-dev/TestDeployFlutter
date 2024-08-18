import 'package:flutter/material.dart';
import '../themes/app_color.dart';

class YDDivider extends StatelessWidget {
  const YDDivider({super.key, this.color, this.height});

  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColor.borderDivider,
      height: height ?? 1,
    );
  }
}

class YDVerticalDivider extends StatelessWidget {
  const YDVerticalDivider({
    super.key,
    this.color,
    this.width,
    this.height,
  });

  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: color ?? AppColor.borderDivider,
      width: width ?? 0.7,
      thickness: 1,
    );
  }
}
