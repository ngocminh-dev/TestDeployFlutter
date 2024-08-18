import '../../packages/index.dart';

class CircularAppIconButton extends StatelessWidget {
  final String icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? radius;
  final GestureTapCallback? onTapCallback;

  const CircularAppIconButton(
      {super.key,
      required this.icon,
      this.iconColor,
      this.onTapCallback,
      this.bgColor,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return YdInkWell(
        onTap: onTapCallback,
        borderRadius: const BorderRadius.all(Radius.circular(80)),
        child: Container(
          width: radius ?? 60,
          height: radius ?? 60,
          decoration: BoxDecoration(
            color: bgColor ?? const Color(0xFFFFF4F8),
            borderRadius: const BorderRadius.all(Radius.circular(80)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AppImage(
              asset: icon,
              color: iconColor ?? Colors.black,
            ),
          ),
        ));
  }
}
