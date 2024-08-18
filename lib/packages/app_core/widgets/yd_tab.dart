import 'package:flutter/material.dart';

import '../themes/index.dart';

class YDTab extends StatelessWidget {
  const YDTab({
    super.key,
    required this.label,
    required this.indicatorColor,
    this.indicatorHeight = 2,
    required this.textColor,
  });

  final String label;
  final Color indicatorColor;
  final Color textColor;
  final double indicatorHeight;

  @override
  Widget build(BuildContext context) {
    return Tab(
      iconMargin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: context.padding8X,
          horizontal: context.padding8X,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: indicatorColor,
              width: indicatorHeight,
            ),
          ),
        ),
        child: Text(
          label,
          style: context.subtitle3.copyWith(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
