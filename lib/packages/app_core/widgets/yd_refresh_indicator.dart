import 'package:photo_ai/packages/index.dart';

class YDRefreshIndicator extends StatelessWidget {
  const YDRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
    this.edgeOffset = 16,
    this.displacement = 48,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final double edgeOffset;
  final double displacement;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      edgeOffset: edgeOffset,
      color: context.color.primary,
      backgroundColor: context.color.white,
      onRefresh: onRefresh,
      displacement: displacement,
      child: child,
    );
  }
}
