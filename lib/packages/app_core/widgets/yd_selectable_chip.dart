import 'package:photo_ai/packages/index.dart';

class YDSelectableChip extends StatelessWidget {
  const YDSelectableChip({
    super.key,
    this.prefixIcon,
    required this.label,
    this.selected = false,
    this.chipBackgroundColor,
    this.style,
    this.borderColor,
    this.padding,
    this.height,
  });

  final Widget? prefixIcon;
  final bool selected;
  final String label;
  final Color? chipBackgroundColor;
  final Color? borderColor;
  final TextStyle? style;
  final EdgeInsets? padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ??
          EdgeInsets.fromLTRB(
            context.padding12X,
            context.padding4X,
            context.padding12X,
            context.padding6X,
          ),
      decoration: ShapeDecoration(
        color: selected
            ? context.color.alertInfoBackground
            : (chipBackgroundColor ?? context.color.white),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: borderColor ??
                (selected
                    ? context.color.alertInfoBorder
                    : context.color.borderBorder),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixIcon ?? const SizedBox.shrink(),
          if (prefixIcon != null) context.width4X,
          AppText(
            label,
            style: style ??
                context.subtitle3.copyWith(
                  color: selected
                      ? context.color.alertInfo
                      : context.color.textTitle,
                ),
          )
        ],
      ),
    );
  }
}
