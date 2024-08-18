import 'package:flutter/material.dart';

import '../../../index.dart';

class YDCrossLineTextButton extends StatelessWidget {
  const YDCrossLineTextButton({super.key, required this.text});

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
              height: 1, width: double.infinity, color: AppColor.borderDivider),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: text,
        ),
        Expanded(
          child: Container(
              height: 1, width: double.infinity, color: AppColor.borderDivider),
        )
      ],
    );
  }
}
