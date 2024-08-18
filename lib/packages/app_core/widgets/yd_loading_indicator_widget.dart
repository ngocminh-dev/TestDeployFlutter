import 'package:flutter/cupertino.dart';

class YDLoadingCircleIndicatorWidget extends StatelessWidget {
  const YDLoadingCircleIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
