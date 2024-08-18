import 'package:flutter/cupertino.dart';

class YDLazyLoadingWidget extends StatelessWidget {
  final bool canLoadMore;
  final double topMargin;

  const YDLazyLoadingWidget({
    super.key,
    this.canLoadMore = false,
    this.topMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return canLoadMore
        ? Container(
            padding: EdgeInsets.only(bottom: 12, top: topMargin),
            alignment: Alignment.topCenter,
            child: const CupertinoActivityIndicator(),
          )
        : const SizedBox.shrink();
  }
}
