import 'package:photo_ai/packages/index.dart';

class YdInkWell extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;

  const YdInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? context.borderSmall,
      splashColor: color ?? context.color.primary,
      onTap: onTap,
      child: child,
    );
  }
}

class YDInkWellOutline extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;

  const YDInkWellOutline({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: child,
    );
  }
}
