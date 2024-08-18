import '../../packages/index.dart';

class AppIconButtonVertical extends StatelessWidget {
  final String title;
  final String icon;
  final Color? bgColor;
  final Color? iconColor;
  final double? height;
  final double? width;
  final GestureTapCallback? onTapCallback;

  const AppIconButtonVertical(
      {super.key,
      required this.title,
      required this.icon,
      this.iconColor,
      this.onTapCallback,
      this.bgColor,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return YdInkWell(
      onTap: onTapCallback,
      child: Container(
        width: width ?? 100,
        height: height,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.white,
          borderRadius: context.borderMedium,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(
              asset: icon,
              width: 24,
              height: 24,
              color: iconColor ?? Colors.black,
            ),
            context.height4X,
            AppText(
              title,
              style: TextStyle(color: iconColor ?? Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
