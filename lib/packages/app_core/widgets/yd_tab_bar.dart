import 'package:flutter/material.dart';

import '../themes/index.dart';

class YDTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? controller;
  final List<String> title;

  // default onTapCallback  = null, will scroll to tabBarView normal
  final ValueChanged<int>? onTapCallback;
  final bool scrollable;
  final TabBarIndicatorSize indicatorSize;

  const YDTabBar({
    super.key,
    this.controller,
    required this.title,
    this.onTapCallback,
    this.scrollable = true,
    this.indicatorSize = TabBarIndicatorSize.label,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      isScrollable: scrollable,
      indicatorColor: context.color.primary,
      labelColor: context.color.textTitle,
      unselectedLabelColor: context.color.textSubtitle,
      labelStyle: context.label3,
      unselectedLabelStyle: context.label3,
      indicatorSize: indicatorSize,
      indicatorPadding: EdgeInsets.only(
        bottom: context.padding8X,
        left: indicatorSize == TabBarIndicatorSize.tab ? context.padding16X : 0,
        right:
            indicatorSize == TabBarIndicatorSize.tab ? context.padding16X : 0,
      ),
      indicator: UnderlineTabIndicator(
        borderRadius: context.borderExtraSmall,
        borderSide: BorderSide(width: 2, color: context.color.textTitle),
      ),
      dividerColor: Colors.transparent,
      tabs: List.generate(title.length, (index) {
        return Tab(text: title[index]);
      }),
      onTap: onTapCallback,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(46);
  }
}
