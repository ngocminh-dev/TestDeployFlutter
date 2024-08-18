import '../../index.dart';

class AppSkeletonWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadiusGeometry? border;

  const AppSkeletonWidget({
    super.key,
    this.width = 60,
    this.height = 24,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFDBDBDB),
      highlightColor: const Color(0xFFFFFFFF),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: border ?? context.borderSmall,
          color: Colors.white,
        ),
      ),
    );
  }
}
