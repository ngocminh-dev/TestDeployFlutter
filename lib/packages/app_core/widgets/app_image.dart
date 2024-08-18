import 'package:photo_ai/generated/assets.dart';

import '../../index.dart';

class AppImage extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final double radius;
  final bool cache;
  final bool inStorage;

  const AppImage({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.radius = 0,
    this.cache = true,
    this.inStorage = false,
  });

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (inStorage) {
      child = _buildStorageImage();
    } else if (isNetworkAsset()) {
      child = _buildNetworkImg();
    } else if (isSvgAsset()) {
      child = _buildSvg();
    } else {
      child = _buildLocalImage();
    }

    return (radius == 0) ? child : _buildRadius(child);
  }

  bool isNetworkAsset() {
    return !asset.startsWith('assets');
  }

  bool isSvgAsset() {
    return asset.contains('.svg');
  }

  Widget _buildLocalImage() {
    return Image.asset(
      asset.isBlank == true ? Assets.outlineImage : asset,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
      filterQuality: FilterQuality.high,
    );
  }

  Widget _buildSvg() {
    return buildSvg(
      asset: asset,
      width: width,
      height: height,
      fit: fit,
      colorFilter:
          color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }

  Widget _buildRadius(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: child,
    );
  }

  Widget _buildStorageImage() {
    return Image.file(
      File(asset),
      width: width,
      height: height,
      fit: fit,
    );
  }

  Widget _buildNetworkImg() {
    return cache
        ? CachedNetworkImage(
            imageUrl: asset,
            width: width,
            height: height,
            fit: fit,
            errorWidget: (_, __, ___) {
              return AppSkeletonWidget(width: width, height: height);
            },
          )
        : Image.network(asset, width: width, height: height, fit: fit,
            errorBuilder: (_, __, ___) {
            return AppSkeletonWidget(width: width, height: height);
          });
  }
}

Widget buildSvg({
  Key? key,
  required String asset,
  bool matchTextDirection = false,
  AssetBundle? bundle,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  AlignmentGeometry alignment = Alignment.center,
  bool allowDrawingOutsideViewBox = false,
  WidgetBuilder? placeholderBuilder,
  String? semanticsLabel,
  bool excludeFromSemantics = false,
  SvgTheme theme = const SvgTheme(),
  ColorFilter? colorFilter,
}) {
  return SvgPicture.asset(
    asset,
    key: key,
    matchTextDirection: matchTextDirection,
    bundle: bundle,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
    placeholderBuilder: placeholderBuilder,
    semanticsLabel: semanticsLabel,
    excludeFromSemantics: excludeFromSemantics,
    theme: theme,
    colorFilter: colorFilter,
  );
}
