import '../../packages/index.dart';

class AppIconButtonHorizontal extends StatelessWidget {
  final String title;
  final String icon;
  final Color? bgColor;
  final Color iconColor;
  final double? height;
  final double? width;
  final GestureTapCallback? onTapCallback;

  const AppIconButtonHorizontal(
      {super.key,
      required this.title,
      required this.icon,
      required this.iconColor,
      this.onTapCallback,
      this.bgColor,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return YdInkWell(
      onTap: onTapCallback,
      child: Container(
        width: width,
        height: height ?? context.padding48X,
        decoration: BoxDecoration(
          color: bgColor ?? const Color(0xFFFFF4F8),
          borderRadius: context.borderMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppImage(
              asset: icon,
              width: 24,
              height: 24,
              color: iconColor,
            ),
            context.width12X,
            AppText(
              title,
              style: context.heading8.copyWith(color: iconColor),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
